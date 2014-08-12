package maternidad

class Convenio {

    ObraSocial obrasocial
    Date fechaInicio
    Date fechaFin
    Boolean activo=true
    String observacion


    static constraints = {
        obrasocial(nullable: false,blank:false)
        fechaInicio(nullable: false,blank:false,attributes:[precision:"day"])
        fechaFin(validator: { val, obj ->val?.after(obj.fechaInicio)},attributes:[precision:"day"],nullable: false,blank:false)
        activo(nullable: true,blank:true)
        observacion(nullable: true,blank:true)
    }

    String toString() { "${obrasocial.codigo+': '+fechaFin}" }
}
