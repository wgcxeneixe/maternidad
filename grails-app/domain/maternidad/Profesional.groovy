package maternidad

class Profesional {


    Persona persona
    Boolean activo=true
    String matriculaProvincial
    Date fechaMatriculacion
    String cbu
    Banco banco
    //SortedSet<ConceptoPorProfesional> listaConceptos
    Integer codigoCirculo

    static belongsTo = [
            persona : Persona,
            banco : Banco
    ]

    static hasMany = [
            listaConceptos        : ConceptoPorProfesional,
            movimientosProfesional: MovimientoProfesional
    ]


    static mapping = {
       persona cascade: 'all'
    }

    static constraints = {

    persona(nullable: true , blank:true)
    activo(nullable: true , blank:true)
    matriculaProvincial(nullable: true , blank:true)
    fechaMatriculacion(nullable: true , blank:true)
    cbu(nullable: true , blank:true)
    banco(nullable: true , blank:true)
    codigoCirculo(nullable: true,blank:true)
    }

    def Boolean esMaternidad(){
        codigoCirculo == 46408
    }

    String toString() { if(persona){"${(codigoCirculo? codigoCirculo?.toString():'0')+' - '+(persona.razonSocial?:(persona.apellido+', '+persona.nombre))}"} else {""} }

}




