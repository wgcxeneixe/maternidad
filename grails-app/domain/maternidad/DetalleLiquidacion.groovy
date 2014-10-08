package maternidad

class DetalleLiquidacion {

    ConceptoProfesional concepto
    Double monto
    Liquidacion liquidacion
    DetalleFactura detalleFactura
    ConceptoPorProfesional conceptoPorProfesional
    Double porcentajePagoFacturaLiquidado
    PagoFactura pagoFactura

    static belongsTo = [
            liquidacion: Liquidacion
    ]

    static constraints = {
    }
}
