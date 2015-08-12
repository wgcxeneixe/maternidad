package maternidad

class MovimientoBanco {


    Double monto
    Date fecha
    String observacion
    Boolean credito
    Banco banco
    String numeroTransferencia
    String cuentaTransferencia

    Date fechaEmision
    Date fechaVencimientoCobro
    Integer numeroCheque
    Banco bancoCheque
    FacturaProveedor facturaProveedor
    TipoPago tipoPago
    ConceptoBanco conceptoBanco

    static constraints = {
        monto(nullable: true,blank:true)
        fecha(attributes:[precision:"minute"],nullable: false)
        observacion(size:0..5000, nullable:true, blank:true)
        numeroCheque(nullable: true,blank:true)
        fechaEmision(attributes:[precision:"day"],nullable: true)
        fechaVencimientoCobro(attributes:[precision:"day"],nullable: true)
        numeroTransferencia(nullable: true,blank:true)
        cuentaTransferencia(nullable: true,blank:true)
        facturaProveedor(nullable:true,blank:true )
        tipoPago(nullable: false,blank:false)
        conceptoBanco(nullable: false,blank:false)
        bancoCheque(nullable:true,blank:true )
    }
}
