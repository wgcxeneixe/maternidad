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
            retencionPagos : RetencionPago
    ]


    static constraints = {
        retencion(nullable: true)
    }

//    def beforeInsert = {
//        actualizarRetencion()
//    }
//
//    def beforeUpdate = {
//        actualizarRetencion()
//    }
//
//    private void actualizarRetencion () {
//        Double total = 0
//        retencionPagos?.each {
//            total+= it?.monto
//        }
//        retencion = total
//    }
}
