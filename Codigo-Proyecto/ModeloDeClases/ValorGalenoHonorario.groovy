package maternidad

class ValorGalenoHonorario {
    Double valor
    TipoHonorario tipoHonorario
    PlanConvenio planConvenio

    static constraints = {

        valor(nullable: true,blank:true)
        tipoHonorario(nullable: true,blank:true)
        planConvenio(nullable: false,blank:false)
    }
}
