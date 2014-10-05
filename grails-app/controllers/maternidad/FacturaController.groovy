package maternidad

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
class FacturaController {

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

        render(template: 'listaFacturas', model: [listaFacturasSinPagar:listaFacturasSinPagar, obrasocialNombre:obrasocialNombre])

    }

    def abrirPagarFactura = {

        render(view: "pagarFacturasPorObraSocial")
    }


    def agregarPagoAFactura ={

        def factura = Factura.findById(params?.id)

        if (factura){
            render(view: "agregarPagoAFactura", model: [factura])
        }else{
            flash.error = "Error al Buscar Factura"
            redirect(action: 'abrirPagarFactura')
        }
    }

    def verPagos ={
        def facturaSeleccionada = params?.idFactura as Long

        def listaPagos = Factura.withCriteria {
            eq('anulada', false)
            eq('id', facturaSeleccionada)
        }

        render(template: 'listaFacturas', model: [listaPagos:listaPagos?.pagosFactura, factura:listaPagos])

    }

}
