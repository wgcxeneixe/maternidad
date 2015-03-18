package maternidad

class MarcaMedicamento {

    String nombre
    String codigo
    Boolean activo=true

    static constraints = {
        codigo(size:2..30, nullable:true, blank:true)
        nombre(size:2..120, nullable:false, blank:false)
        activo(nullable:true, blank:true)
    }

    String toString() { "${nombre}" }

}
