package contabilidad

class Titulo {

    String descripcion
    String codigo

    static constraints = {
        descripcion(nullable: false, blank:false)
        codigo(nullable: false, blank:false)
    }

    String toString(){"${codigo} ${descripcion}"}
}
