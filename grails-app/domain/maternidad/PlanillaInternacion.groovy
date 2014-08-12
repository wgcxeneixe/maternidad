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
        paciente(nullable: false,blank:false)
        plan(nullable: false,blank:false)
        fechaInternacion(nullable: false,blank:false, attributes:[precision:"day"])
        nombreFamiliarResponsable(matches: "[a-zA-Z]+")
        telefonoFamiliarResponsable(phoneNumber:true)
        fechaAlta(validator: { val, obj ->val?.after(obj.fechaInternacion)},attributes:[precision:"day"])

    }

    String toString() { "${id}" }
}
