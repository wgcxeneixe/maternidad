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
    String fichaUnica

    static generar(PlanillaInternacion planilla) {
        def detalle = new DetalleValorizado()
        detalle.items = new ArrayList<Detalle>()
        detalle.numeroAfiliado = (planilla?.numeroAfiliado) ?: ""
        detalle.diagnostico = (planilla?.diagnostico) ?: ""
        detalle.nombreYApellido = planilla.paciente.apellido + " " + planilla.paciente.nombre
        detalle.obraSocial = planilla?.plan?.obrasocial?.nombre
        detalle.fechaInternacion = planilla.fechaInternacion.format("dd-MM-yyyy")
        detalle.fechaAlta = (planilla?.fechaAlta) ? planilla?.fechaAlta?.format("dd-MM-yyyy") : ""
        detalle.domicilio = (planilla?.paciente?.calle) ?: "" + " - " + ((planilla?.paciente?.numero) ?: "")
        detalle.fichaUnica = (planilla?.fichaAcler) ? planilla?.fichaAcler : ""

        detalle.total = 0
        detalle.totalMedicamento = 0
        detalle.totalCant = 0
        detalle.totalImporte = 0


        planilla.detalles.each {

            if (it.practica) {
                Detalle detalleFacturacion = new Detalle()
                detalleFacturacion.cantidad = it?.cantidad?.toBigDecimal()
                detalleFacturacion.practica = it?.practica?.codigo
                detalleFacturacion.funcion = it?.funcion
                detalleFacturacion.profesional = it.profesional.persona.toString()
                detalleFacturacion.importe = Double.valueOf(it.total() * it?.cantidad)
                detalleFacturacion.orden = it?.funcion == 60 ? 1 : (it?.funcion == 10 ? 2 : (it?.funcion == 20 ? 3 : (it?.funcion == 30 ? 4 : (it?.funcion == 70 ? 5 : 10))))

                detalle.items.add(detalleFacturacion)
                detalle.totalCant += it?.cantidad
                detalle.totalImporte += it.total() * it?.cantidad

            } else if (it.medicamento) {

                detalle.totalMedicamento += it.valorMedicamento * it.cantidad

            }

        }
        detalle.items?.sort { x, y ->
            x.orden <=> y.orden
        }

        detalle.total = detalle.totalImporte + detalle.totalMedicamento

        detalle.totalImporte = Math.round(detalle.totalImporte * 100) / 100
        detalle.totalMedicamento = Math.round(detalle.totalMedicamento * 100) / 100

        detalle
    }


}
