package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class MedicamentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Medicamento.list(params), model: [medicamentoInstanceCount: Medicamento.count()]
    }

    def show(Medicamento medicamentoInstance) {
        respond medicamentoInstance
    }

    def create() {
        respond new Medicamento(params)
    }

    @Transactional
    def save(Medicamento medicamentoInstance) {
        if (medicamentoInstance == null) {
            notFound()
            return
        }

        if (medicamentoInstance.hasErrors()) {
            respond medicamentoInstance.errors, view: 'create'
            return
        }

        medicamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medicamento.label', default: 'Medicamento'), medicamentoInstance.id])
                redirect medicamentoInstance
            }
            '*' { respond medicamentoInstance, [status: CREATED] }
        }
    }

    def edit(Medicamento medicamentoInstance) {
        respond medicamentoInstance
    }

    @Transactional
    def update(Medicamento medicamentoInstance) {
        if (medicamentoInstance == null) {
            notFound()
            return
        }

        if (medicamentoInstance.hasErrors()) {
            respond medicamentoInstance.errors, view: 'edit'
            return
        }

        medicamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Medicamento.label', default: 'Medicamento'), medicamentoInstance.id])
                redirect medicamentoInstance
            }
            '*' { respond medicamentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Medicamento medicamentoInstance) {

        if (medicamentoInstance == null) {
            notFound()
            return
        }

        medicamentoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Medicamento.label', default: 'Medicamento'), medicamentoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicamento.label', default: 'Medicamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
