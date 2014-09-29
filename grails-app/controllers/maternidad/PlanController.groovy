package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class PlanController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Plan.list(params), model: [planInstanceCount: Plan.count()]
    }

    def show(Plan planInstance) {
        respond planInstance
    }

    def create() {

        def plan= new Plan(params)

        if(params.id) {

//def convenio=Convenio.get(params.id as Long)

            def obraSocial = ObraSocial.get(params.id as Long)

            plan.obrasocial = obraSocial

            // respond plan,model:[convenio:convenio]

        }



         respond plan





    }

    @Transactional
    def save(Plan planInstance) {
        if (planInstance == null) {
            notFound()
            return
        }

        if (planInstance.hasErrors()) {
            respond planInstance.errors, view: 'create'
            return
        }

        planInstance.save flush: true

       /* def planConvenio= new PlanConvenio()

        planConvenio.convenio=Convenio.get(params.convenio as Long)
        planConvenio.plan=planInstance

        planConvenio.save flush: true
*/


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'plan.label', default: 'Plan'), planInstance.id])
                redirect(controller: 'obraSocial',action: 'verPlanes',params: [id:planInstance?.obrasocial?.id])
            }
            '*' { respond planInstance, [status: CREATED] }
        }
    }

    def edit(Plan  planInstance) {
        //respond planInstance,model:[convenio:planConvenioInstance?.convenio]
        respond planInstance
    }

    @Transactional
    def update(Plan planInstance) {
        if (planInstance == null) {
            notFound()
            return
        }

        if (planInstance.hasErrors()) {
            respond planInstance.errors, view: 'edit'
            return
        }

        planInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Plan.label', default: 'Plan'), planInstance.id])
                redirect(controller: 'obraSocial',action: 'verPlanes',params: [id:planInstance?.obrasocial?.id])
            }
            '*' { respond planInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Plan planInstance) {

        if (planInstance == null) {
            notFound()
            return
        }

        planInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Plan.label', default: 'Plan'), planInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    @Transactional
    def updatePlan(Plan planInstance) {
        if (planInstance == null) {
            notFound()
            return
        }

        if (planInstance.hasErrors()) {
            respond planInstance.errors, view: '/convenio/editPlan'
            return
        }

        planInstance.save flush: true

      def planConvenio= PlanConvenio.get(params.planConvenio.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Convenio.label', default: 'Plan'),planInstance.id])
                redirect(controller:'convenio',  action: "editPlan",params: [id:planConvenio?.id])
            }
            '*' { respond planInstance, [status: OK],view:'/convenio/editPlan' }
        }
    }

}
