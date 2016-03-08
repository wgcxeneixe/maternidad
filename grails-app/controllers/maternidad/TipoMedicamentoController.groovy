package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = true)
class TipoMedicamentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static  scaffold = true
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoMedicamento.list(params), model: [tipoMedicamentoInstanceCount: TipoMedicamento.count()]
    }

    def show(TipoMedicamento tipoMedicamentoInstance) {
        respond tipoMedicamentoInstance
    }

    def create() {
        respond new TipoMedicamento(params)
    }

    @Transactional
    def save(TipoMedicamento tipoMedicamentoInstance) {
        if (tipoMedicamentoInstance == null) {
            notFound()
            return
        }

        if (tipoMedicamentoInstance.hasErrors()) {
            respond tipoMedicamentoInstance.errors, view: 'create'
            return
        }

        tipoMedicamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoMedicamento.label', default: 'TipoMedicamento'), tipoMedicamentoInstance.id])
                redirect tipoMedicamentoInstance
            }
            '*' { respond tipoMedicamentoInstance, [status: CREATED] }
        }
    }

    def edit(TipoMedicamento tipoMedicamentoInstance) {
        respond tipoMedicamentoInstance
    }

    @Transactional
    def update(TipoMedicamento tipoMedicamentoInstance) {
        if (tipoMedicamentoInstance == null) {
            notFound()
            return
        }

        if (tipoMedicamentoInstance.hasErrors()) {
            respond tipoMedicamentoInstance.errors, view: 'edit'
            return
        }

        tipoMedicamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoMedicamento.label', default: 'TipoMedicamento'), tipoMedicamentoInstance.id])
                redirect tipoMedicamentoInstance
            }
            '*' { respond tipoMedicamentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoMedicamento tipoMedicamentoInstance) {

        if (tipoMedicamentoInstance == null) {
            notFound()
            return
        }

        tipoMedicamentoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoMedicamento.label', default: 'TipoMedicamento'), tipoMedicamentoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoMedicamento.label', default: 'TipoMedicamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
