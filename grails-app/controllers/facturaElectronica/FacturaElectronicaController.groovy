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
            def facturaAnterior = FacturaElectronica.withCriteria {
                eq('cuit', cuit)
                order('id', 'desc')
                maxResults(1)
            }
            if (facturaAnterior && facturaAnterior.size()>0) {
                facturaElectronicaInstance.cuit = facturaAnterior.first().cuit
                facturaElectronicaInstance.razonSocial = facturaAnterior.first().razonSocial
                facturaElectronicaInstance.direccion = facturaAnterior.first().direccion
                facturaElectronicaInstance.localidad = facturaAnterior.first().localidad
                facturaElectronicaInstance.puntoVenta = facturaAnterior.first().puntoVenta
                facturaElectronicaInstance.codigoPostal = facturaAnterior.first().codigoPostal
                facturaElectronicaInstance.provincia = facturaAnterior.first().provincia
            } else {
                def empresaAfip = afipWsService.obtenerEmpresa(cuit)
                if (empresaAfip) {
                    facturaElectronicaInstance.cuit = empresaAfip.cuit
                    facturaElectronicaInstance.razonSocial = empresaAfip.razonSocial
                    facturaElectronicaInstance.direccion = empresaAfip.direccion
                    facturaElectronicaInstance.localidad = empresaAfip.localidad
                } else {
                    facturaElectronicaInstance.cuit = cuit
                }
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
            println facturaElectronicaInstance.dump()
            def facturaAfip = afipWsService.enviarAfip(facturaElectronicaInstance)
            facturaElectronicaInstance.cae = facturaAfip.CAE
            facturaElectronicaInstance.numeroFactura = facturaAfip.nroComprobante
            facturaElectronicaInstance.puntoVenta = facturaAfip.puntoVenta
            facturaElectronicaInstance.fecha = facturaAfip.fecha
            facturaElectronicaInstance.save flush: true
        } catch (Exception e) {
            flash.alert = "Ocurrió un error al consultar AFIP"
            println e.dump()
            println e.message
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
