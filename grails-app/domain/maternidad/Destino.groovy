package maternidad

class Destino {

    String nombre
    String codigo
    String descripcion


    static hasMany = [movimientosStock:MovimientoStock]

    static constraints = {
        nombre(size:2..120, nullable:false, blank:false)
        codigo(size:2..10, nullable:true, blank:true)
        descripcion(size:0..5000, nullable:true, blank:true)

    }

    String toString() { "${nombre}" }
}
