package contabilidad

class Rubro {

    Boolean activo = true
    String descripcion
    SubTitulo subtitulo
    String codigo

    static belongsTo = [
            subtitulo: SubTitulo
    ]

    static constraints = {
        activo(nullable: false, blank:false)
        subtitulo(nullable: false)
        descripcion(nullable: false, blank:false)
        codigo(nullable: false, blank:false)
    }

    String toString(){"${codigo} ${descripcion}"}

}
