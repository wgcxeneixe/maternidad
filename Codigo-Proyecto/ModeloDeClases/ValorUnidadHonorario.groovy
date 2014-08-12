package maternidad

class ValorUnidadHonorario {

    Double valor
    Practica practica
    Componente componente

    static constraints = {

        valor(nullable: true,blank:true)
        practica(nullable: false,blank:false)
        componente(nullable: false,blank:false)

    }
}
