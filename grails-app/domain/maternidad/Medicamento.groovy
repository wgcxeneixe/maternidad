package maternidad

class Medicamento {

    String codigo
    String nombre
    Boolean activo = true
    String descripcion
    MarcaMedicamento marca
    Double valor

    static constraints = {
        codigo(size:2..30, nullable:true, blank:true)
        nombre(size:2..35, nullable:true, blank:true)
        activo(nullable:false, blank:false)
        descripcion(size:0..5000, nullable:true, blank:true)
        marca( nullable:true, blank:true)
        valor ( nullable:true, blank:true)
    }

    String toString() { "${nombre +' - '+ codigo}" }



}