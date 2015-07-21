package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class InternacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

   // static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Internacion.list(params), model: [internacionInstanceCount: Internacion.count()]
    }

    def show(Internacion internacionInstance) {
        respond internacionInstance
    }

    def create() {
        respond new Internacion(params)
    }

    def crear() {
        if (params.id){
            render (view:"crear",model:[internacion: new Internacion(params), planilla: params.id])
        }else
        {
            flash.message = "Error"

        }
    }

    @Transactional
    def save(Internacion internacionInstance) {
        if (internacionInstance == null) {
            notFound()
            return
        }

        if (internacionInstance.hasErrors()) {
            respond internacionInstance.errors, view: 'create'
            return
        }

        internacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'internacion.label', default: 'Internacion'), internacionInstance.id])
                redirect internacionInstance
            }
            '*' { respond internacionInstance, [status: CREATED] }
        }
    }

    @Transactional
    def savePlanilla(Internacion internacionInstance) {
        if (internacionInstance == null) {
            notFound()
            return
        }

        if (internacionInstance.hasErrors()) {
            respond internacionInstance.errors, view: 'crear'
            return
        }

        internacionInstance.save flush: true

        def planilla = PlanillaInternacion.findById(params.planilla as Long)
        planilla.addToInternaciones(internacionInstance)
        planilla.save(flush: true)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'internacion.label', default: 'Internacion'), internacionInstance.id])
                redirect controller: "planillaInternacion",action: "show",params:[id:planilla?.id]
            }
            '*' { respond internacionInstance, [status: CREATED] }
        }
    }

    def edit(Internacion internacionInstance) {
        if (params.idPlanilla){
            render (view:"edit",model:[internacionInstance: internacionInstance, planilla: params.idPlanilla])
        }else
        {
            flash.message = "Error"

        }

    }

    @Transactional
    def update(Internacion internacionInstance) {
        if (internacionInstance == null) {
            notFound()
            return
        }

        if (internacionInstance.hasErrors()) {
            respond internacionInstance.errors, view: 'edit'
            return
        }

        internacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Internacion.label', default: 'Internacion'), internacionInstance.id])
                redirect controller: "planillaInternacion",action: "show",params:[id:params.planilla]
            }
            '*' { respond internacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Internacion internacionInstance) {

        if (internacionInstance == null) {
            notFound()
            return
        }

        internacionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Internacion.label', default: 'Internacion'), internacionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }


    def eliminar= {

        if (!params.id) {
            notFound()
            return
        }
        def planilla=PlanillaInternacion.findById(params.planilla)

        def internacionInstance=Internacion.findById(params.id)
        planilla.internaciones.remove(internacionInstance)

        internacionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Internacion.label', default: 'Internacion'), internacionInstance.id])
                redirect controller: "planillaInternacion",action: "show",params:[id:params.planilla]
            }
            '*' {     redirect controller: "planillaInternacion",action: "show",params:[id:params.planilla] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'internacion.label', default: 'Internacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
