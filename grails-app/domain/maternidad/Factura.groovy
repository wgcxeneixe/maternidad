package maternidad

class Factura {
    Date fecha
    Plan plan
    Boolean anulada
    Integer nrofactura
    Boolean pagoCompleto
    Integer periodo
    SortedSet<DetalleFactura> detallesFactura
    SortedSet<PagoFactura> pagosFactura

    static hasMany = [
            detallesFactura        : DetalleFactura,
            pagosFactura        : PagoFactura
            ]

    static belongsTo = [
            plan : Plan
    ]

    static constraints = {

    }
}
