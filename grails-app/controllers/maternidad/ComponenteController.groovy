package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ComponenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Componente.list(params), model: [componenteInstanceCount: Componente.count()]
    }

    def show(Componente componenteInstance) {
        respond componenteInstance
    }

    def create() {
        respond new Componente(params)
    }

    @Transactional
    def save(Componente componenteInstance) {
        if (componenteInstance == null) {
            notFound()
            return
        }

        if (componenteInstance.hasErrors()) {
            respond componenteInstance.errors, view: 'create'
            return
        }

        componenteInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'componente.label', default: 'Componente'), componenteInstance.id])
                redirect componenteInstance
            }
            '*' { respond componenteInstance, [status: CREATED] }
        }
    }

    def edit(Componente componenteInstance) {
        respond componenteInstance
    }

    @Transactional
    def update(Componente componenteInstance) {
        if (componenteInstance == null) {
            notFound()
            return
        }

        if (componenteInstance.hasErrors()) {
            respond componenteInstance.errors, view: 'edit'
            return
        }

        componenteInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Componente.label', default: 'Componente'), componenteInstance.id])
                redirect componenteInstance
            }
            '*' { respond componenteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Componente componenteInstance) {

        if (componenteInstance == null) {
            notFound()
            return
        }

        componenteInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Componente.label', default: 'Componente'), componenteInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'componente.label', default: 'Componente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
