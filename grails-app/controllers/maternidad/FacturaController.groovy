package maternidad

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import java.text.DateFormat
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class FacturaController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true
    def springSecurityService

    def selectFactura = {

        def obraSocialSeleccionada = params?.idObraSocial as Long
        def obrasocialNombre = ObraSocial.findById(obraSocialSeleccionada)
        def listaFacturasSinPagar = Factura.withCriteria {
            createAlias('plan', 'p')
            eq('anulada', false)
            //eq('pagoCompleto', false)
            eq('p.obrasocial.id', obraSocialSeleccionada)
        }
        render(template: 'listaFacturas', model: [listaFacturasSinPagar: listaFacturasSinPagar, obrasocialNombre: obrasocialNombre])
    }

    def abrirPagarFactura = {
        render(view: "pagarFacturasPorObraSocial")
    }

    def agregarPagoAFactura = {
        def factura = Factura.findById(params?.id)
        if (factura) {
            render(view: "agregarPagoAFactura", model: [factura])
        } else {
            flash.error = "Error al Buscar Factura"
            redirect(action: 'abrirPagarFactura')
        }
    }

    def verPagos = {
        def facturaSeleccionada = params?.id as Long
        def listaPagos = Factura.findById(facturaSeleccionada)
        render(template: 'listaPagos', model: [listaPagos: listaPagos?.pagosFactura, factura: listaPagos])
    }

    def agregarPago = {

    }

