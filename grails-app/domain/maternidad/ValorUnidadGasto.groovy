package maternidad

class ValorUnidadGasto {

    Double valor
    Practica practica
    TipoGasto tipoGasto

    static constraints = {

        valor(nullable: true,blank:true)
        practica(nullable: false,blank:false)
        tipoGasto(nullable: false,blank:false)

    }
}
