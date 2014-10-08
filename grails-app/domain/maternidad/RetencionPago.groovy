package maternidad

class RetencionPago {
    TipoRetencionPago tipo
    Double monto
    PagoFactura pagoFactura

    static belongsTo = [
            pagoFactura : PagoFactura
    ]

    static constraints = {
    }
}
