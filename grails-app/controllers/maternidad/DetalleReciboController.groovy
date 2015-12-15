package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class DetalleReciboController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DetalleRecibo.list(params), model: [detalleReciboInstanceCount: DetalleRecibo.count()]
    }

    def show(DetalleRecibo detalleReciboInstance) {
        respond detalleReciboInstance
    }

    def create() {
        respond new DetalleRecibo(params)
    }

    @Transactional
    def save(DetalleRecibo detalleReciboInstance) {
        if (detalleReciboInstance == null) {
            notFound()
            return
        }

        if (detalleReciboInstance.hasErrors()) {
            respond detalleReciboInstance.errors, view: 'create'
            return
        }

        detalleReciboInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleRecibo.label', default: 'DetalleRecibo'), detalleReciboInstance.id])
                redirect detalleReciboInstance
            }
            '*' { respond detalleReciboInstance, [status: CREATED] }
        }
    }

    def edit(DetalleRecibo detalleReciboInstance) {
        respond detalleReciboInstance
    }

    @Transactional
    def update(DetalleRecibo detalleReciboInstance) {
        if (detalleReciboInstance == null) {
            notFound()
            return
        }

        if (detalleReciboInstance.hasErrors()) {
            respond detalleReciboInstance.errors, view: 'edit'
            return
        }

        detalleReciboInstance.valor=(params.valor)?params.valor as Double:0

        detalleReciboInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DetalleRecibo.label', default: 'DetalleRecibo'), detalleReciboInstance.id])
                if(params.idRecibo){

                  redirect action:"edit" , controller: "recibo", params: [id:params.idRecibo]
                }else{
                    forward action: "list"
                }
            }
            '*' { respond detalleReciboInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DetalleRecibo detalleReciboInstance) {

        if (detalleReciboInstance == null) {
            notFound()
            return
        }

        detalleReciboInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DetalleRecibo.label', default: 'DetalleRecibo'), detalleReciboInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleRecibo.label', default: 'DetalleRecibo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
