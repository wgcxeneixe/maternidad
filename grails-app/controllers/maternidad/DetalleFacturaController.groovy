package maternidad

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class DetalleFacturaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DetalleFactura.list(params), model: [detalleFacturaInstanceCount: DetalleFactura.count()]
    }

    def show(DetalleFactura detalleFacturaInstance) {
        respond detalleFacturaInstance
    }

    def create() {
        respond new DetalleFactura(params)
    }

    @Transactional
    def save(DetalleFactura detalleFacturaInstance) {
        if (detalleFacturaInstance == null) {
            notFound()
            return
        }

        if (detalleFacturaInstance.hasErrors()) {
            respond detalleFacturaInstance.errors, view: 'create'
            return
        }

        detalleFacturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleFactura.label', default: 'DetalleFactura'), detalleFacturaInstance.id])
                redirect detalleFacturaInstance
            }
            '*' { respond detalleFacturaInstance, [status: CREATED] }
        }
    }

    def edit(DetalleFactura detalleFacturaInstance) {
        respond detalleFacturaInstance
    }

    @Transactional
    def update(DetalleFactura detalleFacturaInstance) {
        if (detalleFacturaInstance == null) {
            notFound()
            return
        }

        if (detalleFacturaInstance.hasErrors()) {
            respond detalleFacturaInstance.errors, view: 'edit'
            return
        }

        detalleFacturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DetalleFactura.label', default: 'DetalleFactura'), detalleFacturaInstance.id])
                redirect detalleFacturaInstance
            }
            '*' { respond detalleFacturaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DetalleFactura detalleFacturaInstance) {

        if (detalleFacturaInstance == null) {
            notFound()
            return
        }

        detalleFacturaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DetalleFactura.label', default: 'DetalleFactura'), detalleFacturaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFactura.label', default: 'DetalleFactura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def cargaPracticas() {

        def planilla
        def valores
        def detalle = new DetalleFactura(params)
        if(params.id){
        planilla= PlanillaInternacion.get(params.id)
            detalle.planillaInternacion=planilla
            detalle.plan=planilla.plan
def planConvenio=PlanConvenio.withCriteria {
    eq("plan",planilla?.plan)
    convenio{
        eq("activo",Boolean.TRUE)
    }
}

      valores= ValorPractica.findAllByPlanConvenio(planConvenio)?.practica as List<Practica>


        }

        return [detalleFacturaInstance:detalle,practicas:valores]
    }


    @Transactional
    def saveCarga(DetalleFactura detalleFacturaInstance) {
        if (detalleFacturaInstance == null) {
            notFound()
            return
        }

        if (detalleFacturaInstance.hasErrors()) {
            respond detalleFacturaInstance.errors, view: 'create'
            return
        }

        if(detalleFacturaInstance.practica.modulo){
        detalleFacturaInstance.modulo=Boolean.TRUE
        }

        detalleFacturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleFactura.label', default: 'DetalleFactura'), detalleFacturaInstance.id])
                redirect(  action: "cargaPracticas" , params: [id:detalleFacturaInstance?.planillaInternacion?.id])
            }
            '*' { respond detalleFacturaInstance, [status: CREATED] }
        }
    }



    def public obtenerValores() {

        /*  10 - honorarios    si tiene valor honorario tomar valorhon sino valor especialista
       20- ayudante
       30-anestecista
       60 - gasto
       70 - gasto y honorarios llenar los dos campos
       91 - libre carga valor honorario a mano  sacar el readonly y permitir cargar valor que se escribe en valor honorario */

     def honorario=0
     def gasto=0

     def plan= Plan.get(params.plan)
     def planConvenio= PlanConvenio.withCriteria {
         convenio{eq("activo",true)}
         eq("plan",plan)
     }
     def practica = Practica.get(params.practica)
     def funcion= params.funcion as Integer

     def valorPractica= ValorPractica.findByPlanConvenioAndPractica(planConvenio,practica)

if(funcion==10){

  if(valorPractica?.valorHonorario){
      honorario=valorPractica?.valorHonorario
  }else {
     honorario=valorPractica?.valorEspecialista
  }
}

 if(funcion==20){
  honorario=valorPractica?.valorAyudante
 }

        if(funcion==30){
            honorario=valorPractica?.valorAnestecista
        }

        if(funcion==60){
            gasto=valorPractica?.valorGasto
        }

        if(funcion==70){
            gasto=valorPractica?.valorGasto

            if(valorPractica?.valorHonorario){
                honorario=valorPractica?.valorHonorario
            }else {
                honorario=valorPractica?.valorEspecialista
            }
        }

//return plan as JSON
        render(contentType: 'text/json') {[
                'gasto': gasto,
                'honorario': honorario
        ]}
    }


}
