package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ChequeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


  /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cheque.list(params), model: [chequeInstanceCount: Cheque.count()]
    }
*/

    def index = {

        def query = {
            if (params.fechaDesde && params.fechaHasta) {
                between('fechaEmision', params.fechaDesde as Date, params.fechaHasta as Date)

            }
            if (params.nrocheque) {

                eq('numero', params.nrocheque.toInteger() )

            }



            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = Cheque.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def cheques = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [fechaDesde: params.fechaDesde as Date,fechaHasta:params.fechaHasta as Date,nrocheque:params.nrocheque]

        def model = [chequeInstanceList: cheques, chequeInstanceTotal:cheques?.size(), filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }



    def show(Cheque chequeInstance) {
        respond chequeInstance
    }

    def create() {
        respond new Cheque(params)
    }

    @Transactional
    def save(Cheque chequeInstance) {
        if (chequeInstance == null) {
            notFound()
            return
        }

        if (chequeInstance.hasErrors()) {
            respond chequeInstance.errors, view: 'create'
            return
        }

        chequeInstance.monto=(params?.monto)? params?.monto as Double:0
        chequeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cheque.label', default: 'Cheque'), chequeInstance.id])
               // redirect chequeInstance
                redirect(action: 'index')
            }
            '*' { respond chequeInstance, [status: CREATED] }
        }
    }

    def edit(Cheque chequeInstance) {
        respond chequeInstance
    }

    @Transactional
    def update(Cheque chequeInstance) {
        if (chequeInstance == null) {
            notFound()
            return
        }

        if (chequeInstance.hasErrors()) {
            respond chequeInstance.errors, view: 'edit'
            return
        }

        chequeInstance.monto=(params?.monto)? params?.monto as Double:0
        chequeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cheque.label', default: 'Cheque'), chequeInstance.id])
               // redirect chequeInstance

                redirect(action: 'index')
            }
            '*' { respond chequeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cheque chequeInstance) {

        if (chequeInstance == null) {
            notFound()
            return
        }

        chequeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cheque.label', default: 'Cheque'), chequeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
