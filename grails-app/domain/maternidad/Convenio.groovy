package maternidad

class Convenio {

    Date fechaInicio
    Date fechaFin
    String observacion
    Boolean activo
    ObraSocial obrasocial

    static constraints = {

    fechaInicio(nullable: false,blank:false)
    fechaFin(nullable: false,blank:false)
    obrasocial(nullable: false,blank:false)
    activo(nullable: true,blank:true)
    observacion(nullable: true,blank:true)
    }
}
