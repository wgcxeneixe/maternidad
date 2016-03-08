package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_STOCK')")
@Transactional(readOnly = true)
class FacturaProveedorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FacturaProveedor.list(params), model: [facturaProveedorInstanceCount: FacturaProveedor.count()]
    }

    */

    def index = {

        def query = {
            if (params.fechaDesde && params.fechaHasta) {
                between('fechaEmision', params.fechaDesde as Date, params.fechaHasta as Date)
                // between('fecha',Date.from, Date.parse("dd-MM-yyyy", params.fechaDesde))

            }
            if (params.nrofactura) {

                eq('numero', params.nrofactura )

            }

            if (params.proveedor) {

                eq('proveedor.id', params.proveedor.toLong() )

            }



            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = FacturaProveedor.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def facturas = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [fechaDesde: params.fechaDesde as Date,fechaHasta:params.fechaHasta as Date,proveedor:params.proveedor,nrofactura:params.nrofactura]

        def model = [facturaProveedorInstanceList: facturas, facturaProveedorInstanceTotal:facturas?.size(), filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }

    def show(FacturaProveedor facturaProveedorInstance) {
        respond facturaProveedorInstance
    }

    def create() {
        respond new FacturaProveedor(params)
    }

    @Transactional
    def save(FacturaProveedor facturaProveedorInstance) {
        if (facturaProveedorInstance == null) {
            notFound()
            return
        }

        if (facturaProveedorInstance.hasErrors()) {
            respond facturaProveedorInstance.errors, view: 'create'
            return
        }

        facturaProveedorInstance.monto=(params?.monto) ? params?.monto as Double : 0
        facturaProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'facturaProveedor.label', default: 'FacturaProveedor'), facturaProveedorInstance.id])
               // redirect facturaProveedorInstance
                redirect(action:'index')
            }
            '*' { respond facturaProveedorInstance, [status: CREATED] }
        }
    }

    def edit(FacturaProveedor facturaProveedorInstance) {
        respond facturaProveedorInstance
    }

    @Transactional
    def update(FacturaProveedor facturaProveedorInstance) {
        if (facturaProveedorInstance == null) {
            notFound()
            return
        }

        if (facturaProveedorInstance.hasErrors()) {
            respond facturaProveedorInstance.errors, view: 'edit'
            return
        }


        facturaProveedorInstance.monto=(params?.monto) ? params?.monto as Double : 0
        facturaProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FacturaProveedor.label', default: 'FacturaProveedor'), facturaProveedorInstance.id])
               // redirect facturaProveedorInstance

                redirect(action:'index')
            }
            '*' { respond facturaProveedorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FacturaProveedor facturaProveedorInstance) {

        if (facturaProveedorInstance == null) {
            notFound()
            return
        }

        facturaProveedorInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FacturaProveedor.label', default: 'FacturaProveedor'), facturaProveedorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'facturaProveedor.label', default: 'FacturaProveedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
