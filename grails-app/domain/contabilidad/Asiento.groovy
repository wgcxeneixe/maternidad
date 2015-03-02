package contabilidad

class Asiento {

    Integer numero
    Date fecha
    Ejercicio ejercicio
    Float totalDebe
    Float totalHaber
    List<Movimiento> movimientos

    static belongsTo = [
            ejercicio: Ejercicio
    ]

    static hasMany = [
            movimientos: Movimiento
    ]

    static constraints = {
        numero(nullable: false, blank:false)
    }
}
