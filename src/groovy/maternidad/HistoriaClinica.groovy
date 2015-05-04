package maternidad

/**
 * Created by walter on 04/05/2015.
 */
class HistoriaClinica {

    String historia
    String nombreYApellido
    String sexo
    String edad
    String domicilio
    String obraSocial
    String fechaIngreso
    String fechaAlta
    String medicoCabecera
    String medicoCirujano
    String medicoAyudante1
    String medicoAyudante2
    String medicoAnestesista
    String diagnostico
    String tratamiento


    static generar(PlanillaInternacion planilla){

      def historiaClinica= new HistoriaClinica()
      historiaClinica.historia=planilla?.numeroIngreso
      historiaClinica.nombreYApellido=planilla.paciente?.toString()
      historiaClinica.sexo="M"
      historiaClinica.edad=planilla?.edad()?.toString()
      historiaClinica.domicilio=(planilla?.paciente?.calle)?:""  +" - "+ ((planilla?.paciente?.numero)?:"")
      historiaClinica.obraSocial=planilla?.plan?.obrasocial?.codigo+' - '+planilla?.plan?.obrasocial?.nombre
      historiaClinica.fechaIngreso=planilla.fechaInternacion.format("dd-MM-yyyy")
      historiaClinica.fechaAlta=(planilla?.fechaAlta)?planilla?.fechaAlta?.format("dd-MM-yyyy"):""
      historiaClinica.medicoCabecera=""
      historiaClinica.medicoCirujano=""
      historiaClinica.medicoAyudante1=""
      historiaClinica.medicoAyudante2=""
      historiaClinica.medicoAnestesista=""
      historiaClinica.diagnostico=planilla?.diagnostico
      historiaClinica.tratamiento=planilla?.tratamiento

      historiaClinica
    }

}
