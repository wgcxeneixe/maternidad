package maternidad


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PlanConvenioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PlanConvenio.list(params), model: [planConvenioInstanceCount: PlanConvenio.count()]
    }

    def show(PlanConvenio planConvenioInstance) {
        respond planConvenioInstance
    }

    def create() {
        respond new PlanConvenio(params)
    }

    @Transactional
    def save(PlanConvenio planConvenioInstance) {
        if (planConvenioInstance == null) {
            notFound()
            return
        }

        if (planConvenioInstance.hasErrors()) {
            respond planConvenioInstance.errors, view: 'create'
            return
        }

        planConvenioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'planConvenio.label', default: 'PlanConvenio'), planConvenioInstance.id])
                redirect planConvenioInstance
            }
            '*' { respond planConvenioInstance, [status: CREATED] }
        }
    }

    def edit(PlanConvenio planConvenioInstance) {
        respond planConvenioInstance
    }

    @Transactional
    def update(PlanConvenio planConvenioInstance) {
        if (planConvenioInstance == null) {
            notFound()
            return
        }

        if (planConvenioInstance.hasErrors()) {
            respond planConvenioInstance.errors, view: 'edit'
            return
        }

        planConvenioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PlanConvenio.label', default: 'PlanConvenio'), planConvenioInstance.id])
                redirect planConvenioInstance
            }
            '*' { respond planConvenioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PlanConvenio planConvenioInstance) {

        if (planConvenioInstance == null) {
            notFound()
            return
        }

        planConvenioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PlanConvenio.label', default: 'PlanConvenio'), planConvenioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'planConvenio.label', default: 'PlanConvenio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
