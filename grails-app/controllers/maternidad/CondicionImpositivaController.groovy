package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class CondicionImpositivaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CondicionImpositiva.list(params), model: [condicionImpositivaInstanceCount: CondicionImpositiva.count()]
    }

    def show(CondicionImpositiva condicionImpositivaInstance) {
        respond condicionImpositivaInstance
    }

    def create() {
        respond new CondicionImpositiva(params)
    }

    @Transactional
    def save(CondicionImpositiva condicionImpositivaInstance) {
        if (condicionImpositivaInstance == null) {
            notFound()
            return
        }

        if (condicionImpositivaInstance.hasErrors()) {
            respond condicionImpositivaInstance.errors, view: 'create'
            return
        }

        condicionImpositivaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'condicionImpositiva.label', default: 'CondicionImpositiva'), condicionImpositivaInstance.id])
                redirect condicionImpositivaInstance
            }
            '*' { respond condicionImpositivaInstance, [status: CREATED] }
        }
    }

    def edit(CondicionImpositiva condicionImpositivaInstance) {
        respond condicionImpositivaInstance
    }

    @Transactional
    def update(CondicionImpositiva condicionImpositivaInstance) {
        if (condicionImpositivaInstance == null) {
            notFound()
            return
        }

        if (condicionImpositivaInstance.hasErrors()) {
            respond condicionImpositivaInstance.errors, view: 'edit'
            return
        }

        condicionImpositivaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CondicionImpositiva.label', default: 'CondicionImpositiva'), condicionImpositivaInstance.id])
                redirect condicionImpositivaInstance
            }
            '*' { respond condicionImpositivaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CondicionImpositiva condicionImpositivaInstance) {

        if (condicionImpositivaInstance == null) {
            notFound()
            return
        }

        condicionImpositivaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CondicionImpositiva.label', default: 'CondicionImpositiva'), condicionImpositivaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicionImpositiva.label', default: 'CondicionImpositiva'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
