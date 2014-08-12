package maternidad

class ConceptoProfesional {

    String codigo
    String nombre
    String Descripcion
    Boolean activo=true
    Usuario usuario

    static constraints = {
        codigo(size:2..10, nullable:false, blank:false)
        nombre(size:2..35, nullable:false, blank:false)
        descripcion(size:0..5000, nullable:true, blank:true)
        activo(nullable:true, blank:true)
        usuario(nullable:false, blank:false)
    }

    String toString() { "${nombre}" }
}
