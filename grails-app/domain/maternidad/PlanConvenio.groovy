package maternidad

class PlanConvenio {

    Plan plan
    Convenio convenio

    static constraints = {

    plan (nullable: false , blank:false)
    convenio (nullable: false , blank:false)
    }
}
