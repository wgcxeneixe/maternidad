package maternidad

class MovimientoStock {

    Producto producto
    Destino destino
    String descripcion
    Long cantidad =1
    Boolean ingreso
    Date fecha
    Usuario usuario

    static constraints = {

        producto(nullable: false,blank:false)
        destino(nullable: true,blank:true)
        cantidad(nullable: false,blank:false)
        ingreso(nullable: false,blank:false)
        descripcion(nullable: true,blank:true)
        usuario(nullable: true,blank:true)
    }
}
