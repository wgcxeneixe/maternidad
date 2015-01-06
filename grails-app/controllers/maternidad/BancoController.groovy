package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class BancoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Banco.list(params), model: [bancoInstanceCount: Banco.count()]
    }

    def show(Banco bancoInstance) {
        respond bancoInstance
    }

    def create() {
        respond new Banco(params)
    }

    @Transactional
    def save(Banco bancoInstance) {
        if (bancoInstance == null) {
            notFound()
            return
        }

        if (bancoInstance.hasErrors()) {
            respond bancoInstance.errors, view: 'create'
            return
        }

        bancoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'banco.label', default: 'Banco'), bancoInstance.id])
                redirect(action: "index")
            }
            '*' { respond bancoInstance, [status: CREATED],view: 'index' }
        }
    }

    def edit(Banco bancoInstance) {
        respond bancoInstance
    }

    @Transactional
    def update(Banco bancoInstance) {
        if (bancoInstance == null) {
            notFound()
            return
        }

        if (bancoInstance.hasErrors()) {
            respond bancoInstance.errors, view: 'edit'
            return
        }

        bancoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Banco.label', default: 'Banco'), bancoInstance.id])
                redirect(action: "index")
            }
            '*' { respond bancoInstance, [status: OK],view: 'index' }
        }
    }

    @Transactional
    def delete(Banco bancoInstance) {

        if (bancoInstance == null) {
            notFound()
            return
        }

        bancoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Banco.label', default: 'Banco'), bancoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'banco.label', default: 'Banco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
