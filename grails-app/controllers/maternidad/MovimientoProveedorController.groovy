package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_STOCK')")
@Transactional(readOnly = true)
class MovimientoProveedorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoProveedor.list(params), model: [movimientoProveedorInstanceCount: MovimientoProveedor.count()]
    }

    def show(MovimientoProveedor movimientoProveedorInstance) {
        respond movimientoProveedorInstance
    }

    def create() {

        if (params.id){
            def proveedor=Proveedor.get(params.id)

            def movimiento = new MovimientoProveedor(params)

            movimiento.proveedor=proveedor

            respond movimiento
        }else {

            respond new MovimientoProveedor(params)

        }



    }

    @Transactional
    def save(MovimientoProveedor movimientoProveedorInstance) {
        if (movimientoProveedorInstance == null) {
            notFound()
            return
        }

        if (movimientoProveedorInstance.hasErrors()) {
            respond movimientoProveedorInstance.errors, view: 'create'
            return
        }

        movimientoProveedorInstance.monto=(params.monto)? params.monto as Double :0
        movimientoProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoProveedor.label', default: 'MovimientoProveedor'), movimientoProveedorInstance.id])
               // redirect movimientoProveedorInstance
                redirect(action:'index', controller: 'proveedor')
            }
            '*' { respond movimientoProveedorInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoProveedor movimientoProveedorInstance) {
        respond movimientoProveedorInstance
    }

    @Transactional
    def update(MovimientoProveedor movimientoProveedorInstance) {
        if (movimientoProveedorInstance == null) {
            notFound()
            return
        }

        if (movimientoProveedorInstance.hasErrors()) {
            respond movimientoProveedorInstance.errors, view: 'edit'
            return
        }

        movimientoProveedorInstance.monto=(params.monto)? params.monto as Double :0
        movimientoProveedorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoProveedor.label', default: 'MovimientoProveedor'), movimientoProveedorInstance.id])
               // redirect movimientoProveedorInstance
                redirect(action:'index', controller: 'proveedor')

            }
            '*' { respond movimientoProveedorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoProveedor movimientoProveedorInstance) {

        if (movimientoProveedorInstance == null) {
            notFound()
            return
        }

        movimientoProveedorInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoProveedor.label', default: 'MovimientoProveedor'), movimientoProveedorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoProveedor.label', default: 'MovimientoProveedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def cuentaCorriente={

        def movimientos = MovimientoProveedor.findAllById(0)



        return [movimientoProveedorInstanceList: movimientos, movimientoProveedorInstanceCount: 0, total: 0]

    }

    def getCuenta = {

        if(params.idProveedor && params.idProveedor!='null' ) {

            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def proveedorInstance = Proveedor.read(params?.idProveedor as String)
            def movimientos = MovimientoProveedor.findAllByProveedor(proveedorInstance, [sort: "fecha", order: "desc",max: params.max, offset: params.offset])

            def ingreso = MovimientoProveedor.executeQuery("select sum(monto) from MovimientoProveedor mb " +
                    "where mb.credito=true and  mb.proveedor = :proveedor",
                    [proveedor: proveedorInstance])

            def egreso = MovimientoProveedor.executeQuery("select sum(monto) from MovimientoProveedor mb " +
                    "where mb.credito=false and  mb.proveedor = :proveedor",
                    [proveedor: proveedorInstance])

            def ing  = (ingreso[0])? ingreso[0]:0

            def egr  = (egreso[0])? egreso[0]:0

            def total = ing- egr


            render(template: 'movimientos', model: [movimientoProveedorInstanceList: movimientos, movimientoProveedorInstanceCount: MovimientoProveedor.findAllByProveedor(proveedorInstance).size(), total: total,idBanco:proveedorInstance.id])
        }
        else {
            def movimientos = MovimientoProveedor.findAllById(0)

            render(template: 'movimientos', model: [movimientoProveedorInstanceList: movimientos, movimientoProveedorInstanceCount: 0, total: 0])
        }
    }



}
