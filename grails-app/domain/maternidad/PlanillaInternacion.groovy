package maternidad

class PlanillaInternacion {

    Persona paciente
    Plan plan
    Date fechaInternacion
    String nombreFamiliarResponsable
    String telefonoFamiliarResponsable
    Long dniFamiliarResponsable
    String domicilioFamiliarResponsable
    String ocupacion

    Date fechaAlta
    String observaciones
    Integer numeroIngreso
    String diagnostico
    String tratamiento
    String numeroAfiliado
    Set movimientos
    EstadoPlanilla estadoPlanilla
    Factura factura
    Date fechaNacimiento
    Profesional medicoCabecera
    Profesional medicoCirujano
    Profesional medicoAyudante1
    Profesional medicoAyudante2
    Profesional medicoAnestesista
    Profesional medicoOtro1
    Profesional medicoOtro2
    String tipoSocio
    String fichaAcler
    Boolean activo=true



    static constraints = {
        paciente(nullable: true,blank:true)
        plan(nullable: false,blank:false)
        fechaInternacion(nullable: false,blank:false, attributes:[precision:"minute"])
        nombreFamiliarResponsable(nullable: false,blank:false)
        telefonoFamiliarResponsable(phoneNumber:true,blank:true,nullable: true,)
        dniFamiliarResponsable(nullable: false,blank:false)
        //fechaAlta(nullable: true,blank:true,validator: { val, obj ->val?.after(obj.fechaInternacion) || val?.equals(obj.fechaInternacion)},attributes:[precision:"day"])
        fechaAlta(nullable: true,blank:true,attributes:[precision:"minute"])
        observaciones(nullable: true,blank:true, size: 0..5000)
        diagnostico(nullable: true,blank:true, size: 0..5000)
        tratamiento(nullable: true,blank:true, size: 0..5000)
        numeroAfiliado(nullable: true,blank:true)
        factura(nullable: true,blank:true)
        fechaNacimiento(nullable: true,blank:true, attributes:[precision:"day"])
        medicoCabecera(nullable: true,blank:true)
        medicoCirujano(nullable: true,blank:true)
        medicoAnestesista(nullable: true,blank:true)
        medicoAyudante1(nullable: true,blank:true)
        medicoAyudante2(nullable: true,blank:true)
        medicoOtro1(nullable: true,blank:true)
        medicoOtro2(nullable: true,blank:true)
        domicilioFamiliarResponsable(nullable: true,blank:true)
        ocupacion(nullable: true,blank:true)
        tipoSocio(nullable: true,blank:true,inList: ["Titular", "Adherente"])
        fichaAcler(nullable: true,blank:true)
numeroIngreso(nullable: false,blank:false,unique: true)
    }

    static hasMany = [
            nacimientos: Nacimiento,
            detalles:DetalleFactura,
            detallesCaja:DetalleCaja,
            movimientos:MovimientoPlanilla,
            profesionales:Profesional,
            internaciones:Internacion
    ]

    String toString() { "Nº ${numeroIngreso}"+ " - "+ paciente }


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
        if(!(numeroIngreso)){

            def ultimoNro = obtenerUltimoNumero()?.numeroIngreso as Integer
            numeroIngreso = new Integer(ultimoNro?: 4000000)
            if(!numeroIngreso){
                numeroIngreso = 4000000
            }
            numeroIngreso = numeroIngreso + 1
        }else{
          if(!id){
            if(PlanillaInternacion.findByNumeroIngreso(numeroIngreso)){

            throw new Exception("El numero de Ingreso debe ser único")
            }
          }
        }


    }

    Integer edad(){

        if (fechaNacimiento){

            Date offset= new Date()

            def birthdayThisYear = offset.clearTime()
            birthdayThisYear[Calendar.MONTH]= fechaNacimiento[Calendar.MONTH]
            birthdayThisYear[Calendar.DATE] = fechaNacimiento[Calendar.DATE]

            return offset[Calendar.YEAR] - fechaNacimiento[Calendar.YEAR] - (birthdayThisYear > offset ? 1 : 0)
        }
        else {
        return 0
        }



    }


}
