package maternidad

class DetalleCaja {

    Date fecha
    PlanillaInternacion planillainternacion
    ConceptoCaja conceptocaja
    Boolean credito
    Double monto
    String observaciones
    Usuario usuario
    CajaDiaria caja

    static constraints = {
        fecha(nullable: true,blank:true,attributes:[precision:"minute"])
        planillainternacion(nullable: true,blank:true)
        conceptocaja(nullable: true,blank:true)
        credito(nullable: false,blank: false)
        monto(nullable: false,blank: false,scale: 2, matches: "[0-9]")
        observaciones(size:0..5000,nullable: true,blank:true)
        usuario(nullable: true,blank: true)
        caja(nullable: true,blank: true)
    }

    static belongsTo = [
            planillainternacion : PlanillaInternacion,
            //cajadiaria: CajaDiaria
    ]
}
