package maternidad

class PlanConvenio {

    Plan plan
    Convenio convenio
    Boolean activo=true

    static hasMany = [valoresGalenoGasto:ValorGalenoGasto,valoresGalenoHonorario:ValorGalenoHonorario,valoresPracticas:ValorPractica]

    static belongsTo = [plan:Plan,convenio:Convenio]

    static mapping = {
        convenio cascade:'none'
                valoresPracticas cascade:'none'
        valoresGalenoGasto cascade:'none'
        valoresGalenoHonorario cascade:'none'
    }

    static constraints = {

    plan (nullable: false , blank:false)
    convenio (nullable: true , blank:false)
    }
}
