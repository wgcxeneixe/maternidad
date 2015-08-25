package maternidad

class Cheque {

    Double monto
    Date fechaEmision
    Date fechaVencimientoCobro
    Date fechaRealCobro
    String descripcion
    Boolean activo = true
    Integer numero
    Banco banco
    Boolean rechazado
    String motivoRechazo


    static constraints = {

        monto(nullable: true,blank:true)
        fechaEmision(attributes:[precision:"day"])
        fechaVencimientoCobro(attributes:[precision:"day"])
        fechaRealCobro(attributes:[precision:"day"],nullable: true)
        descripcion(size:0..5000, nullable:true, blank:true)
        numero(nullable:false,blank:false)
        motivoRechazo(size:0..5000, nullable:true, blank:true)
        rechazado(nullable: true,blank:true)
    }

    String toString() { "${numero+ " - " +banco?.nombre}"  }

}
