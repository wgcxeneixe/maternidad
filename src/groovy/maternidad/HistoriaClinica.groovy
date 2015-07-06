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
    String otro1
    String otro2
    String diagnostico
    String tratamiento


    static generar(PlanillaInternacion planilla){

      def historiaClinica= new HistoriaClinica()
      historiaClinica.historia=planilla?.numeroIngreso
      historiaClinica.nombreYApellido=planilla.paciente?.toString()
      historiaClinica.sexo=(planilla?.paciente?.sexo)?planilla?.paciente?.sexo:""
      historiaClinica.edad=planilla?.edad()?.toString()
      historiaClinica.domicilio=(planilla?.paciente?.calle)?:""  +" - "+ ((planilla?.paciente?.numero)?:"")
      historiaClinica.obraSocial=planilla?.plan?.obrasocial?.codigo+' - '+planilla?.plan?.obrasocial?.nombre
      historiaClinica.fechaIngreso=planilla.fechaInternacion.format("dd-MM-yyyy")
      historiaClinica.fechaAlta=(planilla?.fechaAlta)?planilla?.fechaAlta?.format("dd-MM-yyyy"):""
      historiaClinica.medicoCabecera=(planilla?.medicoCabecera)?planilla?.medicoCabecera?.toString():""
      historiaClinica.medicoCirujano=(planilla?.medicoCirujano)?planilla?.medicoCirujano?.toString():""
      historiaClinica.medicoAyudante1=(planilla?.medicoAyudante1)?planilla?.medicoAyudante1?.toString():""
      historiaClinica.medicoAyudante2=(planilla?.medicoAyudante2)?planilla?.medicoAyudante2?.toString():""
      historiaClinica.medicoAnestesista=(planilla?.medicoAnestesista)?planilla?.medicoAnestesista?.toString():""
      historiaClinica.otro1=(planilla?.medicoOtro1)?planilla?.medicoOtro1?.toString():""
      historiaClinica.otro2=(planilla?.medicoOtro2)?planilla?.medicoOtro2?.toString():""
      historiaClinica.diagnostico=(planilla?.diagnostico)?planilla?.diagnostico:""
      historiaClinica.tratamiento=(planilla?.tratamiento)?planilla?.tratamiento:""

      historiaClinica
    }

}