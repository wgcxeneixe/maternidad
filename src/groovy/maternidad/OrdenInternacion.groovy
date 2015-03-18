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

    static generar(PlanillaInternacion planilla){
        def orden = new OrdenInternacion()

        orden.numeroAfiliado=planilla?.numeroAfiliado
        orden.diagnostico=planilla?.diagnostico
        orden.nombreYApellido=planilla.paciente.apellido +" "+planilla.paciente.nombre
        orden.obraSocial=planilla?.plan?.obrasocial?.nombre
        orden.tratamiento=planilla?.tratamiento
        orden.fecha=new Date().format("dd-MM-yyyy")

    orden
    }

}
