package maternidad

/**
 * Created by walter on 08/04/2015.
 */
class FacturaMedicamentos {



    String nombreYApellido

    List<DetalleFacturaMedicamento> items
    BigDecimal totalMedicamento
    BigDecimal totalMedicamentoAfiliado
    BigDecimal totalMedicamentoOS
    BigDecimal totalDescartable
    BigDecimal totalDescartableAfiliado
    BigDecimal totalDescartableOS



    BigDecimal total
    BigDecimal totalAfiliado
    BigDecimal totalOS

    static generar(PlanillaInternacion planilla){
        def factura = new FacturaMedicamentos()
        factura.items= new ArrayList<DetalleFacturaMedicamento>()

        factura.nombreYApellido=planilla.paciente.apellido +" "+planilla.paciente.nombre


        factura.totalMedicamento=0
        factura.totalMedicamentoAfiliado=0
        factura.totalMedicamentoOS=0
        factura.totalDescartable=0
        factura.totalDescartableAfiliado=0
        factura.totalDescartableOS=0



        factura.total=0
        factura.totalAfiliado=0
        factura.totalOS=0

        Integer renglon=0

        planilla.detalles.each {


             if(it.medicamento){

                 DetalleFacturaMedicamento detalleFacturacion = new DetalleFacturaMedicamento()
                 detalleFacturacion.cantidad = it?.cantidad
                 detalleFacturacion.fecha = it.fecha?.format("dd-MM-yyyy")
                 detalleFacturacion.formaDePres = (it?.medicamento?.formaPresentacion)?:""
                 detalleFacturacion.nombre = it?.medicamento?.nombre
                 detalleFacturacion.nro = renglon+1
                 renglon++
                 detalleFacturacion.precioU = it.valorMedicamento
                 detalleFacturacion.totalLinea = Math.round(detalleFacturacion.precioU * it?.cantidad * 100) / 100

                 factura.items.add(detalleFacturacion)

                 def porcentajeAfiliado=(it.plan.porcentajeAfiliado)?:0
                 def porcentajeOS=100-porcentajeAfiliado

                 if(it?.medicamento?.tipoMedicamento?.codigo=='DES'){
                     factura.totalDescartable+= Math.round(it.valorMedicamento*it.cantidad  * 100) / 100
                     factura.totalDescartableAfiliado+= Math.round(it.valorMedicamento*it.cantidad*porcentajeAfiliado/100  * 100) / 100
                     factura.totalDescartableOS+=  Math.round(it.valorMedicamento*it.cantidad*porcentajeOS/100  * 100) / 100
                 }
                 else if(it?.medicamento?.tipoMedicamento?.codigo=='MED'){
                     factura.totalMedicamento+=Math.round(it.valorMedicamento*it.cantidad  * 100) / 100
                     factura.totalMedicamentoAfiliado+=Math.round(it.valorMedicamento*it.cantidad*porcentajeAfiliado/100  * 100) / 100
                     factura.totalMedicamentoOS+=Math.round(it.valorMedicamento*it.cantidad*porcentajeOS/100  * 100) / 100
                 }



                 factura.total+=Math.round(it.valorMedicamento*it.cantidad  * 100) / 100
                 factura.totalAfiliado+=Math.round(it.valorMedicamento*it.cantidad*porcentajeAfiliado/100  * 100) / 100
                 factura.totalOS+=Math.round(it.valorMedicamento*it.cantidad*porcentajeOS/100  * 100) / 100



             }


        }

        factura.total=  Math.round(factura.total * 100) / 100
        factura.totalMedicamento=  Math.round(factura.totalMedicamento * 100) / 100
        factura.totalDescartable=  Math.round(factura.totalDescartable * 100) / 100


        factura
    }



}
