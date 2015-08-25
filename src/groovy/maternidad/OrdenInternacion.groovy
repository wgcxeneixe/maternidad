package maternidad
/**
 * Created by walter on 16/03/2015.
 */
class OrdenInternacion {

    String obraSocial
    String numeroAfiliado
    String nombreYApellido
    String diagnostico
    String tratamiento
    String fecha
    String historia

    static generar(PlanillaInternacion planilla){
        def orden = new OrdenInternacion()

        orden.numeroAfiliado=(planilla?.numeroAfiliado)?:""
        orden.diagnostico=(planilla?.diagnostico)?:""
        orden.nombreYApellido=planilla.paciente.apellido +" "+planilla.paciente.nombre
        orden.obraSocial=planilla?.plan?.obrasocial?.sigla
        orden.tratamiento=(planilla?.tratamiento)?:""
        orden.fecha=planilla?.fechaInternacion?.format("dd-MM-yyyy")
        orden.historia=(planilla?.numeroIngreso)?planilla.numeroIngreso.toString():""

    orden
    }

}
