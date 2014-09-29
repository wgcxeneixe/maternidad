package maternidad

class Factura {
    Date fecha
    Plan plan
    Boolean anulada
    Integer nrofactura
    Boolean pagoCompleto
    Integer periodo
    Double totalFacturado
    Double totalPagado

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

    public Double getTotalRetencion(){
        Double total = 0
        pagosFactura?.each(){
           total += it?.retencion
        }
        return total
    }
}
