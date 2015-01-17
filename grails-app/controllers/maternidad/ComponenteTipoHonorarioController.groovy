package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ComponenteTipoHonorarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ComponenteTipoHonorario.list(params), model: [componenteTipoHonorarioInstanceCount: ComponenteTipoHonorario.count()]
    }

    def show(ComponenteTipoHonorario componenteTipoHonorarioInstance) {
        respond componenteTipoHonorarioInstance
    }

    def create() {
        respond new ComponenteTipoHonorario(params)
    }

    @Transactional
    def save(ComponenteTipoHonorario componenteTipoHonorarioInstance) {
        if (componenteTipoHonorarioInstance == null) {
            notFound()
            return
        }

        if (componenteTipoHonorarioInstance.hasErrors()) {
            respond componenteTipoHonorarioInstance.errors, view: 'create'
            return
        }

        componenteTipoHonorarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'componenteTipoHonorario.label', default: 'ComponenteTipoHonorario'), componenteTipoHonorarioInstance.id])
                redirect componenteTipoHonorarioInstance
            }
            '*' { respond componenteTipoHonorarioInstance, [status: CREATED] }
        }
    }

    def edit(ComponenteTipoHonorario componenteTipoHonorarioInstance) {
        respond componenteTipoHonorarioInstance
    }

    @Transactional
    def update(ComponenteTipoHonorario componenteTipoHonorarioInstance) {
        if (componenteTipoHonorarioInstance == null) {
            notFound()
            return
        }

        if (componenteTipoHonorarioInstance.hasErrors()) {
            respond componenteTipoHonorarioInstance.errors, view: 'edit'
            return
        }

        componenteTipoHonorarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ComponenteTipoHonorario.label', default: 'ComponenteTipoHonorario'), componenteTipoHonorarioInstance.id])
                redirect componenteTipoHonorarioInstance
            }
            '*' { respond componenteTipoHonorarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ComponenteTipoHonorario componenteTipoHonorarioInstance) {

        if (componenteTipoHonorarioInstance == null) {
            notFound()
            return
        }

        componenteTipoHonorarioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ComponenteTipoHonorario.label', default: 'ComponenteTipoHonorario'), componenteTipoHonorarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'componenteTipoHonorario.label', default: 'ComponenteTipoHonorario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
