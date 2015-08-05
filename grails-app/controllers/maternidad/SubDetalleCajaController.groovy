package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class SubDetalleCajaController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SubDetalleCaja.list(params), model:[subDetalleCajaInstanceCount: SubDetalleCaja.count()]
    }

    def show(SubDetalleCaja subDetalleCajaInstance) {
        respond subDetalleCajaInstance
    }

    def create() {
        respond new SubDetalleCaja(params)
    }

    @Transactional
    def save(SubDetalleCaja subDetalleCajaInstance) {
        if (subDetalleCajaInstance == null) {
            notFound()
            return
        }

        subDetalleCajaInstance.usuario = springSecurityService.currentUser
        if (subDetalleCajaInstance.hasErrors()) {
            respond subDetalleCajaInstance.errors, view:'show'
            return
        }

        subDetalleCajaInstance.save flush:true
        def detalle = DetalleCaja.read(subDetalleCajaInstance.detalleCaja.id)
        detalle.calcularTotal()
        detalle.save()

//        request.withFormat {
//            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subDetalleCaja.label', default: 'SubDetalleCaja'), subDetalleCajaInstance.id])
                redirect(controller: "detalleCaja", action: "show", id: subDetalleCajaInstance.detalleCaja.id)
//            }
//            '*' { respond subDetalleCajaInstance, [status: CREATED] }
//        }
    }

    def edit(SubDetalleCaja subDetalleCajaInstance) {
        respond subDetalleCajaInstance
    }

    @Transactional
    def update(SubDetalleCaja subDetalleCajaInstance) {
        if (subDetalleCajaInstance == null) {
            notFound()
            return
        }

        if (subDetalleCajaInstance.hasErrors()) {
            respond subDetalleCajaInstance.errors, view:'edit'
            return
        }

        subDetalleCajaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SubDetalleCaja.label', default: 'SubDetalleCaja'), subDetalleCajaInstance.id])
                redirect subDetalleCajaInstance
            }
            '*'{ respond subDetalleCajaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SubDetalleCaja subDetalleCajaInstance) {

        if (subDetalleCajaInstance == null) {
            notFound()
            return
        }

        subDetalleCajaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SubDetalleCaja.label', default: 'SubDetalleCaja'), subDetalleCajaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subDetalleCaja.label', default: 'SubDetalleCaja'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
