package maternidad

import grails.transaction.Transactional

@Transactional
class LiquidacionService {

    def Collection<Liquidacion> armarLiquidacionDelPago(PagoFactura pago) {
        def mapaLiquidaciones = [:]
        //quito esto para que cree nueva liquidaciones para el pago y no se las agregue a las liquidaciones anteriores
//        def listaLiquidaciones = Liquidacion.findAllByNumeroLiquidacionIsNull()
//        listaLiquidaciones?.each {
//            mapaLiquidaciones.put(it.profesional, it)
//        }

        pago?.factura?.planillaInternacion?.detalles?.profesional?.each {
            if (!pago.descartarHonorarios || it.esMaternidad()) {
                if (it && !mapaLiquidaciones.containsKey(it)) mapaLiquidaciones.put(it, new Liquidacion(profesional: it))
            }
        }




        mapaLiquidaciones.values()?.each {
            Liquidacion liq ->
                liq.agregarPagoFactura(pago)
                liq.save(flush: true)

        }

        return mapaLiquidaciones.values()

    }
}
