package maternidad

class Convenio {

    String codigo
    ObraSocial obrasocial
    Date fechaInicio
    Date fechaFin
    Boolean activo=true
    String observacion


    static hasMany = [planConvenio:PlanConvenio]

    static mapping = {
        planConvenio cascade:'none'
    }

    static constraints = {
        codigo(size:2..40, nullable:true, blank:true)
        obrasocial(nullable: false,blank:false)
        fechaInicio(nullable: false,blank:false,attributes:[precision:"day"])
        fechaFin(validator: { val, obj ->val?.after(obj.fechaInicio)},attributes:[precision:"day"],nullable: false,blank:false)
        activo(nullable: true,blank:true)
        observacion(nullable: true,blank:true)

    }

    String toString() { "${codigo}" }
}
