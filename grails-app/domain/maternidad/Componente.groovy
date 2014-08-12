package maternidad

class Componente {

    String nombre
    Boolean activo=true

    static constraints = {
        nombre(size:2..35,nullable: false, blank: false,matches: "[a-zA-Z]+")
        activo(nullable:true, blank:true)
    }

    String toString() { "${nombre}" }
}