/*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Factura.list(params), model: [facturaInstanceCount: Factura.count()]
    }
*/

    def index = {
        def SimpleDateFormat form= new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US)
        if(!params.fechaDesde) params.fechaDesde = new Date() -365
        if(!params.fechaHasta) params.fechaHasta = new Date()

        def query = {
            if (params.fechaDesde && params.fechaHasta) {
                if(!params.filtrar){
                    between('fecha', form.parse(params.fechaDesde.toString()), form.parse(params.fechaHasta.toString()))
                }else {
                    between('fecha', params.fechaDesde as Date, params.fechaHasta as Date)
                }
                // between('fecha',Date.from, Date.parse("dd-MM-yyyy", params.fechaDesde))

            }
            if (params.planilla) {
planillaInternacion{
                eq('numeroIngreso', params.planilla.toInteger())
}
            }

            if (params.plan) {

                eq('plan.id', params.plan.toLong())

            }

            if (params.periodo) {
                ilike('periodo', '%' + params.periodo + '%')
            }


                order("planillaInternacion", "asc")
        }


        def criteria = Factura.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def facturas = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [fechaDesde:params?.fechaDesde,fechaHasta:params?.fechaHasta, plan: params.plan, planilla: params.planilla,periodo:params.periodo]

        def model = [facturaInstanceList: facturas, facturaInstanceTotal: facturas?.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        } else {
            model
        }
    }


    def show(Factura facturaInstance) {
        respond facturaInstance
    }

    def create() {
        respond new Factura(params)
    }

    @Transactional
    def save(Factura facturaInstance) {
        if (facturaInstance == null) {
            notFound()
            return
        }

        if (facturaInstance.hasErrors()) {
            respond facturaInstance.errors, view: 'create'
            return
        }

        facturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
                redirect facturaInstance
            }
            '*' { respond facturaInstance, [status: CREATED] }
        }
    }

    def edit(Factura facturaInstance) {
        respond facturaInstance
    }

    @Transactional
    def update(Factura facturaInstance) {
        if (facturaInstance == null) {
            notFound()
            return
        }

        if (facturaInstance.hasErrors()) {
            respond facturaInstance.errors, view: 'edit'
            return
        }

        facturaInstance.totalFacturado = (params?.totalFacturado) ? params?.totalFacturado as Double : 0

        facturaInstance.totalPagado = (params?.totalPagado) ? params?.totalPagado as Double : 0
        facturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Factura.label', default: 'Factura'), facturaInstance.id])
                redirect(action: 'index')
            }
            '*' { respond facturaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Factura facturaInstance) {

        if (facturaInstance == null) {
            notFound()
            return
        }

        facturaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Factura.label', default: 'Factura'), facturaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def facturar = {
        def facturaInstance = new Factura()

        def maxNroFactura = Factura.createCriteria().get {
            projections {
                max "nrofactura"
            }
        } as Long

        facturaInstance.nrofactura = (maxNroFactura) ? maxNroFactura + 1 : 0

        respond facturaInstance

    }


    def facturarSeleccionado = {

        def fecha = params.fecha
        def nroFactura = params.nrofactura as Long
        def periodo = params.periodo as Long

//listado de id de planes a facturar
        def seleccionados = params?.facturar

        /*def l = []
        seleccionados.each() { k, v -> l << k }
*/

// crear facturas por cada plan
        seleccionados.each {

            def factura = new Factura()
            factura.nrofactura = nroFactura
            factura.fecha = fecha
            factura.periodo = periodo
            factura.plan = Plan.get(it)
            def total = DetalleFactura.executeQuery("select sum(coalesce(df.valorHonorarios,0)* df.cantidad + coalesce(df.valorGastos,0)*df.cantidad ) as total from DetalleFactura df where df.factura is null and df.plan=:plan group by df.plan.id  ", [plan: factura?.plan])

            factura.totalFacturado = total?.get(0)
            factura.save(flush: true)



            def detalles = DetalleFactura.findAllByFacturaIsNullAndPlan(factura?.plan)

            detalles.each {
                it.factura = factura
                it.save(flush: true)
            }

            nroFactura++

        }

        redirect(action: "index")


    }

    @Transactional
    def aprobarFacturaSeleccionada(Factura facturaInstance) {

        if (facturaInstance == null) {
            notFound()
            return
        }

        if (facturaInstance.plan.obrasocial.enteReceptor && facturaInstance.plan.obrasocial.enteReceptor.llevaFactura) {
            if (!(params.int('nroFactura') && params.int('nroFactura') > 0)) {
                flash.errors = "El nro de factura no es un valor válido"
                return
            }

            facturaInstance.nrofactura = params.int('nroFactura')

            if (facturaInstance.hasErrors()) {
                respond facturaInstance.errors, view: 'show'
                return
            }
        }

        def estado = EstadoPlanilla.findByCodigo("FAC")
        def usuario = springSecurityService.currentUser
        facturaInstance.listaPlanillasInternacion()?.each {
            planilla ->

                planilla.estadoPlanilla = estado
                planilla.save(flush: true)

                def movimiento = new MovimientoPlanilla()
                movimiento.estadoPlanilla = estado
                movimiento.fecha = new Date()
                movimiento.planillaInternacion = planilla
                movimiento.usuario = usuario as Usuario
                movimiento.save(flush: true)

        }

        flash.message="¡Se facturó con éxito!"
        redirect(action: "index")


    }


    def exportar={

//        def c = DetalleFactura.createCriteria()
//
//        def resultado=c.list {
//            planillaInternacion {
//                eq("activo",true)
//                plan { 'in'("id", [11.toLong(), 12.toLong(), 13.toLong(),79.toLong(),80.toLong(),81.toLong(),82.toLong(),83.toLong(),84.toLong(),85.toLong(),86.toLong(),127.toLong()]) }
//            }
//
//            order("planillaInternacion")
//
//        }
//
//
//
//            def headers = ['Profesional-Nombre','Profesional-Apellido','Profesional-Razon Social'
//                           ,'Practica','Practica-Nombre','Fecha', 'Funcion','Cantidad','Valor Honorario','Valor Gasto','Paciente-Nombre','Paciente-Apellido']
//            def withProperties = ['profesional.persona.nombre','profesional.persona.apellido','profesional.persona.razonSocial'
//                                  ,'practica.codigo','practica.nombre','fecha', 'funcion','cantidad','valorHonorarios','valorGastos','planillaInternacion.paciente.nombre','planillaInternacion.paciente.apellido']
//
//            new WebXlsxExporter().with {
//                setResponseHeaders(response)
//                fillHeader(headers)
//                add(resultado, withProperties)
//                save(response.outputStream)
//            }




    }


}
