package maternidad

import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ReciboController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def jasperService

/*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Recibo.list(params), model:[reciboInstanceCount: Recibo.count()]
    }
*/

    def index = {

        def query = {
            if (params.fechaDesde && params.fechaHasta) {
                between('fecha', params.fechaDesde as Date, params.fechaHasta as Date)
                // between('fecha',Date.from, Date.parse("dd-MM-yyyy", params.fechaDesde))

            }
            if (params.nro) {

                eq('nro', params.nro.toInteger())

            }

            if (params.profesional) {

                eq('profesional.id', params.profesional.toLong())

            }



            if (params.sort) {
                order(params.sort, params.order)
            }
        }

        def criteria = Recibo.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def recibos = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [fechaDesde: params.fechaDesde as Date, fechaHasta: params.fechaHasta as Date, profesional: params.profesional, nro: params.nro]

        def model = [reciboInstanceList: recibos, reciboInstanceTotal: recibos?.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        } else {
            model
        }
    }



    def show(Recibo reciboInstance) {
        respond reciboInstance
    }

    def create() {
        def recibo=new Recibo(params)
        recibo.nro=obtenerUltimoNumero()
        recibo.total=0
        respond recibo
    }

    @Transactional
    def save(Recibo reciboInstance) {
        if (reciboInstance == null) {
            notFound()
            return
        }

        if (reciboInstance.hasErrors()) {
            respond reciboInstance.errors, view:'create'
            return
        }

        reciboInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recibo.label', default: 'Recibo'), reciboInstance.id])
                redirect action: "edit",params: [id:reciboInstance.id]
            }
            '*' { respond reciboInstance, [status: CREATED] }
        }
    }

    def edit(Recibo reciboInstance) {
        respond reciboInstance
    }

    @Transactional
    def update(Recibo reciboInstance) {
        if (reciboInstance == null) {
            notFound()
            return
        }

        if (reciboInstance.hasErrors()) {
            respond reciboInstance.errors, view:'edit'
            return
        }

        reciboInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Recibo.label', default: 'Recibo'), reciboInstance.id])
                redirect action: "edit",params: [id:reciboInstance.id]
            }
            '*'{ respond reciboInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Recibo reciboInstance) {

        if (reciboInstance == null) {
            notFound()
            return
        }

        reciboInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Recibo.label', default: 'Recibo'), reciboInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recibo.label', default: 'Recibo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def agregarDetalle = {

        if (params.recibo) {
            def recibo = Recibo.get(params.recibo)
            def detalleRecibo = new DetalleRecibo()
            detalleRecibo.conceptoProfesional = ConceptoProfesional.get(params.concepto)
            detalleRecibo.debitoCredito = (params.debitocredito == "credito") ? true : false
            detalleRecibo.valor = params.valorDetalle as Double
            detalleRecibo.descripcion=(params?.descripcion)?:""
            detalleRecibo.save(flush: true)
            recibo.addToDetalle(detalleRecibo)
            def total=0
            recibo.detalle.each {
                if (it.debitoCredito) {
                    total = total + it.valor
                } else {
                    total = total - it.valor
                }
            }

            recibo.total = total
            recibo.save(flush: true)
            redirect action: 'edit', params: [id: recibo.id, total: total]
        }

    }

    def eliminarDetalle = {

        if (params.idRecibo) {
           def recibo=Recibo.get(params.idRecibo)
            def detalleRecibo=DetalleRecibo.get(params.idDetalle)
            recibo.removeFromDetalle(detalleRecibo)
            def total=0
            recibo.detalle.each {
                if (it.debitoCredito) {
                    total = total + it.valor
                } else {
                    total = total - it.valor
                }
            }

            recibo.total = total
            recibo.save(flush: true)
            redirect action: 'edit', params: [id: recibo.id]
        }

    }

    def editarDetalle = {

        if (params.idDetalle) {
            redirect action: "edit" , controller: "detalleRecibo" ,params:[id:params.idDetalle,idRecibo:params.idRecibo]

        }

    }


    // ***************************
    // Generar PDF para impresion
    // ***************************
    def private generarPDF(reporte, titulo, data, nombre) {
        //Seteamos los directorios de los subreportes y las imagenes
        def params = [:]

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



    def imprimirRecibo= {


        def recibo = Recibo.get(params.id)
        def directorio = servletContext.getRealPath('/reports') + "/"


        try {
         def  data = ReciboMaternidad.generar(recibo)

            generarPDF('Recibos.jasper', "Recibo", [data], 'recibo'  + "-" + recibo?.nro)

        } catch (Exception ex) {
            ex
        }


    }

    private obtenerUltimoNumero(){
        def numero = 1
        def lista = Recibo.withCriteria{

            order('nro', 'desc')
            maxResults(1)
        }
        if(lista){
            numero = lista.get(0).nro + 1
        }
        numero
    }


}
