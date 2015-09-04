package maternidad

class FacturaPeriodo {

    Date fecha
    Plan plan
    Boolean anulada = false
    Boolean pagoCompleto = false
    String periodo
    Double totalFacturado = 0
    Double totalPagado = 0
    Double totalMedicamento = 0
    Double totalHonorario = 0
    Double totalGasto = 0

    Set<PagoFactura> pagosFactura
    Set<Factura> facturas

    static hasMany = [
            pagosFactura: PagoFactura,
            facturas: Factura
    ]

    static belongsTo = [
            plan: Plan
    ]

    static constraints = {

    }

    public Double getTotalRetencion() {
        Double total = 0
        pagosFactura?.each() {
            total += it?.retencion
        }
        return total
    }

    public Double getTotalFacturaciones() {
        Double total = 0
        facturas?.each() { Factura factura ->
            total += factura?.totalFacturado
        }
        return total
    }

    def Boolean agregarPago(PagoFactura pago) {
        pago.facturaPeriodo = this
        pago.save(flush: true)
        this.totalPagado += pago.monto + pago.retencion
        if (!this.pagosFactura) this.pagosFactura = []
        this.pagosFactura += pago

        if (this?.totalPagado >= totalFacturaciones) this?.pagoCompleto = true
        this.save(flush: true)

    }

    def actualizar(){
        this.totalPagado = 0
        pagosFactura?.each() { PagoFactura pago ->
            this.totalPagado += pago?.retencion + pago.monto
        }
        this.save(flush: true)
    }

    def beforeInsert = {

        facturas?.each { Factura factura ->
            totalFacturado += factura.totalFacturado
            totalMedicamento += factura.totalMedicamento
            totalHonorario += factura.totalHonorario
            totalGasto += factura.totalGasto
        }

    }

}



