package contabilidad

class Ejercicio {

    Integer numero
    Date fechaCierre

    static constraints = {
        numero(nullable: false, blank:false)
    }

    String toString(){"${numero} cirre: ${fechaCierre?.format('dd/MM/yyyy')}"}
}
