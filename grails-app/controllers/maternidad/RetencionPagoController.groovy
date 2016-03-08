package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_LIQUIDACION')")
@Transactional(readOnly = true)
class RetencionPagoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RetencionPago.list(params), model:[retencionPagoInstanceCount: RetencionPago.count()]
    }

    def show(RetencionPago retencionPagoInstance) {
        respond retencionPagoInstance
    }

    def create() {
        def pago = PagoFactura.read(params.long('id'))
        def retencion = new RetencionPago(pagoFactura: pago)
        respond retencion
    }

    @Transactional
    def save(RetencionPago retencionPagoInstance) {
        if (retencionPagoInstance == null) {
            notFound()
            return
        }

        if (retencionPagoInstance.hasErrors()) {
            respond retencionPagoInstance.errors, view:'create'
            return
        }

        retencionPagoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'retencionPago.label', default: 'RetencionPago'), retencionPagoInstance.id])
                redirect retencionPagoInstance.pagoFactura
            }
            '*' { respond retencionPagoInstance, [status: CREATED] }
        }
    }

    def edit(RetencionPago retencionPagoInstance) {
        respond retencionPagoInstance
    }

    @Transactional
    def update(RetencionPago retencionPagoInstance) {
        if (retencionPagoInstance == null) {
            notFound()
            return
        }

        if (retencionPagoInstance.hasErrors()) {
            respond retencionPagoInstance.errors, view:'edit'
            return
        }

        retencionPagoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RetencionPago.label', default: 'RetencionPago'), retencionPagoInstance.id])
                redirect retencionPagoInstance
            }
            '*'{ respond retencionPagoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RetencionPago retencionPagoInstance) {

        if (retencionPagoInstance == null) {
            notFound()
            return
        }

        retencionPagoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RetencionPago.label', default: 'RetencionPago'), retencionPagoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'retencionPago.label', default: 'RetencionPago'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
