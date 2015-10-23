package maternidad

class Liquidacion {

    Profesional profesional
    Double montoBruto = 0
    Double montoNeto = 0
    Date fecha
    Factura factura
    Integer numeroRecibo
    Integer numeroLiquidacion

    Set<DetalleLiquidacion> detallesLiquidacion

    static hasMany = [detallesLiquidacion: DetalleLiquidacion]

    static belongsTo = [profesional: Profesional]

    static constraints = {
    }

    String toString() { "${profesional} - ${fecha?.format('dd/MM/yyyy')}" }

    //TODO: ver de sacar este método
//    def agregarPagoFactura(PagoFactura pago) {
//        if (!detallesLiquidacion) detallesLiquidacion = []
//        pago?.factura?.planillaInternacion?.detalles?.each {
//                detalle ->
//                    if (detalle.profesional == profesional) {
//                        def detalleLiq = new DetalleLiquidacion(liquidacion: this)
//                        detalleLiq.agregarPagoFactura(pago, detalle)
//                        detallesLiquidacion.add(detalleLiq)
//                        montoBruto += detalleLiq.monto
//                    }
//            }
//
//
//        montoNeto = montoBruto
//
//        if (pago.retencionPagos) {
//            pago.retencionPagos.each {
//                ret ->
//                    def detRet = new DetalleLiquidacion(liquidacion: this)
//                    detRet.agregarRetencionPagoFactura(ret)
//                    detallesLiquidacion.add(detRet)
//                    montoNeto -= detRet.monto
//            }
//        }
//    }

    def agregarPagoFactura(PagoFactura pago) {
        if (!detallesLiquidacion) detallesLiquidacion = []
        def totalFacturado = 0
        pago?.factura?.planillaInternacion?.detalles?.each {
            detalle ->
                if (detalle.profesional == profesional) {
                    totalFacturado += detalle.total()
                }
        }

        if (totalFacturado > 0) {
            def detalleLiq = new DetalleLiquidacion(liquidacion: this)
            detalleLiq.agregarPagoFactura(pago, totalFacturado)
            detallesLiquidacion.add(detalleLiq)
            montoBruto += detalleLiq.monto
        }


        montoNeto = montoBruto

        if (pago.retencionPagos) {
            pago.retencionPagos.each {
                ret ->
                    def detRet = new DetalleLiquidacion(liquidacion: this)
                    detRet.agregarRetencionPagoFactura(ret)
                    detallesLiquidacion.add(detRet)
                    montoNeto -= detRet.monto
            }
        }
    }

    def agregarConceptosProfesional(listaCodigoConeptos) {
        if (!detallesLiquidacion) detallesLiquidacion = []
        def listaConceptos = profesional.listaConceptos?.findAll {
            it.conceptoProfesional.codigo in listaCodigoConeptos
        }
        listaConceptos?.each {
            cpp ->
                def detRet = new DetalleLiquidacion(liquidacion: this)
                detRet.agregarConceptoPorProfesional(cpp)
                detallesLiquidacion.add(detRet)
                if (detRet.debito) {
                    montoNeto -= detRet.monto
                } else {
                    montoNeto += detRet.monto
                }
        }
    }

    def actualizarTotales() {
        montoBruto = 0
        montoNeto = 0
        def descuentos = 0
        detallesLiquidacion?.each { DetalleLiquidacion detalle ->
            if (!detalle.debito) {
                montoBruto += detalle.monto
            } else {
                descuentos += detalle.monto
            }
        }
        montoNeto = montoBruto - descuentos
    }
}

