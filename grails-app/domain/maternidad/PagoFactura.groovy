package maternidad

class PagoFactura {

    Factura factura
    FacturaPeriodo facturaPeriodo
    Double monto = 0
    Liquidacion liquidacion
    Date fecha
    TipoPago tipoPago
    Double retencion = 0
    Integer numeroComprobante
    String aclaracionComprobante
    Double porcentajeALiquidar  = 0
    Double porcentajeLiquidado  = 0
    Boolean descartarHonorarios = false


    Set<RetencionPago> retencionPagos

    static hasMany = [
            retencionPagos: RetencionPago,
            liquidaciones: Liquidacion
    ]


    static constraints = {
        retencion(nullable: true)
        //retencion(nullable: true, validator: validadorRetencion)
        monto(nullable: false)//, validator: validadorMonto)
        factura(nullable: true)
        numeroComprobante(nullable: true)
        tipoPago(nullable: false)
        porcentajeALiquidar(nullable: false, validator: validadorPorcentajeALiquidar)
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

    static def validadorPorcentajeALiquidar = {
       double val , PagoFactura obj ->
            def resp = true
            val=val as double
            if (obj.porcentajeLiquidado  + val > 100) {
                resp = "pagoFactura.porcentajeALiquidar.invalido"
            }
            resp
    }

//    static def validadorPorcentajeALiquidar = {
//        val, Factura obj ->
//            def resp = true
//            if (obj.porcentajeLiquidado + val > 100) {
//                resp = "pagoFactura.porcentajeALiquidar.invalido"
//            }
//            resp
//    }

    static def validadorMonto = {
      double  val, Factura obj ->

            def resp = true
            def totalPagos = obj?.getTotalPagos() - obj?.getTotalRetencion()
            if (val > totalPagos) {
                resp = "pagoFactura.pago.mayor.a.monto"
            } else {
                val= val as double
            obj?.totalPagado = obj?.totalPagado +  val
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

    def montoALiquidar(){
        return monto * porcentajeALiquidar / 100
    }

    String toString() { facturaPeriodo? ("${facturaPeriodo.periodo} - ${facturaPeriodo.plan}"):("${fecha?.format('dd/MM/yyyy')} ++ ${monto}") }
}
