package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class InternacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Internacion.list(params), model: [internacionInstanceCount: Internacion.count()]
    }

    def show(Internacion internacionInstance) {
        respond internacionInstance
    }

    def create() {
        respond new Internacion(params)
    }

    @Transactional
    def save(Internacion internacionInstance) {
        if (internacionInstance == null) {
            notFound()
            return
        }

        if (internacionInstance.hasErrors()) {
            respond internacionInstance.errors, view: 'create'
            return
        }

        internacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'internacion.label', default: 'Internacion'), internacionInstance.id])
                redirect internacionInstance
            }
            '*' { respond internacionInstance, [status: CREATED] }
        }
    }

    def edit(Internacion internacionInstance) {
        respond internacionInstance
    }

    @Transactional
    def update(Internacion internacionInstance) {
        if (internacionInstance == null) {
            notFound()
            return
        }

        if (internacionInstance.hasErrors()) {
            respond internacionInstance.errors, view: 'edit'
            return
        }

        internacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Internacion.label', default: 'Internacion'), internacionInstance.id])
                redirect internacionInstance
            }
            '*' { respond internacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Internacion internacionInstance) {

        if (internacionInstance == null) {
            notFound()
            return
        }

        internacionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Internacion.label', default: 'Internacion'), internacionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'internacion.label', default: 'Internacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
