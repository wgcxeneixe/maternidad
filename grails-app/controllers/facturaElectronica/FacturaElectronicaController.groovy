package facturaElectronica

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class FacturaElectronicaController {

    def afipWsService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FacturaElectronica.list(params), model: [facturaElectronicaInstanceCount: FacturaElectronica.count()]
    }

    def show(FacturaElectronica facturaElectronicaInstance) {
        respond facturaElectronicaInstance
    }

    def create() {
        def facturaElectronicaInstance = new FacturaElectronica()
        def cuit = params.long('cuit') //Valido que el cuit sea Long
        if (cuit) {
            def empresaAfip = afipWsService.obtenerEmpresa(cuit)
            if(empresaAfip){
                facturaElectronicaInstance.cuit = empresaAfip.cuit
                facturaElectronicaInstance.razonSocial = empresaAfip.razonSocial
                facturaElectronicaInstance.direccion = empresaAfip.direccion
                facturaElectronicaInstance.localidad = empresaAfip.localidad
            }else{
                facturaElectronicaInstance.cuit=cuit
            }
        }
        respond facturaElectronicaInstance
    }

    @Transactional
    def save(FacturaElectronica facturaElectronicaInstance) {
        if (facturaElectronicaInstance == null) {
            notFound()
            return
        }

        if (facturaElectronicaInstance.hasErrors()) {
            respond facturaElectronicaInstance.errors, view: 'create'
            return
        }
        try {
        def facturaAfip = afipWsService.enviarAfip(facturaElectronicaInstance?.cuit,facturaElectronicaInstance?.totalNeto)
        println facturaAfip
        facturaElectronicaInstance.cae = facturaAfip.CAE
        facturaElectronicaInstance.numeroFactura = facturaAfip.nroComprobante
        facturaElectronicaInstance.save flush: true
        }catch (Exception e){
            flash.alert = "Ocurrió un error al consultar AFIP"
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'facturaElectronica.label', default: 'FacturaElectronica'), facturaElectronicaInstance.id])
                redirect facturaElectronicaInstance
            }
            '*' { respond facturaElectronicaInstance, [status: CREATED] }
        }
    }

    def edit(FacturaElectronica facturaElectronicaInstance) {
        respond facturaElectronicaInstance
    }

    @Transactional
    def update(FacturaElectronica facturaElectronicaInstance) {
        if (facturaElectronicaInstance == null) {
            notFound()
            return
        }

        if (facturaElectronicaInstance.hasErrors()) {
            respond facturaElectronicaInstance.errors, view: 'edit'
            return
        }

        facturaElectronicaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FacturaElectronica.label', default: 'FacturaElectronica'), facturaElectronicaInstance.id])
                redirect facturaElectronicaInstance
            }
            '*' { respond facturaElectronicaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FacturaElectronica facturaElectronicaInstance) {

        if (facturaElectronicaInstance == null) {
            notFound()
            return
        }

        facturaElectronicaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FacturaElectronica.label', default: 'FacturaElectronica'), facturaElectronicaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'facturaElectronica.label', default: 'FacturaElectronica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
