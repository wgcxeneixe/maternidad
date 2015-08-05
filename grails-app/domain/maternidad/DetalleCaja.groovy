package maternidad

class DetalleCaja {

    Date fecha
    PlanillaInternacion planillainternacion
    ConceptoCaja conceptocaja
    Boolean credito
    Double monto = 0
    String observaciones
    Usuario usuario
    CajaDiaria caja

    static constraints = {
        fecha(nullable: true, blank: true, attributes: [precision: "minute"])
        planillainternacion(nullable: true, blank: true)
        conceptocaja(nullable: true, blank: true)
        credito(nullable: false, blank: false)
        monto(nullable: false, blank: false, scale: 2, matches: "[0-9]")
        observaciones(size: 0..5000, nullable: true, blank: true)
        usuario(nullable: true, blank: true)
        caja(nullable: true, blank: true)
    }

    static belongsTo = [
            planillainternacion: PlanillaInternacion,
            //cajadiaria: CajaDiaria
    ]

    static hasMany = [
            subDetallesCaja: SubDetalleCaja
    ]

    def calcularTotal() {
        Double total = 0
        if (subDetallesCaja) {
            subDetallesCaja.each { SubDetalleCaja sub ->
                if (sub.credito) {
                    total += sub.monto
                } else {
                    total -= sub.monto
                }
            }
        }
        monto = total
    }
}
