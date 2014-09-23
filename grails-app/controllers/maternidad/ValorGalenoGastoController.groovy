package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ValorGalenoGastoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ValorGalenoGasto.list(params), model: [valorGalenoGastoInstanceCount: ValorGalenoGasto.count()]
    }

    def show(ValorGalenoGasto valorGalenoGastoInstance) {
        respond valorGalenoGastoInstance
    }

    def create() {
        respond new ValorGalenoGasto(params)
    }



    def save = {

        def planConvenio= PlanConvenio.get(params.planConvenio as String)


        def lista =  params?.gastos as List

        for(gasto in TipoGasto.list()){


            if ( lista?.contains(gasto?.id as String)  ){
                def valorGalenoGasto = new ValorGalenoGasto()

                valorGalenoGasto.planConvenio=planConvenio
                valorGalenoGasto.tipoGasto=gasto
                valorGalenoGasto.valor=params['valor'+gasto?.id] as Double


                def valorGalenoGastoAux=ValorGalenoGasto.findByPlanConvenioAndTipoGasto(planConvenio,gasto)

                if(valorGalenoGastoAux==null)
                {
                    if (valorGalenoGasto.save(flush: true)){}
                }else {

                    valorGalenoGastoAux.valor=params['valor'+gasto?.id] as Double


                    if (valorGalenoGastoAux.save(flush: true)){}
                }


            } else {


                def valorgaenogastoInstance= ValorGalenoGasto.findByPlanConvenioAndTipoGasto(planConvenio,gasto)

                if(valorgaenogastoInstance!=null){
                  valorgaenogastoInstance.delete()
                }

            }


        }



        redirect(controller:"convenio",action: "index")

        return



    }






    def edit(ValorGalenoGasto valorGalenoGastoInstance) {
        respond valorGalenoGastoInstance
    }

    @Transactional
    def update(ValorGalenoGasto valorGalenoGastoInstance) {
        if (valorGalenoGastoInstance == null) {
            notFound()
            return
        }

        if (valorGalenoGastoInstance.hasErrors()) {
            respond valorGalenoGastoInstance.errors, view: 'edit'
            return
        }

        valorGalenoGastoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ValorGalenoGasto.label', default: 'ValorGalenoGasto'), valorGalenoGastoInstance.id])
                redirect valorGalenoGastoInstance
            }
            '*' { respond valorGalenoGastoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ValorGalenoGasto valorGalenoGastoInstance) {

        if (valorGalenoGastoInstance == null) {
            notFound()
            return
        }

        valorGalenoGastoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ValorGalenoGasto.label', default: 'ValorGalenoGasto'), valorGalenoGastoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'valorGalenoGasto.label', default: 'ValorGalenoGasto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def  asignarValorGalenoGasto={

   def planConvenio=  PlanConvenio.get(params.id as Long)

        render(view: "valoresGalenoGasto", model: [planConvenio:planConvenio])


    }


}
