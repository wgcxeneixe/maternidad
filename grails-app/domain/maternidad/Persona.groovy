package maternidad

import sami.Cuit

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

    String sexo
    String telefono

    static constraints = {

        cuit(nullable: true, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((!fisica) && !Cuit.validar(val.toString())) return ['Cuit Inválido']
        })
        apellido(nullable: true,size:1..30, blank:true, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((fisica)&& ((!val)||(!val?.trim()))) return['blank']
        })
        nombre(nullable: true,size:1..30, blank:true, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((fisica)&& ((!val)||(!val?.trim()))) return['blank']
        })
        razonSocial(nullable: true,size:1..150, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((!fisica)&& ((!val)||(!val?.trim()))) return['blank']
        })

        tipoDocumento(nullable: true,validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((fisica)&& ((!val)||(!val?.toString()?.trim()))) return['blank']
        })
        nroDocumento(unique: true, nullable: true,size:1..13, validator: { val, obj ->
            def fisica = obj.properties["personaFisica"]
            if((fisica)&& ((!val)||(!val?.toString()?.trim()))) return['blank']
        })


        nacionalidad(nullable: true,blank:true)
        calle(nullable: true,blank:true)
        piso(nullable: true,blank:true)
        departamento(nullable: true,blank:true)
        codigoPostal(nullable: true,blank:true)
        localidad(nullable: true,blank:true)
        estadoCivil(nullable: true,blank:true)
        numero(nullable: true,blank:true)
        sexo(nullable: true,blank:true,inList: ["Masculino", "Femenino"])
        telefono(nullable: true,blank:true)
    }

    /*
    def beforeInsert = {

        if (this.razonSocial){
            this.apellido = this.nombre = ''
            this.personaFisica = false
        }
    }*/

    String toString() { "${razonSocial?:apellido+', '+nombre}" }
}
