package maternidad

/**
 * Created by walter on 09/04/2015.
 */
class DetalleSinValor {


    String nombreYApellido

    List<LineaDetalleSinValor> items

    static generar(PlanillaInternacion planilla){
        def detalle = new DetalleSinValor()
        detalle.items= new ArrayList<LineaDetalleSinValor>()

        detalle.nombreYApellido=planilla.paciente.apellido +" "+planilla.paciente.nombre

        Integer renglon=0

        planilla.detalles.each {


            if(it.practica){

                LineaDetalleSinValor lineaDetalle = new LineaDetalleSinValor()

                lineaDetalle.fecha = it.fecha?.format("dd-MM-yyyy")
                lineaDetalle.nro = renglon+1
                renglon++
                lineaDetalle.codigo=it?.practica?.codigo
                lineaDetalle.profesional=it?.profesional?.persona?.toString()
                lineaDetalle.practica=it?.practica?.nombre
                lineaDetalle.cantidad=it?.cantidad
                lineaDetalle.funcion=it?.funcion?.toString()
                lineaDetalle.matricula=(it?.profesional?.matriculaProvincial)?:""
                detalle.items.add(lineaDetalle)




            }


        }

        detalle
    }




}
