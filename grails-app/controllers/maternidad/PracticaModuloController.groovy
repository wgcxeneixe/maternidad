package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class PracticaModuloController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PracticaModulo.list(params), model: [practicaModuloInstanceCount: PracticaModulo.count()]
    }

    def show(PracticaModulo practicaModuloInstance) {
        respond practicaModuloInstance
    }

    def create() {
        respond new PracticaModulo(params)
    }

    @Transactional
    def save(PracticaModulo practicaModuloInstance) {
        if (practicaModuloInstance == null) {
            notFound()
            return
        }

        if (practicaModuloInstance.hasErrors()) {
            respond practicaModuloInstance.errors, view: 'create'
            return
        }

        practicaModuloInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'practicaModulo.label', default: 'PracticaModulo'), practicaModuloInstance.id])
                redirect practicaModuloInstance
            }
            '*' { respond practicaModuloInstance, [status: CREATED] }
        }
    }

    def edit(PracticaModulo practicaModuloInstance) {
        respond practicaModuloInstance
    }

    @Transactional
    def update(PracticaModulo practicaModuloInstance) {
        if (practicaModuloInstance == null) {
            notFound()
            return
        }

        if (practicaModuloInstance.hasErrors()) {
            respond practicaModuloInstance.errors, view: 'edit'
            return
        }

        practicaModuloInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PracticaModulo.label', default: 'PracticaModulo'), practicaModuloInstance.id])
                redirect practicaModuloInstance
            }
            '*' { respond practicaModuloInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PracticaModulo practicaModuloInstance) {

        if (practicaModuloInstance == null) {
            notFound()
            return
        }

        practicaModuloInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PracticaModulo.label', default: 'PracticaModulo'), practicaModuloInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'practicaModulo.label', default: 'PracticaModulo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
