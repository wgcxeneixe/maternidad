package maternidad

class Liquidacion {

    Profesional profesional
    Double montoBruto = 0
    Double montoNeto = 0
    Date fecha = new Date()
    Integer numeroRecibo
    Integer nuemroLiquidacion

    Set<DetalleLiquidacion> detallesLiquidacion

    static hasMany = [detallesLiquidacion: DetalleLiquidacion]

    static belongsTo = [profesional: Profesional]

    static constraints = {
    }

    String toString(){ "${profesional} - ${fecha?.format('dd/MM/yyyy')}" }

    def agregarPagoFactura(PagoFactura pago) {
        if(!detallesLiquidacion)detallesLiquidacion=[]
        pago.factura.planillaInternacion?.detalles?.each {
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
        if(!detallesLiquidacion)detallesLiquidacion=[]
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

