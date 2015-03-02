package contabilidad

class SubTitulo {

    String descripcion
    Titulo titulo
    String codigo

    static belongsTo = [
            titulo: Titulo
    ]

    static constraints = {
        titulo(nullable: false)
        descripcion(nullable: false, blank:false)
        codigo(nullable: false, blank:false)
    }

    String toString(){"${codigo} ${descripcion}"}
}
