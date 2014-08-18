package maternidad

class Liquidacion {

    Profesional profesional
    Double montoBruto
    Double montoNeto
    Date fecha
    Integer numeroRecibo
    Integer nuemroLiquidacion
    Integer periodo

    SortedSet<DetalleLiquidacion> detallesLiquidacion

    static hasMany = [
            detallesLiquidacion        : DetalleLiquidacion,
    ]

    static belongsTo = [
            profesional : Profesional
    ]

    static constraints = {
    }
}
