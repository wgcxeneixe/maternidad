package maternidad

class PracticaModulo {


    Double valorEspecialista
    Double valorAyudante
    Double valorAnestecista
    Double valorGasto
    Practica practica
    Practica modulo

    static constraints = {

        valorGasto(nullable: true,blank:true)
        valorAnestecista(nullable: true,blank:true)
        valorAyudante(nullable: true,blank:true)
        valorEspecialista(nullable: true,blank:true)
        practica(nullable: false,blank:false)
        modulo(nullable: false,blank:false)
    }
}
