package maternidad

class MovimientoPlan {

    Double monto
    Date fecha
    String observacion
    Boolean credito
    Plan plan
    ConceptoPlan conceptoPlan

    static constraints = {
        monto(nullable: true,blank:true,min:0)
        fecha(attributes:[precision:"day"])
        observacion(size:0..5000, nullable:true, blank:true)
        plan(nullable: false,blank:false)
        conceptoPlan(nullable: false,blank:false)
    }
}
