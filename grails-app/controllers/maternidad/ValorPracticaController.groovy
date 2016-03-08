package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_CONVENIO')")
@Transactional(readOnly = false)
class ValorPracticaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ValorPractica.list(params), model: [valorPracticaInstanceCount: ValorPractica.count()]
    }

    def show(ValorPractica valorPracticaInstance) {
        respond valorPracticaInstance
    }

    def create() {
        respond new ValorPractica(params)
    }

    @Transactional
    def save(ValorPractica valorPracticaInstance) {
        if (valorPracticaInstance == null) {
            notFound()
            return
        }

        if (valorPracticaInstance.hasErrors()) {
            respond valorPracticaInstance.errors, view: 'create'
            return
        }

        valorPracticaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'valorPractica.label', default: 'ValorPractica'), valorPracticaInstance.id])
                redirect valorPracticaInstance
            }
            '*' { respond valorPracticaInstance, [status: CREATED] }
        }
    }

    def edit(ValorPractica valorPracticaInstance) {
        respond valorPracticaInstance
    }

    @Transactional
    def update(ValorPractica valorPracticaInstance) {
        if (valorPracticaInstance == null) {
            notFound()
            return
        }

        if (valorPracticaInstance.hasErrors()) {
            respond valorPracticaInstance.errors, view: 'edit'
            return
        }

        valorPracticaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ValorPractica.label', default: 'ValorPractica'), valorPracticaInstance.id])
                redirect valorPracticaInstance
            }
            '*' { respond valorPracticaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ValorPractica valorPracticaInstance) {

        if (valorPracticaInstance == null) {
            notFound()
            return
        }

        valorPracticaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ValorPractica.label', default: 'ValorPractica'), valorPracticaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'valorPractica.label', default: 'ValorPractica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
