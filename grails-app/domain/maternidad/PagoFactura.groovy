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
    }

    String toString() { "${fecha?.format('dd/MM/yyyy')} - ${monto}" }

//    static pagosFacturaOrdenar(Factura factura) {
    //       def pagos = []
    //       if (factura) {
//            pagos = PagoFactura.findAllByFactura(factura)
//            pagos.sort {it.nrofactura }
    //      }
    //       pagos
    //   }

//    def beforeInsert = {
    //      pagosFacturaOrdenar(factura)
//        actualizarRetencion()
    // }
//
    //  def beforeUpdate = {
    //     pagosFacturaOrdenar(factura)
//        actualizarRetencion()
    // }
//
//    private void actualizarRetencion () {
//        Double total = 0
//        retencionPagos?.each {
//            total+= it?.monto
//        }
//        retencion = total
//    }


}
