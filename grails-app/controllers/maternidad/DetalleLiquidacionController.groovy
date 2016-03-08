package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_LIQUIDACION')")

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
        def liquidacion = Liquidacion.read(params?.liquidacion_id)
        def detalleLiquidacionInstance = new DetalleLiquidacion()
        detalleLiquidacionInstance.liquidacion = liquidacion

        respond detalleLiquidacionInstance
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
        detalleLiquidacionInstance.monto = (params?.monto) ? params?.monto as Double : 0
        detalleLiquidacionInstance.save flush:true
        def liquidacionInstance = detalleLiquidacionInstance.liquidacion
        liquidacionInstance.detallesLiquidacion.add(detalleLiquidacionInstance)
        liquidacionInstance.actualizarTotales()
        liquidacionInstance.save()
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleLiquidacion.label', default: 'DetalleLiquidacion'), detalleLiquidacionInstance.id])
                redirect liquidacionInstance
            }
            '*' { respond liquidacionInstance, [status: CREATED] }
        }
    }
    @Transactional
    def edit(DetalleLiquidacion detalleLiquidacionInstance) {
        if(params?.boolean('borrar')){
            if (detalleLiquidacionInstance == null) {
                notFound()
                return
            }
            detalleLiquidacionInstance = DetalleLiquidacion.read(detalleLiquidacionInstance.id)
            def liquidacionInstance = detalleLiquidacionInstance?.liquidacion
            detalleLiquidacionInstance.delete flush:true
            redirect(controller: 'liquidacion', action: 'show', params: [id:liquidacionInstance.id])
        }else {
            respond detalleLiquidacionInstance
        }
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
        detalleLiquidacionInstance.monto = (params?.monto) ? params?.monto as Double : 0
        detalleLiquidacionInstance.save flush:true
        def liquidacionInstance = detalleLiquidacionInstance.liquidacion
        liquidacionInstance.actualizarTotales()
        liquidacionInstance.save(flush: true)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DetalleLiquidacion.label', default: 'DetalleLiquidacion'), detalleLiquidacionInstance.id])
                redirect liquidacionInstance
            }
            '*' { respond liquidacionInstance, [status: CREATED] }
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
