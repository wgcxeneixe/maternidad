package maternidad

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_FACTURACION')")
@Transactional(readOnly = true)
class FacturaPeriodoController {

    def selectFactura = {

        def obraSocialSeleccionada = params?.idObraSocial as Long
        def obrasocialNombre = ObraSocial.findById(obraSocialSeleccionada)
        def listaFacturasSinPagar = FacturaPeriodo.withCriteria {
            createAlias('plan', 'p')
            eq('anulada', false)
            //eq('pagoCompleto', false)
            eq('p.obrasocial.id', obraSocialSeleccionada)
        }
        render(template: 'listaFacturasPeriodo', model: [listaFacturasSinPagar: listaFacturasSinPagar, obrasocialNombre: obrasocialNombre])
    }

    def abrirPagarFactura = {
        render(view: "pagarFacturasPeriodoPorObraSocial")
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
        def facturaPago = FacturaPeriodo.findById(facturaSeleccionada)
        render(template: 'listaPagos', model: [listaPagos: facturaPago?.pagosFactura, factura: facturaPago])
    }

    def agregarPago = {

    }
}
