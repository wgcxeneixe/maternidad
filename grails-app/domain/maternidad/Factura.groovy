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

    private calcularTotales(Set<DetalleFactura> detalles){


        def totalHonorarios=0
        def totalGastos=0
        def totalMedicamentos=0

        detalles.each {
           if(!it.factura){

             if (it.planillaInternacion.estadoPlanilla==EstadoPlanilla.findByCodigo("AFA")){

                 totalHonorarios+=  it.valorHonorarios * it.cantidad
                 totalGastos+=it.valorGastos * it.cantidad
                 totalMedicamentos+= it.valorMedicamento * it.cantidad


             }



           }
        }

        totalFacturado=totalHonorarios+totalGastos+totalMedicamentos
        totalHonorario=totalHonorarios
        totalGasto=totalGastos
        totalMedicamento=totalMedicamentos

    }


    def beforeInsert = {

      calcularTotales(detallesFactura)

    }

    def beforeUpdate = {

        calcularTotales(detallesFactura)

    }


    def afterInsert={

        detallesFactura.each {

            if(!it.factura){

                if (it.planillaInternacion.estadoPlanilla==EstadoPlanilla.findByCodigo("AFA")){

                 it.factura=this
                 it.save(flush: true)
                }



            }


        }

    }

}
