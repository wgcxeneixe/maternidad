package contabilidad

class Cuenta {

    String descripcion
    Boolean activo = true
    Rubro rubro
    String codigo

    static belongsTo = [
            subtitulo: SubTitulo
    ]

    static constraints = {
        descripcion(nullable: false, blank:false)
        activo(nullable: false)
        rubro(nullable: false)
        codigo(nullable: false, blank:false)
    }
}
