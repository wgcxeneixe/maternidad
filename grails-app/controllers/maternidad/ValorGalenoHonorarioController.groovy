package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_CONVENIO')")
@Transactional(readOnly = true)
class ValorGalenoHonorarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ValorGalenoHonorario.list(params), model: [valorGalenoHonorarioInstanceCount: ValorGalenoHonorario.count()]
    }

    def show(ValorGalenoHonorario valorGalenoHonorarioInstance) {
        respond valorGalenoHonorarioInstance
    }

    def create() {
        respond new ValorGalenoHonorario(params)
    }

    def save = {

        def planConvenio= PlanConvenio.get(params.planConvenio as String)


        def lista =  params?.honorarios as List

        for(honorario in TipoHonorario.list()){


            if ( lista?.contains(honorario?.id as String)  ){
                def valorGalenoHonorario = new ValorGalenoHonorario()

                valorGalenoHonorario.planConvenio=planConvenio
                valorGalenoHonorario.tipoHonorario=honorario
                valorGalenoHonorario.valor=params['valor'+honorario?.id] as Double


                def valorGalenoHonorarioAux=ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio,honorario)

                if(valorGalenoHonorarioAux==null)
                {
                    if (valorGalenoHonorario.save(flush: true)){}
                }else {

                    valorGalenoHonorarioAux.valor=params['valor'+honorario?.id] as Double


                    if (valorGalenoHonorarioAux.save(flush: true)){}
                }


            } else {


                def valorgaenohonorarioInstance= ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio,honorario)

                if(valorgaenohonorarioInstance!=null){
                    valorgaenohonorarioInstance.delete()
                }

            }


        }



        redirect(controller:"convenio",action: "editPlan",params: [id:planConvenio?.id])

        return



    }

    def edit(ValorGalenoHonorario valorGalenoHonorarioInstance) {
        respond valorGalenoHonorarioInstance
    }

    @Transactional
    def update(ValorGalenoHonorario valorGalenoHonorarioInstance) {
        if (valorGalenoHonorarioInstance == null) {
            notFound()
            return
        }

        if (valorGalenoHonorarioInstance.hasErrors()) {
            respond valorGalenoHonorarioInstance.errors, view: 'edit'
            return
        }

        valorGalenoHonorarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ValorGalenoHonorario.label', default: 'ValorGalenoHonorario'), valorGalenoHonorarioInstance.id])
                redirect valorGalenoHonorarioInstance
            }
            '*' { respond valorGalenoHonorarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ValorGalenoHonorario valorGalenoHonorarioInstance) {

        if (valorGalenoHonorarioInstance == null) {
            notFound()
            return
        }

        valorGalenoHonorarioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ValorGalenoHonorario.label', default: 'ValorGalenoHonorario'), valorGalenoHonorarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'valorGalenoHonorario.label', default: 'ValorGalenoHonorario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def  asignarValorGalenoHonorario={

        def planConvenio=  PlanConvenio.get(params.id as Long)

        render(view: "_valoresGalenoHonorario", model: [planConvenio:planConvenio])


    }


}
