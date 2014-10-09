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

    SortedSet detallesFactura
    // SortedSet pagosFactura

    static hasMany = [
            detallesFactura: DetalleFactura,
            pagosFactura: PagoFactura
    ]

    static belongsTo = [
            plan: Plan
    ]

    static constraints = {
        fecha(nullable: false)
        totalFacturado(nullable: false)
        totalPagado(nullable: false, validator: pagoCompletoValidator)

    }

    public Double getTotalRetencion() {
        Double total = 0
        pagosFactura?.each() {
            total += it?.retencion
        }
        return total
    }


    public Double getTotalPagos(factura) {
        Double totalMonto = 0
        factura?.pagosFactura?.each() {
            totalMonto += it?.monto
        }
        return total
    }

    static def pagoCompletoValidator = {
        Factura obj ->
            if (obj?.totalFacturado >= obj?.totalPagado) {
                pagoCompleto = true
            } else {
                pagoCompleto = false
            }

    }

    String toString() { "${nrofactura} (${fecha?.format('dd/MM/yyyy')} - ${totalFacturado})" }

}
