package maternidad

class Profesional {


    Persona persona
    Boolean activo
    String matriculaProvincial
    Date fechaMatriculacion
    String cbu
    Banco banco

    static constraints = {

    persona(nullable: false , blank:false)
    activo(nullable: true , blank:true)
    matriculaProvincial(nullable: true , blank:true)
    fechaMatriculacion(nullable: true , blank:true)
    cbu(nullable: true , blank:true)
    banco(nullable: true , blank:true)

    }
}




