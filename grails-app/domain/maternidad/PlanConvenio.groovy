package maternidad

class PlanConvenio {

    Plan plan
    Convenio convenio
    Boolean activo=true

    static hasMany = [valoresGalenoGasto:ValorGalenoGasto,valoresGalenoHonorario:ValorGalenoHonorario,valoresPracticas:ValorPractica]

    static constraints = {

    plan (nullable: false , blank:false)
    convenio (nullable: false , blank:false)
    }
}
