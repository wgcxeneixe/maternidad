package maternidad

class Banco {

    String nombre
    Boolean activo

    static constraints = {

        nombre(nullable: false , blank:false)
        activo(nullable: true , blank:true)

    }
}
