package maternidad

/**
 * Created by walter on 09/04/2015.
 */
class RegistroPracticas {

    String nombreYApellido

    List<DetalleRegistroPractica> items

    static generar(PlanillaInternacion planilla){
        def registro = new RegistroPracticas()
        registro.items= new ArrayList<DetalleRegistroPractica>()

        registro.nombreYApellido=planilla.paciente.apellido +" "+planilla.paciente.nombre

        Integer renglon=0

        planilla.detalles.each {


            if(it.practica){

                DetalleRegistroPractica detalleRegistro = new DetalleRegistroPractica()

                detalleRegistro.fecha = it.fecha?.format("dd-MM-yyyy")
                detalleRegistro.nro = renglon+1
                renglon++
                detalleRegistro.codigo=it?.practica?.codigo
                detalleRegistro.practica=it?.practica?.nombre
                detalleRegistro.profesional=it.profesional.persona.toString()

                registro.items.add(detalleRegistro)




            }


        }

registro
    }

}
