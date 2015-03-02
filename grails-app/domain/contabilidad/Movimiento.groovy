package contabilidad

class Movimiento {

    Asiento asiento
    Float debe = 0
    Float haber = 0
    Cuenta cuenta
    Date fecha
    String descripcion

    static belongsTo = [
            asiento: Asiento,
            cuenta: Cuenta
    ]

    static constraints = {
        debe(nullable: false, blank:false)
        haber(nullable: false, blank:false)
        asiento(nullable: false)
        cuenta(nullable: false)
        fecha(nullable: false, blank:false)
        descripcion(nullable: true, blank:true)
    }
}
