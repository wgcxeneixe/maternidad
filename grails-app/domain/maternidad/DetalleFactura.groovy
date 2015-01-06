package maternidad

class DetalleFactura {

    Profesional profesional
    Practica practica
    Plan plan
    Factura factura
    Double valorGastos
    Double valorHonorarios
    Double valorPractica //no se usa
    Double carreraMedica
    Double cantidad
    String observacion
    PlanillaInternacion planillaInternacion
    Integer funcion
    Boolean modulo
    Boolean valorFijo=false
   



    static belongsTo = [
            planillaInternacion: PlanillaInternacion,
            factura                : Factura,
            profesional : Profesional,
            practica : Practica,
            plan : Plan
    ]

    static constraints = {

        profesional(nullable: false,blank:false)
        plan(nullable: false,blank:false)
        planillaInternacion(nullable: false,blank:false)
    }
}
