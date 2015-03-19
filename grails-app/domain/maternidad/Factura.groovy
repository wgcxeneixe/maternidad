package maternidad

class Factura {
    Date fecha
    Plan plan
    Boolean anulada = false
    Integer nrofactura
    Boolean pagoCompleto = false
    Integer periodo
    Double totalFacturado = 0
    Double totalPagado = 0



    Set<DetalleFactura> detallesFactura
    Set<PagoFactura> pagosFactura

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


    public List<PlanillaInternacion> listaPlanillasInternacion(){
        return detallesFactura?.planillaInternacion?.unique()?.asList()
    }

    public Boolean facturaPendienteConfirmacion(){
        def lista = listaPlanillasInternacion()
        def res = false
        lista.each {
            if(it?.estadoPlanilla.codigo=="PEN") res = true
        }
        return res
    }

    String toString() { "Nº ${nrofactura}" }


}
