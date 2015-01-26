package maternidad

class CajaDiaria {
    Date fechaApertura
    Date fechaCierre
    Double saldoInicial = 0
    Double saldoFinal
    String observaciones
    Usuario usuarioApertura
    Usuario usuarioCierre

    static constraints = {
        fechaApertura(nullable: true,blank:true)
        fechaCierre(format:'dd-MM-yyyy',nullable: true,blank:true,attributes:[precision:"minute"],validator: { val, obj ->val?.after(obj.fechaApertura)})
        saldoInicial(nullable: false,blank: false,editable: false,scale: 2, matches: "[0-9]")
        saldoFinal(nullable: true,blank: true,editable: false,scale: 2, matches: "[0-9]")
        observaciones(size:0..5000,nullable: true,blank:true)
        usuarioApertura(nullable: true,blank: true, editable: false)
        usuarioCierre(nullable: true,blank: true,editable: false)
    }

    static hasMany = [
        detallesCaja: DetalleCaja
    ]


    Double saldoParcial(){

        def cajaInstance = this

        def ingreso = DetalleCaja.executeQuery("select sum(monto) from DetalleCaja dc " +
                "where dc.credito=true and  dc.caja = :caja",
                [caja: cajaInstance])

        def egreso = DetalleCaja.executeQuery("select sum(monto) from DetalleCaja dc " +
                "where dc.credito=false and  dc.caja = :caja",
                [caja: cajaInstance])

        def ing  = (ingreso[0])? ingreso[0]:0

        def egr  = (egreso[0])? egreso[0]:0

        def total = ing- egr


        return Math.round(total * 100) / 100


    }





    String toString() { "Nº ${id}" }
}
