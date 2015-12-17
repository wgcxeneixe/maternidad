package maternidad

class DetalleRecibo {

    ConceptoProfesional conceptoProfesional
    Double valor
    Boolean debitoCredito
    String descripcion



    static constraints = {
        conceptoProfesional(nullable: true,blank:true)
        valor(nullable: true,blank:true)
        debitoCredito(nullable: true,blank:true)
        descripcion(nullable: true,blank:true)
    }
}
