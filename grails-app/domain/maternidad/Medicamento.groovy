package maternidad

class Medicamento {

    String codigo
    String nombre
    Boolean activo = true
    String descripcion
    MarcaMedicamento marca
    Double valor
    TipoMedicamento tipoMedicamento
    String formaPresentacion
    Laboratorio laboratorio


    static mapping = {
        sort codigo:  "asc"
    }

    static constraints = {
        codigo(size:1..30, nullable:true, blank:true)
        nombre(size:2..35, nullable:true, blank:true)
        activo(nullable:true, blank:true)
        descripcion(size:0..5000, nullable:true, blank:true)
        marca( nullable:true, blank:true)
        valor ( nullable:true, blank:true)
        formaPresentacion ( nullable:true, blank:true)
        tipoMedicamento ( nullable:true, blank:true)
        laboratorio( nullable:true, blank:true)
    }

    String toString() { "${codigo +' - '+ nombre}" }



}
