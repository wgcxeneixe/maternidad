package maternidad

import grails.transaction.Transactional

@Transactional
class LiquidacionService {

    def Collection<Liquidacion> armarLiquidacionDelPago(PagoFactura pago) {
        def mapaLiquidaciones = [:]
        def listaLiquidaciones = Liquidacion.findAllByNumeroLiquidacionIsNull()
        listaLiquidaciones?.each {
            mapaLiquidaciones.put(it.profesional, it)
        }

        pago?.factura?.planillaInternacion?.detalles?.profesional?.each {
                if (it && !mapaLiquidaciones.containsKey(it)) mapaLiquidaciones.put(it, new Liquidacion(profesional: it))
            }




        mapaLiquidaciones.values()?.each {
            Liquidacion liq ->
                liq.agregarPagoFactura(pago)
                liq.save(flush: true)

        }

        return mapaLiquidaciones.values()

    }
}
