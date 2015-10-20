package maternidad

/**
 * Created by walter on 09/04/2015.
 */
class DetalleSinValor {


    String nombreYApellido
    String fichaUnica

    List<LineaDetalleSinValor> items

    static generar(PlanillaInternacion planilla) {
        def detalle = new DetalleSinValor()
        detalle.items = new ArrayList<LineaDetalleSinValor>()

        detalle.nombreYApellido = planilla.paciente.apellido + " " + planilla.paciente.nombre
        detalle.fichaUnica = (planilla?.fichaAcler) ? planilla?.fichaAcler : ""

        Integer renglon = 0

        planilla.detalles.each {


            if (it.practica) {

                LineaDetalleSinValor lineaDetalle = new LineaDetalleSinValor()

                lineaDetalle.fecha = it.fecha?.format("dd-MM-yyyy")

                lineaDetalle.codigo = it?.practica?.codigo
                lineaDetalle.profesional = it?.profesional?.persona?.toString()
                lineaDetalle.practica = it?.practica?.nombre
                lineaDetalle.cantidad = it?.cantidad
                lineaDetalle.funcion = it?.funcion?.toString()
                lineaDetalle.matricula = (it?.profesional?.matriculaProvincial) ?: ""
                lineaDetalle.codigoCirculo =  (it?.profesional?.codigoCirculo) ?: ""
                lineaDetalle.orden = it?.funcion == 60? 1:(it?.funcion == 10? 2:(it?.funcion == 20? 3:(it?.funcion == 30?4:(it?.funcion == 70?5:10))))
                detalle.items.add(lineaDetalle)
            }
        }

        detalle.items?.sort{x,y->
            x.orden <=> y.orden
        }
        detalle.items?.each {
            it.nro = renglon + 1
            renglon++
        }

        detalle
    }


}
