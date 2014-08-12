package maternidad

class ValorPractica {

    Double valorEspecialista
    Double valorAyudante
    Double valorAnestecista
    Double valorGasto
    Double valorHonorario
    Practica practica
    Plan plan
    PlanConvenio planConvenio
    Date fechaActualizado

    static constraints = {

        valorGasto(nullable: true,blank:true)
        valorHonorario(nullable: true,blank:true)
        valorAnestecista(nullable: true,blank:true)
        valorAyudante(nullable: true,blank:true)
        valorEspecialista(nullable: true,blank:true)
        practica(nullable: false,blank:false)
        plan(nullable: false,blank:false)
        planConvenio(nullable: false,blank:false)
        fechaActualizado(nullable: false,blank:false)
    }
}
