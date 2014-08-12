package maternidad

class CondicionImpositiva {

    String nombre
    String codigo

    static constraints = {

        nombre(size:2..35, nullable:false, blank:false)
        codigo(size:2..10, nullable:true, blank:true)

    }
}
