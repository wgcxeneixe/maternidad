package maternidad

class ConceptoProfesional {

    String codigo
    String nombre
    String descripcion
    Boolean activo
    Usuario usuario
    ConceptoLiquidacion conceptoLiquidacion

    static constraints = {

        nombre(size:2..35, nullable:false, blank:false)
        codigo(size:2..10, nullable:false, blank:false)
        descripcion(size:0..5000, nullable:true, blank:true)
        activo(nullable:true, blank:true)
        conceptoLiquidacion( nullable:false, blank:false)
    }
}
