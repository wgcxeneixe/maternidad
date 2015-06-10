package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")

@Transactional(readOnly = true)
class DetalleLiquidacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DetalleLiquidacion.list(params), model:[detalleLiquidacionInstanceCount: DetalleLiquidacion.count()]
    }

    def show(DetalleLiquidacion detalleLiquidacionInstance) {
        respond detalleLiquidacionInstance
    }

    def create() {
        def pago = PagoFactura.read(params?.pago_id)
        def detalle = new DetalleLiquidacion(params)
        detalle.pagoFactura = pago

        respond detalle
    }

    @Transactional
    def save(DetalleLiquidacion detalleLiquidacionInstance) {
        if (detalleLiquidacionInstance == null) {
            notFound()
            return
        }

        if (detalleLiquidacionInstance.hasErrors()) {
            respond detalleLiquidacionInstance.errors, view:'create'
            return
        }

        detalleLiquidacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleLiquidacion.label', default: 'DetalleLiquidacion'), detalleLiquidacionInstance.id])
                redirect detalleLiquidacionInstance
            }
            '*' { respond detalleLiquidacionInstance, [status: CREATED] }
        }
    }

    def edit(DetalleLiquidacion detalleLiquidacionInstance) {
        respond detalleLiquidacionInstance
    }

    @Transactional
    def update(DetalleLiquidacion detalleLiquidacionInstance) {
        if (detalleLiquidacionInstance == null) {
            notFound()
            return
        }

        if (detalleLiquidacionInstance.hasErrors()) {
            respond detalleLiquidacionInstance.errors, view:'edit'
            return
        }

        detalleLiquidacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DetalleLiquidacion.label', default: 'DetalleLiquidacion'), detalleLiquidacionInstance.id])
                redirect detalleLiquidacionInstance
            }
            '*'{ respond detalleLiquidacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DetalleLiquidacion detalleLiquidacionInstance) {

        if (detalleLiquidacionInstance == null) {
            notFound()
            return
        }

        detalleLiquidacionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DetalleLiquidacion.label', default: 'DetalleLiquidacion'), detalleLiquidacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleLiquidacion.label', default: 'DetalleLiquidacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
