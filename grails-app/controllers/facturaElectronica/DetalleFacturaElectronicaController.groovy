package facturaElectronica



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DetalleFacturaElectronicaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DetalleFacturaElectronica.list(params), model:[detalleFacturaElectronicaInstanceCount: DetalleFacturaElectronica.count()]
    }

    def show(DetalleFacturaElectronica detalleFacturaElectronicaInstance) {
        respond detalleFacturaElectronicaInstance
    }

    def create() {
        respond new DetalleFacturaElectronica(params)
    }

    @Transactional
    def save(DetalleFacturaElectronica detalleFacturaElectronicaInstance) {
        if (detalleFacturaElectronicaInstance == null) {
            notFound()
            return
        }

        if (detalleFacturaElectronicaInstance.hasErrors()) {
            respond detalleFacturaElectronicaInstance.errors, view:'create'
            return
        }

        detalleFacturaElectronicaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleFacturaElectronica.label', default: 'DetalleFacturaElectronica'), detalleFacturaElectronicaInstance.id])
                redirect detalleFacturaElectronicaInstance
            }
            '*' { respond detalleFacturaElectronicaInstance, [status: CREATED] }
        }
    }

    def edit(DetalleFacturaElectronica detalleFacturaElectronicaInstance) {
        respond detalleFacturaElectronicaInstance
    }

    @Transactional
    def update(DetalleFacturaElectronica detalleFacturaElectronicaInstance) {
        if (detalleFacturaElectronicaInstance == null) {
            notFound()
            return
        }

        if (detalleFacturaElectronicaInstance.hasErrors()) {
            respond detalleFacturaElectronicaInstance.errors, view:'edit'
            return
        }

        detalleFacturaElectronicaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DetalleFacturaElectronica.label', default: 'DetalleFacturaElectronica'), detalleFacturaElectronicaInstance.id])
                redirect detalleFacturaElectronicaInstance
            }
            '*'{ respond detalleFacturaElectronicaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DetalleFacturaElectronica detalleFacturaElectronicaInstance) {

        if (detalleFacturaElectronicaInstance == null) {
            notFound()
            return
        }

        detalleFacturaElectronicaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DetalleFacturaElectronica.label', default: 'DetalleFacturaElectronica'), detalleFacturaElectronicaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFacturaElectronica.label', default: 'DetalleFacturaElectronica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
