package maternidad

class Sector {

    String codigo
    String nombre

    static constraints = {
        codigo(nullable: false, blank: false, unique: true)
        nombre(nullable: false, blank: false)
    }

    String toString(){
        return "${nombre}"
    }
}
