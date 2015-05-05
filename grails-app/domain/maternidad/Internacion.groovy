package maternidad

class Internacion {

    Date fecha
    Sector sector
    String tipoPension
    Integer diasInternacion

    static constraints = {
        fecha(nullable: false,blank:false, attributes:[precision:"minute"])
        sector(nullable: true,blank:true)
        tipoPension(nullable: true,blank:true)
        diasInternacion(nullable: true,blank:true)
    }
}
