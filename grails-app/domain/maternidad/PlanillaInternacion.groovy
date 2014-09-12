package maternidad

class PlanillaInternacion {

    Persona paciente
    Plan plan
    Date fechaInternacion
    String nombreFamiliarResponsable
    String telefonoFamiliarResponsable
    Date fechaAlta
    String observaciones

    static constraints = {
        paciente(nullable: true,blank:true)
        plan(nullable: false,blank:false)
        fechaInternacion(nullable: false,blank:false, attributes:[precision:"day"])
        nombreFamiliarResponsable(matches: "[a-zA-Z]+",nullable: false,blank:false)
        telefonoFamiliarResponsable(phoneNumber:true)
        fechaAlta(validator: { val, obj ->val?.after(obj.fechaInternacion) || val?.equals(obj.fechaInternacion)},attributes:[precision:"day"])

    }

    String toString() { "Nº ${id}" }
}
