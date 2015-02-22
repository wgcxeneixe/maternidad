package contabilidad

class Movimiento {

    Float monto = 0
    Asiento asiento
    Boolean columnaDebe = true
    Cuenta cuenta
    Date fecha
    String descripcion

    static belongsTo = [
            asiento: Asiento,
            cuenta: Cuenta
    ]

    static constraints = {
        monto(nullable: false, blank:false)
        asiento(nullable: false)
        columnaDebe(nullable: false)
        cuenta(nullable: false)
        fecha(nullable: false, blank:false)
        descripcion(nullable: true, blank:true)
    }
}
