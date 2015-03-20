package maternidad

class PlanillaInternacion {

    Persona paciente
    Plan plan
    Date fechaInternacion
    String nombreFamiliarResponsable
    String telefonoFamiliarResponsable
    Date fechaAlta
    String observaciones
    Integer numeroIngreso
    String diagnostico
    String tratamiento
    Long numeroAfiliado
    Set movimientos
    EstadoPlanilla estadoPlanilla
    Factura factura

    static constraints = {
        paciente(nullable: true,blank:true)
        plan(nullable: false,blank:false)
        fechaInternacion(nullable: false,blank:false, attributes:[precision:"minute"])
        nombreFamiliarResponsable(nullable: false,blank:false)
        telefonoFamiliarResponsable(phoneNumber:true)
        //fechaAlta(nullable: true,blank:true,validator: { val, obj ->val?.after(obj.fechaInternacion) || val?.equals(obj.fechaInternacion)},attributes:[precision:"day"])
        fechaAlta(nullable: true,blank:true,attributes:[precision:"minute"])
        observaciones(nullable: true,blank:true, size: 0..5000)
        diagnostico(nullable: true,blank:true, size: 0..5000)
        tratamiento(nullable: true,blank:true, size: 0..5000)
        numeroAfiliado(nullable: true,blank:true)
        factura(nullable: true,blank:true)

    }

    static hasMany = [
            nacimientos: Nacimiento,
            detalles:DetalleFactura,
            detallesCaja:DetalleCaja,
            movimientos:MovimientoPlanilla
    ]

    String toString() { "Nº ${id}"+ " - "+ paciente }


    static obtenerUltimoNumero(){
        def numero = null
        def lista = PlanillaInternacion.withCriteria{

            order('numeroIngreso', 'desc')
            maxResults(1)
        }
        if(lista){
            numero = lista.get(0)
        }
        numero
    }

    def beforeValidate(){
        if(!numeroIngreso){

            def ultimoNro = obtenerUltimoNumero()?.numeroIngreso as Integer
            numeroIngreso = new Integer(ultimoNro?: 4000000)
            if(!numeroIngreso){
                numeroIngreso = 4000000
            }
            numeroIngreso = numeroIngreso + 1
        }


    }


}
