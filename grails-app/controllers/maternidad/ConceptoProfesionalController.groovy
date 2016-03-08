package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = true)
class ConceptoProfesionalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoProfesional.list(params), model:[conceptoProfesionalInstanceCount: ConceptoProfesional.count()]
    }

    def show(ConceptoProfesional conceptoProfesionalInstance) {
        respond conceptoProfesionalInstance
    }

    def create() {
        respond new ConceptoProfesional(params)
    }

    @Transactional
    def save(ConceptoProfesional conceptoProfesionalInstance) {
        if (conceptoProfesionalInstance == null) {
            notFound()
            return
        }

        if (conceptoProfesionalInstance.hasErrors()) {
            respond conceptoProfesionalInstance.errors, view:'create'
            return
        }

        conceptoProfesionalInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoProfesional.label', default: 'ConceptoProfesional'), conceptoProfesionalInstance.id])
                redirect conceptoProfesionalInstance
            }
            '*' { respond conceptoProfesionalInstance, [status: CREATED] }
        }
    }

    def edit(ConceptoProfesional conceptoProfesionalInstance) {
        respond conceptoProfesionalInstance
    }

    @Transactional
    def update(ConceptoProfesional conceptoProfesionalInstance) {
        if (conceptoProfesionalInstance == null) {
            notFound()
            return
        }

        if (conceptoProfesionalInstance.hasErrors()) {
            respond conceptoProfesionalInstance.errors, view:'edit'
            return
        }

        conceptoProfesionalInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConceptoProfesional.label', default: 'ConceptoProfesional'), conceptoProfesionalInstance.id])
                redirect conceptoProfesionalInstance
            }
            '*'{ respond conceptoProfesionalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConceptoProfesional conceptoProfesionalInstance) {

        if (conceptoProfesionalInstance == null) {
            notFound()
            return
        }

        conceptoProfesionalInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConceptoProfesional.label', default: 'ConceptoProfesional'), conceptoProfesionalInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoProfesional.label', default: 'ConceptoProfesional'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
