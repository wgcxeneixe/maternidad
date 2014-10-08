package maternidad

class Producto {

    String nombre
    String codigo
    String descripcion
    Long cantidadMinima =1

    static hasMany = [movimientosStock:MovimientoStock]

    static constraints = {
        nombre(size:2..120, nullable:false, blank:false)
        codigo(size:2..10, nullable:true, blank:true)
        descripcion(size:0..5000, nullable:true, blank:true)

    }

    String toString() { "${nombre}" }


    Long stock(){

        def productoInstance = this//Producto.read(params?.idProducto as String)
        def movimientos = MovimientoStock.findAllByProducto(productoInstance)

        def ingreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                "where ms.ingreso=true and  ms.producto = :producto",
                [producto: productoInstance])

        def egreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                "where ms.ingreso=false and  ms.producto = :producto",
                [producto: productoInstance])

        def ing  = (ingreso[0])? ingreso[0]:0

        def egr  = (egreso[0])? egreso[0]:0

        def total = ing- egr


return total


    }


}
