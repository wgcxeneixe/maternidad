package maternidad

class ConceptoPorProfesional {

    String observacion
    ConceptoProfesional conceptoProfesional
    Profesional profesional
    Double montoFijo
    Double porcentaje
    Boolean porUnicaVez=true
    Usuario usuario
    Date fecha
    Boolean activo=true

    static constraints = {

        observacion(size:0..5000, nullable:true, blank:true)
        montoFijo(nullable: true,blank:true)
        porcentaje(nullable: true,blank:true)
        usuario(nullable: true,blank:true)

    }
}
