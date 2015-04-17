package maternidad

class Factura {
    Date fecha
    Plan plan
    Boolean anulada = false
    Integer nrofactura
    Boolean pagoCompleto = false
    String periodo
    Double totalFacturado = 0
    Double totalPagado = 0
    Double totalMedicamento
    Double totalHonorario
    Double totalGasto

    PlanillaInternacion planillaInternacion
    // Set<DetalleFactura> detallesFactura
    Set<PagoFactura> pagosFactura

    static hasMany = [
            //  detallesFactura        : DetalleFactura,
            pagosFactura: PagoFactura
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


    public List<PlanillaInternacion> listaPlanillasInternacion() {
        return planillaInternacion?.detalles?.planillaInternacion?.unique()?.asList()
    }

    public Boolean facturaPendienteConfirmacion() {
        def lista = listaPlanillasInternacion()
        def res = false
        lista.each {
            if (it?.estadoPlanilla.codigo == "PEN") res = true
        }
        return res
    }

    String toString() { "Nº ${nrofactura}" }

    private calcularTotales(Set<DetalleFactura> detalles) {


        def totalHonorarios = 0
        def totalGastos = 0
        def totalMedicamentos = 0
        totalPagado = 0

        detalles.each {
            if (!it?.planillaInternacion?.factura) {


                totalHonorarios += (it?.valorHonorarios) ?: 0 * it.cantidad
                totalGastos += (it?.valorGastos) ?: 0 * it.cantidad
                totalMedicamentos += (it?.valorMedicamento) ?: 0 * it.cantidad


                if (pagosFactura) {
                    pagosFactura?.each { pago ->
                        totalPagado += pago.monto
                    }
                }


            }
        }

        totalFacturado = totalHonorarios + totalGastos + totalMedicamentos
        totalHonorario = totalHonorarios
        totalGasto = totalGastos
        totalMedicamento = totalMedicamentos

    }


    def beforeInsert = {
        plan = planillaInternacion?.plan
        calcularTotales(planillaInternacion?.detalles)

    }


    def afterInsert = {

        planillaInternacion?.detalles?.each {

            if (!it?.planillaInternacion?.factura) {

                if (it.planillaInternacion.estadoPlanilla == EstadoPlanilla.findByCodigo("FAC")) {

                    it.planillaInternacion = this.planillaInternacion

                    try {
                        it.save(flush: true)
                    } catch (Exception ex) {
                        ex
                    }

                }


            }


        }

    }

}
