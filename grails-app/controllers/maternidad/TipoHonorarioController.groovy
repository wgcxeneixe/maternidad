package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class TipoHonorarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoHonorario.list(params), model: [tipoHonorarioInstanceCount: TipoHonorario.count()]
    }

    def show(TipoHonorario tipoHonorarioInstance) {
        respond tipoHonorarioInstance
    }

    def create() {
        respond new TipoHonorario(params)
    }

    @Transactional
    def save(TipoHonorario tipoHonorarioInstance) {
        if (tipoHonorarioInstance == null) {
            notFound()
            return
        }

        if (tipoHonorarioInstance.hasErrors()) {
            respond tipoHonorarioInstance.errors, view: 'create'
            return
        }

        tipoHonorarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoHonorario.label', default: 'TipoHonorario'), tipoHonorarioInstance.id])
                redirect tipoHonorarioInstance
            }
            '*' { respond tipoHonorarioInstance, [status: CREATED] }
        }
    }

    def edit(TipoHonorario tipoHonorarioInstance) {
        respond tipoHonorarioInstance
    }

    @Transactional
    def update(TipoHonorario tipoHonorarioInstance) {
        if (tipoHonorarioInstance == null) {
            notFound()
            return
        }

        if (tipoHonorarioInstance.hasErrors()) {
            respond tipoHonorarioInstance.errors, view: 'edit'
            return
        }

        tipoHonorarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoHonorario.label', default: 'TipoHonorario'), tipoHonorarioInstance.id])
                redirect tipoHonorarioInstance
            }
            '*' { respond tipoHonorarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoHonorario tipoHonorarioInstance) {

        if (tipoHonorarioInstance == null) {
            notFound()
            return
        }

        tipoHonorarioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoHonorario.label', default: 'TipoHonorario'), tipoHonorarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoHonorario.label', default: 'TipoHonorario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
