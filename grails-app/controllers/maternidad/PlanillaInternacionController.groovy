package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)

class PlanillaInternacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PlanillaInternacion.list(params), model:[planillaInternacionInstanceCount: PlanillaInternacion.count()]
    }
*/

    def index = {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        def query = {
            if (params.dni) {
                paciente{
                    eq('nroDocumento', params.dni as Long)
                }

            }
            if (params.nroplanilla) {
               eq('id',  params.nroplanilla as Long)
            }

            if (params.nombre) {

              or{
                  paciente{ilike('nombre', '%' + params.nombre + '%')}
                  paciente{ilike('apellido', '%' + params.nombre + '%')}
              }


            }

            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = PlanillaInternacion.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def planillas = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [dni: params.dni,nroplanilla:params.nroplanilla,nombre:params.nombre]

        def model = [planillaInternacionInstanceList: planillas, planillaInternacionInstanceCount:planillas.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "lista", model: model)
        }
        else {
            model
        }
    }


    def show(PlanillaInternacion planillaInternacionInstance) {
        respond planillaInternacionInstance
    }

    def create() {
        def persona = Persona.findById(params?.id as long)
        if(persona == null){
            redirect action: "createconpaciente", method: "GET"
        }else
        {
            def planillaInternacion = new PlanillaInternacion(params)
            planillaInternacion.paciente = persona
            respond planillaInternacion
        }
    }

    def createconpaciente() {
        def persona = new Persona()
        persona.nroDocumento = params?.nrodocumento as long
        persona.tipoDocumento= TipoDocumento.findByNombre("DNI")
        persona.personaFisica = true

        render(view: "createconpaciente", model: [planillaInternacionInstance: new PlanillaInternacion(),personaInstance:persona])
        //respond  new PlanillaInternacion(params), model:[persona: Persona]
    }

    @Transactional
    def save(PlanillaInternacion planillaInternacionInstance) {
        if (planillaInternacionInstance == null) {
            notFound()
            return
        }

        if (planillaInternacionInstance.hasErrors()) {
            respond planillaInternacionInstance.errors, view:'create'
            return
        }

        planillaInternacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'planillaInternacion.label', default: 'Planilla internación'), planillaInternacionInstance.id])
                redirect planillaInternacionInstance
            }
            '*' { respond planillaInternacionInstance, [status: CREATED] }
        }
    }

    @Transactional
    def saveconpersona(PlanillaInternacion planillaInternacionInstance,Persona personaInstance) {
        if (planillaInternacionInstance == null) {
            notFound()
            return
        }

        if (personaInstance == null) {
            notFound()
            return
        }

        if (personaInstance.hasErrors()) {
            respond personaInstance.errors, view: 'createconpaciente'
            return
        }

        personaInstance.save flush: true
        planillaInternacionInstance.paciente=personaInstance

        if (planillaInternacionInstance.hasErrors()) {
            respond planillaInternacionInstance.errors, view: 'createconpaciente'
            return
        }


        planillaInternacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'planillaInternacion.label', default: 'Planilla internación'), planillaInternacionInstance.id])
                //redirect action:'index'
                //redirect planillaInternacionInstance
                redirect(action: "index")
            }
            '*' { respond planillaInternacionInstance, [status: CREATED],view:'index' }
        }
    }


    def edit(PlanillaInternacion planillaInternacionInstance) {
        respond planillaInternacionInstance

    }

    @Transactional
    def update(PlanillaInternacion planillaInternacionInstance) {
        if (planillaInternacionInstance == null) {
            notFound()
            return
        }

        if (planillaInternacionInstance.hasErrors()) {
            respond planillaInternacionInstance.errors, view:'edit'
            return
        }

        planillaInternacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PlanillaInternacion.label', default: 'PlanillaInternacion'), planillaInternacionInstance.id])
                //redirect planillaInternacionInstance
                redirect(action: "index")
            }
            '*'{ respond planillaInternacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PlanillaInternacion planillaInternacionInstance) {

        if (planillaInternacionInstance == null) {
            notFound()
            return
        }

        planillaInternacionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PlanillaInternacion.label', default: 'PlanillaInternacion'), planillaInternacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def buscapaciente() {
        return
    }

    def derivarpaciente={
        if(params?.paciente == "" || params?.paciente== null){
            redirect action: "buscapaciente", method: "GET"
            return
        }
        def persona = Persona.findByNroDocumento(params?.paciente as long)
        if(persona == null){
            forward(action: "createconpaciente", params: [nrodocumento: params?.paciente])
            //forward(["nrodocumento":params?.paciente])
            //redirect action: "createconpaciente", method: "POST"
            //redirect action: "createconpaciente", method: "POST", params: ["nrodocumento":params?.paciente]
        }
        else
        {
            redirect action: "create", method: "GET", id: persona?.id
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'planillaInternacion.label', default: 'PlanillaInternacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
