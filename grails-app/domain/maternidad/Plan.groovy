package maternidad

class Plan {

    String nombre
    String codigo
    String observacion
    Boolean activo = true
    ObraSocial obrasocial


    static hasMany = [movimientosPlan:MovimientoPlan,planConvenios:PlanConvenio]

    static constraints = {

        nombre(size:2..35, nullable:true, blank:true)
        codigo(size:2..10, nullable:true, blank:true)
        observacion(size:0..5000, nullable:true, blank:true)
        obrasocial(nullable: false,blank:false)
        activo(nullable: true,blank:true)
    }
}
