package maternidad

class PlanConvenio {

    Plan plan
    Convenio convenio

    static hasMany = [valoresGalenoGasto:ValorGalenoGasto,valoresGalenoHonorario:ValorGalenoHonorario]

    static constraints = {

    plan (nullable: false , blank:false)
    convenio (nullable: false , blank:false)
    }
}
