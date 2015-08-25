package maternidad

class Laboratorio {

    String codigo
    String nombre
    String domicilio
    String telefono

    static constraints = {
        nombre(size:2..120, nullable:true, blank:true)
        codigo(size:2..10, nullable:true, blank:true)
        domicilio( nullable:true, blank:true)
        telefono( nullable:true, blank:true)

    }

    String toString() { "${nombre}" }

}
