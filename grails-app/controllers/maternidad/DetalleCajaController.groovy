package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)

class DetalleCajaController {

    //static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService



    def index={

        def query = {
            if (params.caja) {
                eq('caja.id', params.caja?.toLong() )
            }
            if (params.fechaDesde && params.fechaHasta) {
                between('fecha', params.fechaDesde as Date, params.fechaHasta as Date)
                // between('fecha',Date.from, Date.parse("dd-MM-yyyy", params.fechaDesde))

            }

            if (params.sort){
                order(params.sort,params.order)
            }
        }


        def criteria = DetalleCaja.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def detalles = criteria.list(query, max: params.max, offset: params.offset)

        def filters = [caja: params.caja,fechaDesde:params.fechaDesde,fechaHasta:params.fechaHasta]

        def model = [detalleCajaInstanceList: detalles, detalleCajaInstanceCount:detalles.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }

    def show(DetalleCaja detalleCajaInstance) {
        respond detalleCajaInstance
    }

    def create() {
        def cajaDiariaAbiertaInstance =  CajaDiaria.findByFechaCierreIsNull()
        if(cajaDiariaAbiertaInstance == null ){
            //No existe una caja abierta
            redirect action: "create", method: "POST", controller: "cajaDiaria"
        }
        else{
            //Existe una caja abierta, paso los datos
            def DetalleCajaInstance = new DetalleCaja()
            DetalleCajaInstance.fecha = new Date()
            DetalleCajaInstance.caja = cajaDiariaAbiertaInstance
            DetalleCajaInstance.usuario = springSecurityService.currentUser
            respond DetalleCajaInstance, model:[cajaDiariaAbiertaInstance: CajaDiaria]
        }
    }

    @Transactional
    def save(DetalleCaja detalleCajaInstance) {
        def cajaDiariaAbiertaInstance =  CajaDiaria.findByFechaCierreIsNull()
        detalleCajaInstance.fecha = new Date()
        detalleCajaInstance.caja = cajaDiariaAbiertaInstance
        detalleCajaInstance.usuario = springSecurityService.currentUser

        if (detalleCajaInstance == null) {
            notFound()
            return
        }

        if (detalleCajaInstance.hasErrors()) {
            respond detalleCajaInstance.errors, view: 'create'
            return
        }

        detalleCajaInstance.monto=(params?.monto)? params?.monto as Double :0

        detalleCajaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleCaja.label', default: 'DetalleCaja'), detalleCajaInstance.id])
                redirect cajaDiariaAbiertaInstance
            }
            '*' {
                respond cajaDiariaAbiertaInstance, [status: CREATED]
                }
        }
    }

    def edit(DetalleCaja detalleCajaInstance) {
        respond detalleCajaInstance
    }

    @Transactional
    def update(DetalleCaja detalleCajaInstance) {
        if (detalleCajaInstance == null) {
            notFound()
            return
        }

        if (detalleCajaInstance.hasErrors()) {
            respond detalleCajaInstance.errors, view: 'edit'
            return
        }

        detalleCajaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DetalleCaja.label', default: 'DetalleCaja'), detalleCajaInstance.id])
                redirect detalleCajaInstance
            }
            '*' { respond detalleCajaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DetalleCaja detalleCajaInstance) {

        if (detalleCajaInstance == null) {
            notFound()
            return
        }

        detalleCajaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DetalleCaja.label', default: 'DetalleCaja'), detalleCajaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleCaja.label', default: 'DetalleCaja'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
