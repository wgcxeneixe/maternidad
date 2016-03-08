package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = true)
class PaisController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pais.list(params), model: [paisInstanceCount: Pais.count()]
    }

    def show(Pais paisInstance) {
        respond paisInstance
    }

    def create() {
        respond new Pais(params)
    }

    @Transactional
    def save(Pais paisInstance) {
        if (paisInstance == null) {
            notFound()
            return
        }

        if (paisInstance.hasErrors()) {
            respond paisInstance.errors, view: 'create'
            return
        }

        paisInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pais.label', default: 'Pais'), paisInstance.id])
                redirect paisInstance
            }
            '*' { respond paisInstance, [status: CREATED] }
        }
    }

    def edit(Pais paisInstance) {
        respond paisInstance
    }

    @Transactional
    def update(Pais paisInstance) {
        if (paisInstance == null) {
            notFound()
            return
        }

        if (paisInstance.hasErrors()) {
            respond paisInstance.errors, view: 'edit'
            return
        }

        paisInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pais.label', default: 'Pais'), paisInstance.id])
                redirect paisInstance
            }
            '*' { respond paisInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pais paisInstance) {

        if (paisInstance == null) {
            notFound()
            return
        }

        paisInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pais.label', default: 'Pais'), paisInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pais.label', default: 'Pais'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
