package maternidad

class DetalleFactura {

    Profesional profesional
    Practica practica
    Plan plan
    Factura factura
    Double valorGastos = 0
    Double valorHonorarios = 0
    Double valorPractica //no se usa
    Double carreraMedica
    Double cantidad = 0
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

    def  Double total() {
        Double tot = valorGastos?:0 + valorHonorarios?:0
        return tot * cantidad
    }

    String toString() { "Plan: "+factura.plan.codigo + ", Práctica: " + practica.codigo + ", Función: " + funcion.toString() + ". Total: " + total().toString()}
}
