package maternidad

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class FacturaController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true


    def selectFactura = {

        def obraSocialSeleccionada = params?.idObraSocial as Long
        def obrasocialNombre = ObraSocial.findById(obraSocialSeleccionada)
        def listaFacturasSinPagar = Factura.withCriteria {
            createAlias('plan', 'p')
            eq('anulada', false)
            eq('pagoCompleto', false)
            eq('p.obrasocial.id', obraSocialSeleccionada)
        }
        render(template: 'listaFacturas', model: [listaFacturasSinPagar: listaFacturasSinPagar, obrasocialNombre: obrasocialNombre])
    }

    def abrirPagarFactura = {
        render(view: "pagarFacturasPorObraSocial")
    }

    def agregarPagoAFactura = {
        def factura = Factura.findById(params?.id)
        if (factura) {
            render(view: "agregarPagoAFactura", model: [factura])
        } else {
            flash.error = "Error al Buscar Factura"
            redirect(action: 'abrirPagarFactura')
        }
    }

    def verPagos = {
        def facturaSeleccionada = params?.id as Long
        def listaPagos = Factura.findById(facturaSeleccionada)
        render(template: 'listaPagos', model: [listaPagos: listaPagos?.pagosFactura, factura: listaPagos])
    }

    def agregarPago = {

    }


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Factura.list(params), model: [facturaInstanceCount: Factura.count()]
    }

    def show(Factura facturaInstance) {
        respond facturaInstance
    }

    def create() {
        respond new Factura(params)
    }

    @Transactional
    def save(Factura facturaInstance) {
        if (facturaInstance == null) {
            notFound()
            return
        }

        if (facturaInstance.hasErrors()) {
            respond facturaInstance.errors, view: 'create'
            return
        }

        facturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
                redirect facturaInstance
            }
            '*' { respond facturaInstance, [status: CREATED] }
        }
    }

    def edit(Factura facturaInstance) {
        respond facturaInstance
    }

    @Transactional
    def update(Factura facturaInstance) {
        if (facturaInstance == null) {
            notFound()
            return
        }

        if (facturaInstance.hasErrors()) {
            respond facturaInstance.errors, view: 'edit'
            return
        }

        facturaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Factura.label', default: 'Factura'), facturaInstance.id])
                redirect facturaInstance
            }
            '*' { respond facturaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Factura facturaInstance) {

        if (facturaInstance == null) {
            notFound()
            return
        }

        facturaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Factura.label', default: 'Factura'), facturaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

def facturar={
   def facturaInstance = new Factura()
respond facturaInstance

}


    def facturarSeleccionado={

       def fecha=params.fecha
       def nroFactura=params.nrofactura
       def periodo=params.periodo
       def seleccionados=params.getProperty("facturar[]")  as List

seleccionados

    }



}
