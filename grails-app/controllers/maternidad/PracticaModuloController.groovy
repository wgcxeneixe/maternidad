package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class PracticaModuloController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PracticaModulo.list(params), model: [practicaModuloInstanceCount: PracticaModulo.count()]
    }

    def show(PracticaModulo practicaModuloInstance) {
        respond practicaModuloInstance
    }

    def create() {

        def planConvenio=PlanConvenio.findById(params.id)

        def modulo=Practica.get(params.modulo)

        def valorP= ValorPractica.findById(params.valorPractica)

        def practicamodulo= new PracticaModulo(params)
        practicamodulo.modulo=modulo

        respond practicamodulo,model: [planConvenio:planConvenio,valorPractica:valorP]
    }

    @Transactional
    def save(PracticaModulo practicaModuloInstance) {
        if (practicaModuloInstance == null) {
            notFound()
            return
        }

        if (practicaModuloInstance.hasErrors()) {
            respond practicaModuloInstance.errors, view: 'create'
            return
        }

        practicaModuloInstance.save flush: true

        def planConvenio=PlanConvenio.get(params.planConvenio.id)

        def valorPractica= new ValorPractica()

        valorPractica?.planConvenio=planConvenio
        valorPractica?.plan=planConvenio?.plan
        valorPractica?.fechaActualizado=new Date()
        valorPractica?.practica=practicaModuloInstance?.practica
        valorPractica?.valorAnestecista=practicaModuloInstance?.valorAnestecista
        valorPractica?.valorAyudante=practicaModuloInstance?.valorAyudante
        valorPractica?.valorEspecialista=practicaModuloInstance?.valorEspecialista
        valorPractica?.valorGasto=practicaModuloInstance?.valorGasto

        valorPractica.save flush: true

        def valorPracticaModulo=ValorPractica.get(params.valorPractica.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'practicaModulo.label', default: 'PracticaModulo'), practicaModuloInstance.id])
                redirect(controller:'practica',  action: "editModulo" , params: [id:valorPracticaModulo?.practica?.id,valorPractica: valorPracticaModulo?.id])
            }
            '*' { respond practicaModuloInstance, [status: CREATED] }
        }
    }

    def edit(PracticaModulo practicaModuloInstance) {

        def valorP= ValorPractica.findById(params.valorPractica)

        respond practicaModuloInstance,model: [planConvenio:valorP?.planConvenio,valorPractica:valorP]
    }

    @Transactional
    def update(PracticaModulo practicaModuloInstance) {
        if (practicaModuloInstance == null) {
            notFound()
            return
        }

        if (practicaModuloInstance.hasErrors()) {
            respond practicaModuloInstance.errors, view: 'edit'
            return
        }

        practicaModuloInstance.save flush: true

        def planConvenio=PlanConvenio.get(params.planConvenio.id)

        def valorPractica = ValorPractica.findByPracticaAndPlanConvenio(practicaModuloInstance?.practica,planConvenio)

        valorPractica?.fechaActualizado=new Date()
        //valorPractica?.practica=practicaModuloInstance?.practica
        valorPractica?.valorAnestecista=practicaModuloInstance?.valorAnestecista
        valorPractica?.valorAyudante=practicaModuloInstance?.valorAyudante
        valorPractica?.valorEspecialista=practicaModuloInstance?.valorEspecialista
        valorPractica?.valorGasto=practicaModuloInstance?.valorGasto

        valorPractica.save flush: true


        def valorPracticaModulo=ValorPractica.get(params.valorPractica.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PracticaModulo.label', default: 'PracticaModulo'), practicaModuloInstance.id])
                redirect(controller:'practica',  action: "editModulo" , params: [id:valorPracticaModulo?.practica?.id,valorPractica: valorPracticaModulo?.id])
            }
            '*' { respond practicaModuloInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PracticaModulo practicaModuloInstance) {

        if (practicaModuloInstance == null) {
            notFound()
            return
        }

        practicaModuloInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PracticaModulo.label', default: 'PracticaModulo'), practicaModuloInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'practicaModulo.label', default: 'PracticaModulo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
