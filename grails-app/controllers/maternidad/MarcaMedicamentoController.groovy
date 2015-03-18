package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class MarcaMedicamentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static  scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MarcaMedicamento.list(params), model: [marcaMedicamentoInstanceCount: MarcaMedicamento.count()]
    }

    def show(MarcaMedicamento marcaMedicamentoInstance) {
        respond marcaMedicamentoInstance
    }

    def create() {
        respond new MarcaMedicamento(params)
    }

    @Transactional
    def save(MarcaMedicamento marcaMedicamentoInstance) {
        if (marcaMedicamentoInstance == null) {
            notFound()
            return
        }

        if (marcaMedicamentoInstance.hasErrors()) {
            respond marcaMedicamentoInstance.errors, view: 'create'
            return
        }

        marcaMedicamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'marcaMedicamento.label', default: 'MarcaMedicamento'), marcaMedicamentoInstance.id])
                redirect marcaMedicamentoInstance
            }
            '*' { respond marcaMedicamentoInstance, [status: CREATED] }
        }
    }

    def edit(MarcaMedicamento marcaMedicamentoInstance) {
        respond marcaMedicamentoInstance
    }

    @Transactional
    def update(MarcaMedicamento marcaMedicamentoInstance) {
        if (marcaMedicamentoInstance == null) {
            notFound()
            return
        }

        if (marcaMedicamentoInstance.hasErrors()) {
            respond marcaMedicamentoInstance.errors, view: 'edit'
            return
        }

        marcaMedicamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MarcaMedicamento.label', default: 'MarcaMedicamento'), marcaMedicamentoInstance.id])
                redirect marcaMedicamentoInstance
            }
            '*' { respond marcaMedicamentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MarcaMedicamento marcaMedicamentoInstance) {

        if (marcaMedicamentoInstance == null) {
            notFound()
            return
        }

        marcaMedicamentoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MarcaMedicamento.label', default: 'MarcaMedicamento'), marcaMedicamentoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcaMedicamento.label', default: 'MarcaMedicamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
