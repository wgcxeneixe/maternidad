package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class EnteReceptorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EnteReceptor.list(params), model:[enteReceptorInstanceCount: EnteReceptor.count()]
    }

    def show(EnteReceptor enteReceptorInstance) {
        respond enteReceptorInstance
    }

    def create() {
        respond new EnteReceptor(params)
    }

    @Transactional
    def save(EnteReceptor enteReceptorInstance) {
        if (enteReceptorInstance == null) {
            notFound()
            return
        }

        if (enteReceptorInstance.hasErrors()) {
            respond enteReceptorInstance.errors, view:'create'
            return
        }

        enteReceptorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'enteReceptor.label', default: 'EnteReceptor'), enteReceptorInstance.id])
                redirect enteReceptorInstance
            }
            '*' { respond enteReceptorInstance, [status: CREATED] }
        }
    }

    def edit(EnteReceptor enteReceptorInstance) {
        respond enteReceptorInstance
    }

    @Transactional
    def update(EnteReceptor enteReceptorInstance) {
        if (enteReceptorInstance == null) {
            notFound()
            return
        }

        if (enteReceptorInstance.hasErrors()) {
            respond enteReceptorInstance.errors, view:'edit'
            return
        }

        enteReceptorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EnteReceptor.label', default: 'EnteReceptor'), enteReceptorInstance.id])
                redirect enteReceptorInstance
            }
            '*'{ respond enteReceptorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EnteReceptor enteReceptorInstance) {

        if (enteReceptorInstance == null) {
            notFound()
            return
        }

        enteReceptorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EnteReceptor.label', default: 'EnteReceptor'), enteReceptorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'enteReceptor.label', default: 'EnteReceptor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
