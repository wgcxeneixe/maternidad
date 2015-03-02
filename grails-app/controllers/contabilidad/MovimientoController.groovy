package contabilidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
class MovimientoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Movimiento.list(params), model:[movimientoInstanceCount: Movimiento.count()]
    }

    def show(Movimiento movimientoInstance) {
        respond movimientoInstance
    }

    def create() {
        respond new Movimiento(params)
    }

    @Transactional
    def save(Movimiento movimientoInstance) {
        if (movimientoInstance == null) {
            notFound()
            return
        }

        if (movimientoInstance.hasErrors()) {
            respond movimientoInstance.errors, view:'create'
            return
        }

        movimientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), movimientoInstance.id])
                redirect movimientoInstance
            }
            '*' { respond movimientoInstance, [status: CREATED] }
        }
    }

    def edit(Movimiento movimientoInstance) {
        respond movimientoInstance
    }

    @Transactional
    def update(Movimiento movimientoInstance) {
        if (movimientoInstance == null) {
            notFound()
            return
        }

        if (movimientoInstance.hasErrors()) {
            respond movimientoInstance.errors, view:'edit'
            return
        }

        movimientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Movimiento.label', default: 'Movimiento'), movimientoInstance.id])
                redirect movimientoInstance
            }
            '*'{ respond movimientoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Movimiento movimientoInstance) {

        if (movimientoInstance == null) {
            notFound()
            return
        }

        movimientoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Movimiento.label', default: 'Movimiento'), movimientoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
