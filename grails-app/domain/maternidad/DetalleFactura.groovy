package maternidad

class DetalleFactura {

    Profesional profesional
    Practica practica
    Plan plan
    Factura factura
    Double valorGastos
    Double valorHonorarios
    Double valorPractica
    Double carreraMedica
    Double cantidad
    String observacion
    PlanillaInternacion planillaInternacion

    static belongsTo = [
            planillaInternacion: PlanillaInternacion,
            factura                : Factura,
            profesional : Profesional,
            practica : Practica,
            plan : Plan
    ]

    static constraints = {
    }
}
