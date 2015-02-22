package contabilidad

class Asiento {

    Integer numero
    Date fecha
    Ejercicio ejercicio

    static belongsTo = [
            ejercicio: Ejercicio
    ]

    static constraints = {
        numero(nullable: false, blank:false)
    }
}
