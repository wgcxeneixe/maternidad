package maternidad

class ComponenteTipoHonorario {

    Componente componente
    TipoHonorario tipoHonorario

    static belongsTo = [
            componente : Componente,
            tipoHonorario : TipoHonorario
    ]

    static constraints = {

        componente(nullable: false,blank:false)
        tipoHonorario(nullable: false,blank:false)
    }
}
