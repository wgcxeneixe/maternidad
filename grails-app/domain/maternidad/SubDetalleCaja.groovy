package maternidad

class SubDetalleCaja {

    ConceptoCaja conceptocaja
    Boolean credito
    Double monto = 0
    String observaciones
    Usuario usuario
    DetalleCaja detalleCaja

    static constraints = {
        conceptocaja(nullable: true,blank:true)
        credito(nullable: false,blank: false)
        monto(nullable: false,blank: false,scale: 2, matches: "[0-9]")
        observaciones(size:0..5000,nullable: true,blank:true)
        usuario(nullable: true,blank: true)
    }
}
