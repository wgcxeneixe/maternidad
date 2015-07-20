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

    List<NacimientoImpresion> nacimientos
    List<LineaPlanillaImpresion> items


    static generar(PlanillaInternacion planilla){
        def planillaI = new PlanillaInternacionImpresion()

        planillaI.domicilio=(planilla?.paciente?.calle)?:""  +" - "+ ((planilla?.paciente?.numero)?:"")
        planillaI.estadoCivil=(planilla?.paciente?.estadoCivil?.denominacion)?:""
        planillaI.familiar=planilla?.nombreFamiliarResponsable
        planillaI.historiaClinica=planilla?.numeroIngreso
        planillaI.nombreYApellido=planilla.paciente?.toString()
        planillaI.nroAfiliado=(planilla?.numeroAfiliado)?:""
        planillaI.nroDocumento=planilla?.paciente?.nroDocumento
        planillaI.obraSocial=planilla?.plan?.obrasocial?.codigo+' - '+planilla?.plan?.obrasocial?.nombre+' - '+planilla?.tipoSocio
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

        planillaI.medicos=medicos


        planillaI.domicilioResponsable=(planilla?.domicilioFamiliarResponsable)?planilla.domicilioFamiliarResponsable:""
        planillaI.fechaNacimiento=(planilla.fechaNacimiento)?planilla.fechaNacimiento.format("dd-MM-yyyy"):""
        planillaI.ocupacion=(planilla?.ocupacion)?planilla?.ocupacion:""
        planillaI.sexo=planilla.paciente.sexo
        planillaI.telefono=(planilla.paciente.telefono)?planilla.paciente.telefono:""

        planillaI.fechaAlta=(planilla.fechaAlta)?planilla.fechaAlta.format("dd-MM-yyyy"):""
        planillaI.horaAlta=(planilla.fechaAlta)?planilla.fechaAlta.format("H:m"):""
        planillaI.diagnostico=(planilla?.diagnostico)?planilla?.diagnostico:""

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
        planilla.internaciones.each {



            def detalle=new LineaPlanillaImpresion()
            detalle.diasInt=it?.diasInternacion?.toString()
            detalle.fecha=it?.fecha?.format("dd-MM-yyyy")
            detalle.hora=it?.fecha?.format("H:m")
            detalle.sector=(it?.sector)?it?.sector?.toString():""
            detalle.tipoPension=(it?.tipoPension)?it?.tipoPension:""
            planillaI.items+=detalle

        }

       planillaI
    }


}
