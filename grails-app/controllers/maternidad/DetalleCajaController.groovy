package maternidad


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DetalleCajaController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        if (params.caja) {
            eq('caja', params.caja )
        }
        if (params.id) {
            eqId(1)
        }
        params.max = Math.min(max ?: 10, 100)
        def filters = [caja: params.caja,id:params.id]
        respond DetalleCaja.list(params), model: [detalleCajaInstanceCount: DetalleCaja.count()], filters: filters
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
            params.setProperty('CajaDiariaAbierta',cajaDiariaAbiertaInstance)
            respond new DetalleCaja(params)
        }
    }

    @Transactional
    def save(DetalleCaja detalleCajaInstance) {
        if (detalleCajaInstance == null) {
            notFound()
            return
        }

        if (detalleCajaInstance.hasErrors()) {
            respond detalleCajaInstance.errors, view: 'create'
            return
        }

        detalleCajaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleCaja.label', default: 'DetalleCaja'), detalleCajaInstance.id])
                redirect detalleCajaInstance
            }
            '*' { respond detalleCajaInstance, [status: CREATED] }
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
