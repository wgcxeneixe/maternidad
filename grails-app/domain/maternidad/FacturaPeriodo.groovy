package maternidad

class FacturaPeriodo {

    Date fecha
    Plan plan
    Boolean anulada = false
    Boolean pagoCompleto = false
    String periodo
    Double totalFacturado = 0
    Double totalPagado = 0
    Double totalMedicamento
    Double totalHonorario
    Double totalGasto

    Set<PagoFactura> pagosFactura
    Set<Factura> facturas

    static hasMany = [
            pagosFactura        : PagoFactura ,
            facturas : Factura
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
