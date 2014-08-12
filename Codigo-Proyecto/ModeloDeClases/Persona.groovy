package sami

import maternidad.EstadoCivil
import maternidad.Localidad
import maternidad.Pais
import maternidad.TipoDocumento

class Persona {

    Boolean personaFisica = true
    Long cuit
    String apellido
    String nombre
    String razonSocial
    TipoDocumento tipoDocumento
    Long nroDocumento

    Pais nacionalidad

    String calle
    String numero
    String piso
    String departamento
    String codigoPostal
    Localidad localidad

    EstadoCivil estadoCivil


    static constraints = {
        //    	cuit(size:10..11, nullable:true)
        cuit(validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((!fisica) && !Cuit.validar(val.toString())) return ['Cuit Inválido']
        })
        apellido(size:1..30, blank:false, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((fisica)&& ((!val)||(!val?.trim()))) return['blank']
        })
        nombre(size:1..30, blank:false, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((fisica)&& ((!val)||(!val?.trim()))) return['blank']
        })
        razonSocial(size:1..150, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((!fisica)&& ((!val)||(!val?.trim()))) return['blank']
        })

        tipoDocumento(validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((fisica)&& ((!val)||(!val?.toString()?.trim()))) return['blank']
        })
        nroDocumento(size:1..13, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((fisica)&& ((!val)||(!val?.toString()?.trim()))) return['blank']
        })


    }

    def beforeInsert = {

        if (this.razonSocial){
            this.apellido = this.nombre = ''
            this.personaFisica = false
        }
    }

    String toString() { "${razonSocial?:apellido+', '+nombre}" }
}
