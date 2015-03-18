package maternidad

class EnteReceptor {

    String codigo
    String nombre
    Boolean llevaFactura=false
    Boolean pidePreAprobacion=false
    Boolean detallePracticasValorizado=true
    Set<ObraSocial> obrasSociales

    static hasMany = [obrasSociales:ObraSocial]

    static constraints = {
        nombre(size:2..35, nullable:false, blank:false)
        codigo(size:2..10, nullable:false, blank:false)
    }

    String toString() { "${nombre}" }
}
