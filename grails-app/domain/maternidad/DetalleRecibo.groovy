package maternidad

class DetalleRecibo {

    ConceptoProfesional conceptoProfesional
    Double valor
    Boolean debitoCredito

    static constraints = {
        conceptoProfesional(nullable: true,blank:true)
        valor(nullable: true,blank:true)
        debitoCredito(nullable: true,blank:true)
    }
}
