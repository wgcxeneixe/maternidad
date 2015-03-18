package maternidad

class MovimientoPlanilla {

    PlanillaInternacion planillaInternacion
    Date fecha
    Usuario usuario
    EstadoPlanilla estadoPlanilla


    static belongsTo = [
            planillaInternacion: PlanillaInternacion]


    static constraints = {
    }
}
