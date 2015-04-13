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
                 detalleFacturacion.formaDePres = it?.medicamento?.formaPresentacion
                 detalleFacturacion.nombre = it?.medicamento?.nombre
                 detalleFacturacion.nro = renglon+1
                 renglon++
                 detalleFacturacion.precioU = it.valorMedicamento
                 detalleFacturacion.totalLinea = detalleFacturacion.precioU * it?.cantidad

                 factura.items.add(detalleFacturacion)

                 if(it?.medicamento?.tipoMedicamento?.codigo=='DES'){
                     factura.totalDescartable+=it.valorMedicamento*it.cantidad
                     factura.totalDescartableAfiliado=0
                     factura.totalDescartableOS=0
                 }
                 else if(it?.medicamento?.tipoMedicamento?.codigo=='MED'){
                     factura.totalMedicamento=it.valorMedicamento*it.cantidad
                     factura.totalMedicamentoAfiliado=0
                     factura.totalMedicamentoOS=0
                 }



                 factura.total+=it.valorMedicamento*it.cantidad
                 factura.totalAfiliado=0
                 factura.totalOS=0



             }


        }

        factura.total=  Math.round(factura.total * 100) / 100
        factura.totalMedicamento=  Math.round(factura.totalMedicamento * 100) / 100
        factura.totalDescartable=  Math.round(factura.totalDescartable * 100) / 100


        factura
    }



}
