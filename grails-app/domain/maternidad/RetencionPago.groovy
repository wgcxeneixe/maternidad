package maternidad

class RetencionPago {
    TipoRetencionPago tipo
    Double monto
    PagoFactura pagoFactura
    String observaciones

    //concepto de retencion o concepto de pago???????????????????

    static belongsTo = [
            pagoFactura : PagoFactura
    ]

    static constraints = {
    }

    def Long porcentajeDelPago(){
        return monto * 100 / pagoFactura.monto
    }



}
