package maternidad

class PagoFactura {

    Factura factura
    Double monto
    Liquidacion liquidacion
    Date fecha
    TipoPago tipoPago
    Double retencion
    Integer numeroComprobante
    String aclaracionComprobante
    Double porcentajeALiquidar
    Double porcentajeLiquidado

    SortedSet<RetencionPago> retencionPagos

    static hasMany = [
            retencionPagos: RetencionPago
    ]


    static constraints = {
        retencion(nullable: true)
        //retencion(nullable: true, validator: validadorRetencion)
        monto(nullable: false, validator: validadorMonto)
        factura(nullable: false)
        numeroComprobante(nullable: false)
        tipoPago(nullable: false)

    }

    def beforeInsert = {
    }

    def beforeUpdate = {
    }

//    private void actualizarRetencion() {
//        Double total = 0
//        retencionPagos?.each {
//            total += it?.monto
//        }
//        retencion = total
//    }

    static def validadorRetencion = {
        PagoFactura val, Factura obj ->
            def resp = true
            if (val?.retencion > obj?.totalFacturado) {
                resp = "pagoFactura.monto.invalido"
            }
            resp
    }


    static def validadorMonto = {
        PagoFactura val, Factura obj ->
            println 'obj?.getTotalPagos()'
            println obj?.getTotalPagos()
            println 'obj?.getTotalRetencion()'
            println obj?.getTotalRetencion()
            println 'obj?.getTotalPagos() - obj?.getTotalRetencion()'
            println obj?.getTotalPagos() - obj?.getTotalRetencion()
            println 'val?.monto > totalPagos'
            println val?.monto > totalPagos

            def resp = true
            def totalPagos = obj?.getTotalPagos() - obj?.getTotalRetencion()
            if (val?.monto > totalPagos) {
                resp = "pagoFactura.pago.mayor.a.monto"
            }
            resp
    }

//    static pagosFacturaOrdenar(Factura factura) {
//        def pagos = []
//        if (factura) {
//            pagos = PagoFactura.findAllByFactura(factura)
//            pagos.sort { it.nrofactura }
//        }
//        pagos
//    }


    String toString() { "${fecha?.format('dd/MM/yyyy')} - ${monto}" }
}
