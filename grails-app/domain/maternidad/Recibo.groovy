package maternidad

class Recibo {

    Integer nro
    Date fecha
    Profesional profesional
    Double total

    static hasMany = [detalle:DetalleRecibo]

    static constraints = {
    nro(nullable: true,blank:true)
    fecha(nullable: true,blank:true)
    profesional(nullable: true,blank:true)
    total(nullable: true,blank:true)
    }
}
