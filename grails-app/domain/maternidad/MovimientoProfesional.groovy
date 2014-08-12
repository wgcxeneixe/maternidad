package maternidad

class MovimientoProfesional {

    Double monto
    Date fecha
    String observacion
    Boolean credito
    Profesional profesional
    ConceptoProfesional conceptoProfesional
    Usuario usuario


    static constraints = {

    monto(nullable: false,blank:false)
    observacion(size:0..5000, nullable:true, blank:true)
    fecha(nullable: false,blank:false)
    credito(nullable: false,blank:false)
    profesional(nullable: true,blank:true)
    conceptoProfesional(nullable: true,blank:true)
    usuario(nullable: false,blank:false)
    }
}


