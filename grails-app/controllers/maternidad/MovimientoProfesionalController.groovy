package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class MovimientoProfesionalController {

    static scaffold = true

    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoProfesional.list(params), model: [movimientoProfesionalInstanceCount: MovimientoProfesional.count()]
    }

    def show(MovimientoProfesional movimientoProfesionalInstance) {
        respond movimientoProfesionalInstance
    }

    def create() {
        respond new MovimientoProfesional(params)
    }

    @Transactional
    def save(MovimientoProfesional movimientoProfesionalInstance) {
        if (movimientoProfesionalInstance == null) {
            notFound()
            return
        }

        if (movimientoProfesionalInstance.hasErrors()) {
            respond movimientoProfesionalInstance.errors, view: 'create'
            return
        }

        movimientoProfesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoProfesional.label', default: 'MovimientoProfesional'), movimientoProfesionalInstance.id])
                redirect movimientoProfesionalInstance
            }
            '*' { respond movimientoProfesionalInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoProfesional movimientoProfesionalInstance) {
        respond movimientoProfesionalInstance
    }

    @Transactional
    def update(MovimientoProfesional movimientoProfesionalInstance) {
        if (movimientoProfesionalInstance == null) {
            notFound()
            return
        }

        if (movimientoProfesionalInstance.hasErrors()) {
            respond movimientoProfesionalInstance.errors, view: 'edit'
            return
        }

        movimientoProfesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoProfesional.label', default: 'MovimientoProfesional'), movimientoProfesionalInstance.id])
                redirect movimientoProfesionalInstance
            }
            '*' { respond movimientoProfesionalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoProfesional movimientoProfesionalInstance) {

        if (movimientoProfesionalInstance == null) {
            notFound()
            return
        }

        movimientoProfesionalInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoProfesional.label', default: 'MovimientoProfesional'), movimientoProfesionalInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoProfesional.label', default: 'MovimientoProfesional'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
