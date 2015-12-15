package maternidad

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import maternidad.Factura
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

import java.lang.reflect.Array

import static org.springframework.http.HttpStatus.*

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class PagoFacturaController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def jasperService
    def liquidacionService
    def beforeInterceptor = {

    }


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PagoFactura.list(params), model: [pagoFacturaInstanceCount: PagoFactura.count()]
    }

    def show(PagoFactura pagoFacturaInstance) {
        respond pagoFacturaInstance
    }

    def create() {

        def pagoFactura = new PagoFactura(params)
        if (params?.pagoPeriodo) {
            pagoFactura?.facturaPeriodo = FacturaPeriodo?.findById(params?.id)
        } else {
            pagoFactura?.factura = Factura?.findById(params?.id)
        }
        if (pagoFactura.factura) {
            pagoFactura.monto = pagoFactura.factura.totalFacturado - pagoFactura.factura.totalPagado - pagoFactura.factura.totalRetencion
        }
        if (pagoFactura.facturaPeriodo) {
            pagoFactura.monto = pagoFactura.facturaPeriodo.totalFacturado - pagoFactura.facturaPeriodo.totalPagado - pagoFactura.facturaPeriodo.totalRetencion
        }
        pagoFactura.porcentajeALiquidar=100
        respond pagoFactura

    }

    @Transactional
    def save(PagoFactura pagoFacturaInstance) {
        if (pagoFacturaInstance == null) {
            notFound()
            return
        }

        if (pagoFacturaInstance.hasErrors()) {
            respond pagoFacturaInstance.errors, view: 'create'
            return
        } else {
            FacturaPeriodo facturaPeriodoSeleccionada
            Factura facturaSeleccionada
            if (pagoFacturaInstance?.facturaPeriodo) {
                facturaPeriodoSeleccionada = FacturaPeriodo?.get(pagoFacturaInstance?.facturaPeriodo?.id)
                facturaPeriodoSeleccionada.agregarPago(pagoFacturaInstance)
                flash.message = 'Se ha agregado un pago a su factura '
                render(view: 'index', params: [pagoFacturaInstance: pagoFacturaInstance])
            }else{
                if (pagoFacturaInstance?.factura) {
                    facturaSeleccionada = Factura?.get(pagoFacturaInstance?.factura?.id)
                    facturaSeleccionada.agregarPago(pagoFacturaInstance)
                    liquidacionService.armarLiquidacionDelPago(pagoFacturaInstance)
                    flash.message = 'Se ha agregado un pago a su factura '
                    redirect(action: "show", id: pagoFacturaInstance?.id)
                }else{
                    flash.message = 'Ocurrió un error al generar el pago, se perdió la referencia a la factura'
                    respond pagoFacturaInstance.errors, view: 'create'
                }
            }


        }
    }

    def guardarPago = {
        PagoFactura pagoFacturaInstance = new PagoFactura()
        pagoFacturaInstance.properties = params
        if (pagoFacturaInstance.hasErrors()) {
            render(view: 'create', controller: PagoFactura, params: [pagoFacturaInstance: pagoFacturaInstance])

        } else {
            def facturaSeleccionada = FacturaPeriodo?.get(pagoFacturaInstance?.factura?.id)
            facturaSeleccionada.agregarPago(pagoFacturaInstance)
                flash.message = 'Se ha agregado un pago a su factura '
                render(view: 'index', params: [pagoFacturaInstance: pagoFacturaInstance])
            }

    }

    def edit(PagoFactura pagoFacturaInstance) {
        respond pagoFacturaInstance
    }

    @Transactional
    def update(PagoFactura pagoFacturaInstance) {
        if (pagoFacturaInstance == null) {
            notFound()
            return
        }

        if (pagoFacturaInstance.hasErrors()) {
            respond pagoFacturaInstance.errors, view: 'edit'
            return
        }

        pagoFacturaInstance.save flush: true
        pagoFacturaInstance?.facturaPeriodo?.actualizar()

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PagoFactura.label', default: 'PagoFactura'), pagoFacturaInstance.id])
                redirect pagoFacturaInstance
            }
            '*' { respond pagoFacturaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PagoFactura pagoFacturaInstance) {

        if (pagoFacturaInstance == null) {
            notFound()
            return
        }

        pagoFacturaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PagoFactura.label', default: 'PagoFactura'), pagoFacturaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoFactura.label', default: 'PagoFactura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def reportListaPagos = {
//        println params.dump()
        def listaId = params.list('id')
//        println listaId.class
        def listaIdLong = [1]


        def nombrePDF = ''
        // Creo un array para guardar los datos
        def data = [:]
        def fecha = new Date()
        data += [fecha: fecha.format('dd/MM/yyyy')]
        def items = [:]

        def listaPagos = PagoFactura.findAllByIdInList(listaIdLong)
        def totalFacturas=0
        def totalALiquidar=0
        def totalPagado=0

        listaPagos.each { PagoFactura pagoFactura ->
            items += [fechaPago: pagoFactura.fecha?.format('dd/MM/yyyy')]
            items += [obraSocial: pagoFactura.facturaPeriodo.plan.codigo + pagoFactura.facturaPeriodo.plan.nombre]
            items += [totalFacturado: pagoFactura.facturaPeriodo.getTotalFacturado()]
            items += [totalPagado: pagoFactura.monto]
            items += [periodo: pagoFactura.facturaPeriodo.periodo]
            items += [porcentaje: pagoFactura.porcentajeALiquidar]
            items += [totalALiquidar: pagoFactura.montoALiquidar()]
            totalFacturas+=pagoFactura.facturaPeriodo.getTotalFacturado()
            totalALiquidar+=pagoFactura.montoALiquidar()
            totalPagado+=pagoFactura.monto

        }

//        data += [pagos: items]
        data += [items: [items]]
        data += [totalFacturas: totalFacturas]
        data += [totalALiquidar: totalALiquidar]
        data += [totalPagado: totalPagado]

        try {
            generarPDF('resumenDePagos.jasper', "Detalle de Pagos", [data], 'Detalle de Pagos')
        } catch (e) {
            println e.stackTrace
            println "------------------------------------------------"
            println e.cause
            println "------------------------------------------------"
            println e.dump()
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
