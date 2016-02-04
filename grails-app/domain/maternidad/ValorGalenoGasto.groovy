package maternidad

class ValorGalenoGasto {

    Double valor
    TipoGasto tipoGasto
    PlanConvenio planConvenio


    static belongsTo = [planConvenio:PlanConvenio]

    static mapping = {
        planConvenio cascade:'none'
    }


    static constraints = {

    valor(nullable: true,blank:true)
    tipoGasto(nullable: true,blank:true)
    planConvenio(nullable: false,blank:false)
    }
}
