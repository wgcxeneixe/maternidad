package maternidad

class ComponenteTipoHonorario {

    Componente componente
    TipoHonorario tipoHonorario

    static constraints = {

        componente(nullable: false,blank:false)
        tipoHonorario(nullable: false,blank:false)
    }
}
