package maternidad

class ConceptoPlan {

    String nombre
    String codigo
    String descripcion
    Boolean activo=true

    static constraints = {
        codigo(size:2..10, nullable:false, blank:false)
        nombre(size:2..35, nullable:false, blank:false)
        descripcion(size:0..5000, nullable:true, blank:true)
        activo(nullable:true, blank:true)
    }

    String toString() { "${nombre}" }
}
