package maternidad

class DetalleFactura {

    Profesional profesional
    Practica practica
    Plan plan
    // Factura factura
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
    Medicamento medicamento
    Date fecha
    Double valorMedicamento


    static belongsTo = [
            planillaInternacion: PlanillaInternacion,
           // factura                : Factura,
            profesional : Profesional,
            practica : Practica,
            plan : Plan
    ]

    static constraints = {
        practica(nullable: true,blank:true)
        profesional(nullable: true,blank:true)
        plan(nullable: false,blank:false)
        planillaInternacion(nullable: false,blank:false)
        medicamento(nullable: true,blank:true)
    }

    def  Double total() {
        Double tot = valorGastos?:0 + valorHonorarios?:0
        return tot * cantidad
    }

    String toString() { "Plan: "+planillaInternacion?.plan?.codigo + ", Práctica: " + practica?.codigo + ", Función: " + funcion?.toString() + ". Total: " + total().toString()}
}
