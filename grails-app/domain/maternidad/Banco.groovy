package maternidad

class Banco {

    String nombre
    Boolean activo=true

    static constraints = {

        nombre(nullable: false , blank:false)
        activo(nullable: true , blank:true)

    }

    String toString() { "${nombre}"  }
}
