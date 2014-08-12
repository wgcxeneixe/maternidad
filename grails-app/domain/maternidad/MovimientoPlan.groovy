package maternidad

class MovimientoPlan {

    Double monto
    Date fecha
    String observacion
    Boolean credito
    Plan plan
    ConceptoPlan conceptoPlan

    static constraints = {
        observacion(size:0..5000, nullable:true, blank:true)
        plan(nullable: false,blank:false)
        monto(nullable: true,blank:true)
        conceptoPlan(nullable: false,blank:false)
    }
}
