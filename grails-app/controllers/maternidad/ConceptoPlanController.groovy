package maternidad


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConceptoPlanController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoPlan.list(params), model: [conceptoPlanInstanceCount: ConceptoPlan.count()]
    }

    def show(ConceptoPlan conceptoPlanInstance) {
        respond conceptoPlanInstance
    }

    def create() {
        respond new ConceptoPlan(params)
    }

    @Transactional
    def save(ConceptoPlan conceptoPlanInstance) {
        if (conceptoPlanInstance == null) {
            notFound()
            return
        }

        if (conceptoPlanInstance.hasErrors()) {
            respond conceptoPlanInstance.errors, view: 'create'
            return
        }

        conceptoPlanInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoPlan.label', default: 'ConceptoPlan'), conceptoPlanInstance.id])
                redirect conceptoPlanInstance
            }
            '*' { respond conceptoPlanInstance, [status: CREATED] }
        }
    }

    def edit(ConceptoPlan conceptoPlanInstance) {
        respond conceptoPlanInstance
    }

    @Transactional
    def update(ConceptoPlan conceptoPlanInstance) {
        if (conceptoPlanInstance == null) {
            notFound()
            return
        }

        if (conceptoPlanInstance.hasErrors()) {
            respond conceptoPlanInstance.errors, view: 'edit'
            return
        }

        conceptoPlanInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConceptoPlan.label', default: 'ConceptoPlan'), conceptoPlanInstance.id])
                redirect conceptoPlanInstance
            }
            '*' { respond conceptoPlanInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConceptoPlan conceptoPlanInstance) {

        if (conceptoPlanInstance == null) {
            notFound()
            return
        }

        conceptoPlanInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConceptoPlan.label', default: 'ConceptoPlan'), conceptoPlanInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoPlan.label', default: 'ConceptoPlan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
