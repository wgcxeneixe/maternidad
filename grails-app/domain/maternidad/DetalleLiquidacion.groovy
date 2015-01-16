package maternidad

class DetalleLiquidacion {

    ConceptoProfesional conceptoProfesional
    Double monto
    Liquidacion liquidacion
    DetalleFactura detalleFactura
    ConceptoPorProfesional conceptoPorProfesional
    Double porcentajePagoFacturaLiquidado
    PagoFactura pagoFactura
    RetencionPago retencionPago
    Boolean debito = false
    String detalle

    static belongsTo = [
            liquidacion: Liquidacion
    ]

    static constraints = {
    }

    def agregarPagoFactura(PagoFactura pago, DetalleFactura detalleFactura) {
        this.detalleFactura = detalleFactura
        this.pagoFactura = pago
        this.porcentajePagoFacturaLiquidado = pagoFactura.porcentajeALiquidar
        monto = detalleFactura.total * porcentajePagoFacturaLiquidado / 100
        detalle = "Pago de práctica ${detalleFactura.practica.codigo} del plan ${detalleFactura.plan.codigo}, factura Nro ${detalleFactura.factura.nrofactura}"
    }

    def agregarRetencionPagoFactura(RetencionPago retencion) {
        this.retencionPago = retencion
        this.debito = true
        monto = retencionPago.monto * retencion.porcentajeDelPago() / 100
        detalle = "Prorrateo del Pago de la factura Nro ${detalleFactura.factura.nrofactura} plan ${detalleFactura.plan.codigo}"
    }

    def agregarConceptoPorProfesional(ConceptoPorProfesional cpp) {
        this.conceptoPorProfesional = cpp
        this.debito = !cpp.conceptoProfesional.credito
        if (cpp.montoFijo && cpp.montoFijo > 0) {
            monto = cpp.montoFijo
        } else {
            monto = this.liquidacion.montoBruto * cpp.porcentaje % 100
//            if (cpp.conceptoProfesional.aplicaSobreBruto) {
//                monto = this.liquidacion.montoBruto * cpp.porcentaje % 100
//            }else{
//                monto = this.liquidacion.montoBruto * cpp.porcentaje % 100
//            }
        }
        detalle = "Concepto: ${conceptoPorProfesional.conceptoProfesional.nombre}"
    }

    //antes de insertar se actualiza el cpp si era por unica vez se desactiva
    def beforeInsert = {
        if (conceptoPorProfesional && conceptoPorProfesional.porUnicaVez) {
            conceptoPorProfesional.activo = false
            conceptoPorProfesional.save(flush: true)
        }
    }
}
