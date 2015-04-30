package maternidad

class DetalleValorizado {

    String obraSocial
    String numeroAfiliado
    String nombreYApellido
    String diagnostico
    String fechaInternacion
    String fechaAlta
    String domicilio
    List<Detalle> items
    BigDecimal totalMedicamento
    BigDecimal totalCant
    BigDecimal totalImporte
    BigDecimal total

    static generar(PlanillaInternacion planilla){
        def detalle = new DetalleValorizado()
        detalle.items= new ArrayList<Detalle>()
        detalle.numeroAfiliado=(planilla?.numeroAfiliado)?:""
        detalle.diagnostico=(planilla?.diagnostico)?:""
        detalle.nombreYApellido=planilla.paciente.apellido +" "+planilla.paciente.nombre
        detalle.obraSocial=planilla?.plan?.obrasocial?.nombre
        detalle.fechaInternacion=planilla.fechaInternacion.format("dd-MM-yyyy")
        detalle.fechaAlta=(planilla?.fechaAlta)? planilla?.fechaAlta?.format("dd-MM-yyyy"):""
        detalle.domicilio=(planilla?.paciente?.calle)?:""  +" - "+ ((planilla?.paciente?.numero)?:"")

detalle.total=0
detalle.totalMedicamento=0
detalle.totalCant=0
detalle.totalImporte=0


        planilla.detalles.each {

            if (it.practica){
                Detalle detalleFacturacion=new Detalle()
                detalleFacturacion.cantidad=it?.cantidad
                detalleFacturacion.practica=it?.practica?.codigo
                detalleFacturacion.funcion=it?.funcion
                detalleFacturacion.profesional=it.profesional.persona.toString()
                detalleFacturacion.importe=Math.round(it.total()*it?.cantidad * 100) / 100

                detalle.items.add(detalleFacturacion)
detalle.totalCant+=it?.cantidad
detalle.totalImporte+=  Math.round(it.total()*it?.cantidad * 100) / 100

            }
            else if(it.medicamento){

detalle.totalMedicamento+=it.valorMedicamento*it.cantidad

            }

        }

detalle.total=detalle.totalImporte+detalle.totalMedicamento

        detalle.total=  Math.round(detalle.total * 100) / 100
        detalle.totalImporte=  Math.round(detalle.totalImporte * 100) / 100
        detalle.totalMedicamento=  Math.round(detalle.totalMedicamento * 100) / 100

        detalle
    }


}
