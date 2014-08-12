package maternidad

class Componente {

    String nombre

    static constraints = {

        nombre(nullable: false, blank: false)

    }
}
