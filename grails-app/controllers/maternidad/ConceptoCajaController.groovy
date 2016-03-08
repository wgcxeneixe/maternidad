package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = true)
class ConceptoCajaController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoCaja.list(params), model: [conceptoCajaInstanceCount: ConceptoCaja.count()]
    }

    def show(ConceptoCaja conceptoCajaInstance) {
        respond conceptoCajaInstance
    }

    def create() {
        respond new ConceptoCaja(params)
    }

    @Transactional
    def save(ConceptoCaja conceptoCajaInstance) {
        if (conceptoCajaInstance == null) {
            notFound()
            return
        }

        if (conceptoCajaInstance.hasErrors()) {
            respond conceptoCajaInstance.errors, view: 'create'
            return
        }

        conceptoCajaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoCaja.label', default: 'ConceptoCaja'), conceptoCajaInstance.id])
                redirect conceptoCajaInstance
            }
            '*' { respond conceptoCajaInstance, [status: CREATED] }
        }
    }

    def edit(ConceptoCaja conceptoCajaInstance) {
        respond conceptoCajaInstance
    }

    @Transactional
    def update(ConceptoCaja conceptoCajaInstance) {
        if (conceptoCajaInstance == null) {
            notFound()
            return
        }

        if (conceptoCajaInstance.hasErrors()) {
            respond conceptoCajaInstance.errors, view: 'edit'
            return
        }

        conceptoCajaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConceptoCaja.label', default: 'ConceptoCaja'), conceptoCajaInstance.id])
                redirect conceptoCajaInstance
            }
            '*' { respond conceptoCajaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConceptoCaja conceptoCajaInstance) {

        if (conceptoCajaInstance == null) {
            notFound()
            return
        }

        conceptoCajaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConceptoCaja.label', default: 'ConceptoCaja'), conceptoCajaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoCaja.label', default: 'ConceptoCaja'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
