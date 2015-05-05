package maternidad

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

import static org.springframework.http.HttpStatus.*

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class LiquidacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def jasperService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Liquidacion.list(params), model: [liquidacionInstanceCount: Liquidacion.count()]
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

    def edit(Liquidacion liquidacionInstance) {
        respond liquidacionInstance
    }

    @Transactional
    def update(Liquidacion liquidacionInstance) {
        if (liquidacionInstance == null) {
            notFound()
            return
        }

        if (liquidacionInstance.hasErrors()) {
            respond liquidacionInstance.errors, view: 'edit'
            return
        }

        liquidacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Liquidacion.label', default: 'Liquidacion'), liquidacionInstance.id])
                redirect liquidacionInstance
            }
            '*' { respond liquidacionInstance, [status: OK] }
        }
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
//        println params.dump()
        def liquidacion = Liquidacion.read(params.long('id'))

        // Creo un array para guardar los datos
        def data = [:]
        data += [cuit: liquidacion.profesional.persona.cuit]
        data += [nombre: liquidacion.profesional?.persona?.apellido]
        data += [fecha: liquidacion.fecha.format('dd/MM/yyyy')]
        data += [bruto: liquidacion.montoBruto.toString()]
        data += [neto: liquidacion.montoNeto.toString()]
        data += [descuentos: (liquidacion.montoBruto - liquidacion.montoNeto).toString()]
        data += [maticula: liquidacion.profesional.matriculaProvincial]

        def listaHaberesToReport=[:]
        def listaRetencionesToReport=[:]

        liquidacion.detallesLiquidacion?.each {DetalleLiquidacion detalle->
            if(detalle.debito){
                listaRetencionesToReport+=[codigo:detalle?.detalleFactura?.practica?.codigo]
                listaRetencionesToReport+=[descripcion:detalle?.detalleFactura?.practica?.nombre]
                listaRetencionesToReport+=[porcentaje:detalle?.porcentajePagoFacturaLiquidado?.toString()]
                listaRetencionesToReport+=[nombre:detalle?.detalleFactura?.planillaInternacion?.paciente]
                listaRetencionesToReport+=[fecha:detalle?.pagoFactura?.facturaPeriodo?.periodo]
                listaRetencionesToReport+=[importe:detalle?.monto?.toString()]
                listaRetencionesToReport+=[fechaPractica:detalle?.detalleFactura?.fecha?.format('dd/MM/yyyy')]
            }else{
                listaHaberesToReport+=[descripcion: detalle?.detalle]
                listaHaberesToReport+=[importe: detalle?.monto?.toString()]
            }
        }

        data += [listaHaberesToReport: [listaHaberesToReport]]
        data += [listaRetencionesToReport: [listaRetencionesToReport]]


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
