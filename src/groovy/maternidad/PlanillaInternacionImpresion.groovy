package maternidad

/**
 * Created by walter on 21/04/2015.
 */
class PlanillaInternacionImpresion {

    String historiaClinica
    String obraSocial
    String nroAfiliado
    String nombreYApellido
    String nroDocumento
    String tipoDocumento
    String fechaNacimiento
    String sexo
    String estadoCivil
    String domicilio
    String telefono
    String ocupacion
    String familiar
    String domicilioResponsable
    String observaciones
    String medicos
    String fechaAlta
    String horaAlta
    String diagnostico
    String edad
    String ficha

    List<NacimientoImpresion> nacimientos
    List<LineaPlanillaImpresion> items


    static generar(PlanillaInternacion planilla){
        def planillaI = new PlanillaInternacionImpresion()

        planillaI.domicilio=((planilla?.paciente?.calle)?:"")  +' - '+ ((planilla?.paciente?.numero)?:"") + " PISO:${planilla?.paciente?.piso?:'-'} DPTO:${planilla?.paciente?.departamento?:'-'} (CP:${planilla?.paciente?.codigoPostal}) ${planilla?.paciente?.localidad?.nombre} - ${planilla?.paciente?.localidad?.provincia?.nombre}"
        planillaI.estadoCivil=(planilla?.paciente?.estadoCivil?.denominacion)?:""
        planillaI.familiar=planilla?.dniFamiliarResponsable + ", " +planilla?.nombreFamiliarResponsable
        planillaI.historiaClinica=planilla?.numeroIngreso
        planillaI.nombreYApellido=planilla?.paciente?.toString()
        planillaI.nroAfiliado=(planilla?.numeroAfiliado)?:""
        planillaI.nroDocumento=planilla?.paciente?.nroDocumento
        planillaI.obraSocial=planilla?.plan?.obrasocial?.sigla+' ('+planilla?.plan.obrasocial?.codigo+') - '+planilla?.tipoSocio
        planillaI.observaciones=(planilla?.observaciones)?:""
        planillaI.tipoDocumento=planilla?.paciente?.tipoDocumento?.nombre
        planillaI.edad=(planilla?.fechaNacimiento)?planilla?.edad()?.toString():""
        String medicos="- "
        //planilla.profesionales.each {medicos+=it?.persona?.toString()+" - "}
        medicos+=(planilla?.medicoCabecera)?planilla?.medicoCabecera?.toString()+" - ":""
        medicos+=(planilla?.medicoCirujano)?planilla?.medicoCirujano?.toString()+" - ":""
        medicos+=(planilla?.medicoAyudante1)?planilla?.medicoAyudante1?.toString()+" - ":""
        medicos+=(planilla?.medicoAyudante2)?planilla?.medicoAyudante2?.toString()+" - ":""
        medicos+=(planilla?.medicoAnestesista)?planilla?.medicoAnestesista?.toString()+" - ":""
        medicos+=(planilla?.medicoOtro1)?planilla?.medicoOtro1?.toString()+" - ":""
        medicos+=(planilla?.medicoOtro2)?planilla?.medicoOtro2?.toString()+" - ":""
        planillaI.medicos=medicos


        planillaI.domicilioResponsable=(planilla?.domicilioFamiliarResponsable)?planilla?.domicilioFamiliarResponsable:""
        planillaI.fechaNacimiento=(planilla.fechaNacimiento)?planilla?.fechaNacimiento?.format("dd-MM-yyyy"):""
        planillaI.ocupacion=(planilla?.ocupacion)?planilla?.ocupacion:""
        planillaI.sexo=planilla.paciente?.sexo
        planillaI.telefono=(planilla.paciente.telefono)?planilla.paciente?.telefono:""

        planillaI.fechaAlta=(planilla.fechaAlta)?planilla?.fechaAlta?.format("dd-MM-yyyy"):""
        planillaI.horaAlta=(planilla.fechaAlta)?planilla?.fechaAlta?.format("HH:mm"):""
        planillaI.diagnostico=(planilla?.diagnostico)?planilla?.diagnostico:""
planillaI.ficha=(planilla?.fichaAcler)?planilla?.fichaAcler:""


        planillaI.nacimientos= new ArrayList<NacimientoImpresion>()
        planilla.nacimientos.each {
        def nac= new NacimientoImpresion()
            nac.condicion=it?.condicion_al_nacer
            nac.peso=it?.peso_bebe
            nac.sexoBebe=it?.sexo
            nac.tipoParto=it?.tipo_parto_id?.descripcion
            planillaI.nacimientos+=nac
        }

        planillaI.items= new ArrayList<LineaPlanillaImpresion>()
        //aca irian los detalles de los pases
        planilla.internaciones.sort {it.fecha}.each {



            def detalle=new LineaPlanillaImpresion()
            detalle.diasInt=(it?.diasInternacion)?it?.diasInternacion?.toString():'-'
            detalle.fecha=it?.fecha?.format("dd-MM-yyyy")
            detalle.hora=it?.fecha?.format("HH:mm")
            detalle.sector=(it?.sector)?it?.sector?.toString():""
            detalle.tipoPension=(it?.tipoPension)?it?.tipoPension:""
            planillaI.items+=detalle

        }

       planillaI
    }


}
