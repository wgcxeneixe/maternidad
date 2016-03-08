package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = true)
class TipoGastoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoGasto.list(params), model: [tipoGastoInstanceCount: TipoGasto.count()]
    }

    def show(TipoGasto tipoGastoInstance) {
        respond tipoGastoInstance
    }

    def create() {
        respond new TipoGasto(params)
    }

    @Transactional
    def save(TipoGasto tipoGastoInstance) {
        if (tipoGastoInstance == null) {
            notFound()
            return
        }

        if (tipoGastoInstance.hasErrors()) {
            respond tipoGastoInstance.errors, view: 'create'
            return
        }

        tipoGastoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoGasto.label', default: 'TipoGasto'), tipoGastoInstance.id])
                redirect tipoGastoInstance
            }
            '*' { respond tipoGastoInstance, [status: CREATED] }
        }
    }

    def edit(TipoGasto tipoGastoInstance) {
        respond tipoGastoInstance
    }

    @Transactional
    def update(TipoGasto tipoGastoInstance) {
        if (tipoGastoInstance == null) {
            notFound()
            return
        }

        if (tipoGastoInstance.hasErrors()) {
            respond tipoGastoInstance.errors, view: 'edit'
            return
        }

        tipoGastoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoGasto.label', default: 'TipoGasto'), tipoGastoInstance.id])
                redirect tipoGastoInstance
            }
            '*' { respond tipoGastoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoGasto tipoGastoInstance) {

        if (tipoGastoInstance == null) {
            notFound()
            return
        }

        tipoGastoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoGasto.label', default: 'TipoGasto'), tipoGastoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGasto.label', default: 'TipoGasto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
