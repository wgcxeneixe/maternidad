package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class MovimientoPlanController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoPlan.list(params), model: [movimientoPlanInstanceCount: MovimientoPlan.count()]
    }

    def show(MovimientoPlan movimientoPlanInstance) {
        respond movimientoPlanInstance
    }

    def create() {
        respond new MovimientoPlan(params)
    }

    @Transactional
    def save(MovimientoPlan movimientoPlanInstance) {
        if (movimientoPlanInstance == null) {
            notFound()
            return
        }

        if (movimientoPlanInstance.hasErrors()) {
            respond movimientoPlanInstance.errors, view: 'create'
            return
        }

        movimientoPlanInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoPlan.label', default: 'MovimientoPlan'), movimientoPlanInstance.id])
                redirect movimientoPlanInstance
            }
            '*' { respond movimientoPlanInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoPlan movimientoPlanInstance) {
        respond movimientoPlanInstance
    }

    @Transactional
    def update(MovimientoPlan movimientoPlanInstance) {
        if (movimientoPlanInstance == null) {
            notFound()
            return
        }

        if (movimientoPlanInstance.hasErrors()) {
            respond movimientoPlanInstance.errors, view: 'edit'
            return
        }

        movimientoPlanInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoPlan.label', default: 'MovimientoPlan'), movimientoPlanInstance.id])
                redirect movimientoPlanInstance
            }
            '*' { respond movimientoPlanInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoPlan movimientoPlanInstance) {

        if (movimientoPlanInstance == null) {
            notFound()
            return
        }

        movimientoPlanInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoPlan.label', default: 'MovimientoPlan'), movimientoPlanInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoPlan.label', default: 'MovimientoPlan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def saldo={

        def movimientos = MovimientoPlan.findAllById(0)



        return [movimientoPlanInstanceList: movimientos, movimientoPlanInstanceCount: 0, total: 0]

    }

    def getmovimientosPlan = {

        if(params.idPlan && params.idPlan!='null' ) {
            def planInstance = Plan.read(params?.idPlan as String)
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def movimientos = MovimientoPlan.findAllByPlan(planInstance,[sort: "fecha", order: "desc",max: params.max, offset: params.offset])

            def credito = MovimientoPlan.executeQuery("select sum(monto) from MovimientoPlan mp " +
                    "where mp.credito=true and  mp.plan = :plan",
                    [plan: planInstance])

            def debito = MovimientoPlan.executeQuery("select sum(monto) from MovimientoPlan mp " +
                    "where mp.credito=false and  mp.plan = :plan",
                    [plan: planInstance])

            def ing  = (credito[0])? credito[0]:0

            def egr  = (debito[0])? debito[0]:0

            def total = ing- egr

            render(template: 'movimientos', model: [movimientoPlanInstanceList: movimientos, movimientoPlanInstanceCount: MovimientoPlan.findAllByPlan(planInstance).size(), total: total,idPlan:planInstance?.id])
        }
        else {
            def movimientos = MovimientoPlan.findAllById(0)

            render(template: 'movimientos', model: [movimientoPlanInstanceList: movimientos, movimientoPlanInstanceCount: 0, total: 0])
        }
    }



}
