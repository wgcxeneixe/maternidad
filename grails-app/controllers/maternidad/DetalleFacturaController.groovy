package maternidad

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

      valores= ValorPractica.findAllByPlanConvenio(PlanConvenio.findByActivoAndPlan(Boolean.TRUE,planilla.plan)).practica as List<Practica>


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

}
