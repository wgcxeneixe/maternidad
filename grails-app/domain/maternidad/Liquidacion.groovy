package maternidad

class Liquidacion {

    Profesional profesional
    Double montoBruto = 0
    Double montoNeto = 0
    Date fecha
    Integer numeroRecibo
    Integer nuemroLiquidacion

    SortedSet<DetalleLiquidacion> detallesLiquidacion

    static hasMany = [detallesLiquidacion: DetalleLiquidacion]

    static belongsTo = [profesional: Profesional]

    static constraints = {
    }

    String toString(){ "${profesional} - ${fecha?.format('dd/MM/yyyy')}" }

    def agregarPagoFactura(PagoFactura pago) {

        pago.factura.detallesFactura.each {
            detalle ->
                if (detalle.profesional == profesional) {
                    def detalleLiq = new DetalleLiquidacion(liquidacion: this)
                    detalleLiq.agregarPagoFactura(pago, detalle)
                    detallesLiquidacion.add(detalleLiq)
                    montoBruto += detalleLiq.monto
                }
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
}

