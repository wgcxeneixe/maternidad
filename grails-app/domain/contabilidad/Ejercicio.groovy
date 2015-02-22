package contabilidad

class Ejercicio {

    Integer numero
    Date fechaCierre

    static constraints = {
        numero(nullable: false, blank:false)
    }
}
