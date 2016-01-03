package maternidad

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class LiquidacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def jasperService

    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.order="desc"
        respond Liquidacion.listOrderById(params), model: [liquidacionInstanceCount: Liquidacion.count()]
    }
*/


    def index = {


        def query = {

            if (params.planilla) {
               factura{ planillaInternacion{
                    eq('numeroIngreso', params.planilla.toInteger())
                }
               }
            }

            if (params.profesional) {

                eq('profesional.id', params.profesional.toLong())

            }

            if (params.periodo) {
                factura{
                ilike('periodo', '%' + params.periodo + '%')
                }
                }


            if (params.sort) {
                order(params.sort, params.order)
            }
        }

        def criteria = Liquidacion.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def liquidaciones = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [ profesional: params.profesional, planilla: params.planilla,periodo:params.periodo]

        def model = [liquidacionInstanceList: liquidaciones, liquidacionInstanceCount: liquidaciones?.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        } else {
            model
        }
    }

    def show(Liquidacion liquidacionInstance) {
        respond liquidacionInstance
    }

    def create() {
        respond new Liquidacion(params)
    }

    @Transactional
    def save(Liquidacion liquidacionInstance) {
        if (liquidacionInstance == null) {
            notFound()
            return
        }

        if (liquidacionInstance.hasErrors()) {
            respond liquidacionInstance.errors, view: 'create'
            return
        }

        liquidacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'liquidacion.label', default: 'Liquidacion'), liquidacionInstance.id])
                redirect liquidacionInstance
            }
            '*' { respond liquidacionInstance, [status: CREATED] }
        }
    }

    def liquidar = {
        def liquidacionInstance = Liquidacion.read(params?.long('id'))
        def numeroRecibo = Liquidacion.withCriteria {
            projections {
                max('numeroRecibo')
            }
        }
        if (!(numeroRecibo && numeroRecibo.first())) numeroRecibo = [0]


        def numeroLiquidacion = Liquidacion.withCriteria {
            projections {
                max('numeroLiquidacion')
            }
        }
        if (!(numeroLiquidacion && numeroLiquidacion.first())) numeroLiquidacion = [0]

        liquidacionInstance.numeroLiquidacion = numeroLiquidacion.first()+1
        liquidacionInstance.numeroRecibo = numeroRecibo.first()+1
       // liquidacionInstance.fecha=new Date()
        liquidacionInstance.save(flush: true)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Liquidacion.label', default: 'Liquidacion'), liquidacionInstance.id])
                redirect liquidacionInstance
            }
            '*' { respond liquidacionInstance, [status: OK] }
        }
    }

    def edit(Liquidacion liquidacionInstance) {
        respond liquidacionInstance
    }

    def borrar={
        def liquidacionInstance = Liquidacion.read(params.long('id'))
        if (liquidacionInstance == null) {
            notFound()
            return
        }
        liquidacionInstance.delete flush: true

        redirect(action: index)
    }

    @Transactional
    def delete(Liquidacion liquidacionInstance) {
        if (liquidacionInstance == null) {
            notFound()
            return
        }

        liquidacionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Liquidacion.label', default: 'Liquidacion'), liquidacionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'liquidacion.label', default: 'Liquidacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def configurarLiquidacion = {
        def listaPagos = PagoFactura.withCriteria {
            le('porcentajeLiquidado', new Double(100))
            isNotNull('facturaPeriodo')
        }
        [listaPagos: listaPagos]
    }

    def armarLiquidacion = {
        def listaPagos = []
        def listaConceptos = ConceptoProfesional.findAllByActivo(true)
        def listaLiquidaciones = []
        try {
            listaPagos = PagoFactura.withCriteria {
                le('porcentajeLiquidado', Double.valueOf(100))
                gt('porcentajeALiquidar', Double.valueOf(0))
                isNotNull('facturaPeriodo')
            }

            listaLiquidaciones = armarLiquidaciones(listaPagos, listaConceptos)

        } catch (e) {
            flash.errors = "Ocurrió un error al consultar la liquidación"
            redirect(action: "configurarLiquidacion", controller: Liquidacion)
        }
        render(template: "confirmarLiquidacion", model: [listaLiquidaciones: listaLiquidaciones, listaConceptoProfesional: listaConceptos, listaPagoFactura: listaPagos])
    }

    private Collection<Liquidacion> armarLiquidaciones(List<PagoFactura> listaPagos, List<ConceptoPorProfesional> listaConceptos) {
        def mapaLiquidaciones = [:]
        listaPagos?.each { PagoFactura pago ->
            pago?.facturaPeriodo?.facturas?.each { Factura fac ->
                fac?.planillaInternacion?.detalles?.profesional?.each {
                    if (it && !mapaLiquidaciones.containsKey(it)) mapaLiquidaciones.put(it, new Liquidacion(profesional: it))
                }

            }
        }

//        Profesional.findAllByActivo(true)?.each { profesional ->
//            mapaLiquidaciones.put(profesional, new Liquidacion(profesional: profesional))
//        }

        listaPagos.each {
            pago ->
                mapaLiquidaciones.values()?.each {
                    Liquidacion liq ->
                        liq.agregarPagoFactura(pago)

                }
        }

        mapaLiquidaciones.values()?.each {
            Liquidacion liquidacion ->
                liquidacion.agregarConceptosProfesional(listaConceptos?.codigo)
        }
        return mapaLiquidaciones.values()

    }

//    def liquidarAction = {
//        println "entro al liquidar"
//        println params
//        println params?.dump()
//        return null
//    }

    @Transactional
    def liquidarAction() {

        def conceptos = params?.getList('listaConceptoProfesional')
        def listaPagos = []
        def listaConceptos = ConceptoProfesional.findAllByIdInList(conceptos)
        def listaLiquidaciones = []
        try {
            listaPagos = PagoFactura.withCriteria {
                le('porcentajeLiquidado', Double.valueOf(100))
                gt('porcentajeALiquidar', Double.valueOf(0))
            }

            listaLiquidaciones = armarLiquidaciones(listaPagos, listaConceptos)
            listaLiquidaciones?.each {
                it.save(flush: true)
            }

        } catch (e) {
            flash.errors = "Ocurrió un error al consultar la liquidación"
            redirect(action: "configurarLiquidacion", controller: "liquidacion")
        }

        flash.message = "Se generó la liquidación correctamente"
        redirect(controller: "liquidacion")
    }


    def reportLiquidacion = {

        def liquidacion = Liquidacion.read(params.long('id'))
        // Creo un array para guardar los datos
        def data = [:]
        data += [cuit: liquidacion?.profesional?.persona?.cuit?.toString()]
        data += [nombre: liquidacion?.profesional?.persona?.apellido]
        data += [fecha: liquidacion?.fecha?.format('dd/MM/yyyy')]
        data += [bruto: liquidacion?.montoBruto]
        data += [neto: liquidacion?.montoNeto]
        data += [descuentos: liquidacion?.montoBruto - liquidacion?.montoNeto]
        data += [maticula: liquidacion?.profesional?.matriculaProvincial]

        def listaHaberesToReport = []
        def listaRetencionesToReport = []

        liquidacion?.detallesLiquidacion?.each { DetalleLiquidacion detalle ->
            def item = [:]
            if (!detalle.debito) {
                item += [descripcion: detalle.detalle]
                item += [porcentaje: detalle?.porcentajePagoFacturaLiquidado]
                item += [importe: detalle?.monto]
//                item+=[codigo:detalle?.detalleFactura?.practica?.codigo]
//                item+=[nombre:detalle?.detalleFactura?.planillaInternacion?.paciente]
//                item+=[fecha:detalle?.pagoFactura?.facturaPeriodo?.periodo]
//                item+=[fechaPractica:detalle?.detalleFactura?.fecha?.format('dd/MM/yyyy')]
                listaHaberesToReport += item
            } else {
                def concepto = ''
                if(detalle?.conceptoProfesional)concepto+='('+detalle?.conceptoProfesional?.codigo+'-'+detalle?.conceptoProfesional?.nombre+') '
                if(detalle?.detalle) concepto +=detalle?.detalle
                item += [descripcion: concepto]
                item += [importe: detalle?.monto]
                listaRetencionesToReport += item
            }
        }

        data += [listaHaberesToReport: listaHaberesToReport]
        data += [listaRetencionesToReport: listaRetencionesToReport]

        try {
            generarPDF('liquidacion.jasper', "liquidacion-${liquidacion.profesional}", [data], "liquidacion-${liquidacion.profesional}")
        } catch (e) {

        }
    }

    // ***************************
    // Generar PDF para impresion
    // ***************************
    def private generarPDF(reporte, titulo, data, nombre) {
        //Seteamos los directorios de los subreportes y las imagenes
        def params = [:]
//        println data.dump()
        params.SUBREPORT_DIR = servletContext.getRealPath('/reports') + "/"
        // Definimos el reporte
        def reportDef = new JasperReportDef(name: reporte,
                fileFormat: JasperExportFormat.PDF_FORMAT,
                reportData: data,
                parameters: params
        )
        // Establecemos un nombre de archivo único...
        response.setHeader("Content-disposition", "attachment; filename=\"${nombre}.pdf\"");
        // Establecemos el tipo de archivo a PDF...
        response.contentType = "application/pdf"

        // Enviamos el contenido del PDF
        response.outputStream << jasperService.generateReport(reportDef).toByteArray()

    }

}
