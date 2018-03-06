package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_STOCK')")
@Transactional(readOnly = true)
class MovimientoStockController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoStock.list(params), model: [movimientoStockInstanceCount: MovimientoStock.count()]
    }
*/


    def index (Integer max) {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        /*
          * Se agrega esta parte de código para erregla la paginacion porque el locale estaba en ingles
           *
           * */
        Locale defaultLocale = Locale.default
        TimeZone defaultTZ = TimeZone.default
        Locale locale = Locale.UK
        Locale.setDefault locale // set this otherwise the test will fail if your locale isn't the same
        TimeZone.setDefault TimeZone.getTimeZone('Etc/GMT')

        def query = {
            if (params.fechaDesde && params.fechaHasta) {
                if((params.fechaDesde).class.is(String))println(Date.parse('E MMM dd H:m:s z yyyy', params.fechaDesde))
                between('fecha', params.fechaDesde, params.fechaHasta)
            }
            if (params.codigo) {
              producto{  ilike('codigo', '%' + params.codigo + '%') }
            }

            if (params.nombre) {
                producto{ilike('nombre', '%' + params.nombre + '%')}

            }

            if (params.codigoDestino) {
                destino{  ilike('codigo', '%' + params.codigoDestino + '%') }
            }

            if (params.nombreDestino) {
                destino{ilike('nombre', '%' + params.nombreDestino + '%')}

            }

            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = MovimientoStock.createCriteria()
       // params.max = Math.min(params.max ? params.int('max') : 10, 100)
         params.max = Math.min(max ?: 10, 100)
        def movimientos = criteria.list(query, max: params.max, offset: params.offset).unique()
        def filters = [fechaDesde: params.fechaDesde,fechaHasta: params.fechaHasta,codigo:params.codigo,nombre:params.nombre,codigoDestino:params.codigoDestino,nombreDestino:params.nombreDestino]


        def model = [movimientoStockInstanceList: movimientos, movimientoStockInstanceCount:movimientos.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }


    def show(MovimientoStock movimientoStockInstance) {
        respond movimientoStockInstance
    }

    def create() {

       if (params.id){
           def producto=Producto.get(params.id)

           def movimiento = new MovimientoStock(params)

           movimiento.producto=producto

           respond movimiento
       }else {

           respond new MovimientoStock(params)

       }

    }

    @Transactional
    def save(MovimientoStock movimientoStockInstance) {
        if (movimientoStockInstance == null) {
            notFound()
            return
        }

        if (movimientoStockInstance.hasErrors()) {
            respond movimientoStockInstance.errors, view: 'create'
            return
        }

        movimientoStockInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoStock.label', default: 'MovimientoStock'), movimientoStockInstance.id])
               if(params.parametro){forward(controller: 'producto',action: 'index')}else {
                   redirect action: 'index'

               }

            }
            '*' { respond movimientoStockInstance, [status: CREATED],view: 'index' }
        }
    }

    def edit(MovimientoStock movimientoStockInstance) {
        respond movimientoStockInstance
    }

    @Transactional
    def update(MovimientoStock movimientoStockInstance) {
        if (movimientoStockInstance == null) {
            notFound()
            return
        }

        if (movimientoStockInstance.hasErrors()) {
            respond movimientoStockInstance.errors, view: 'edit'
            return
        }

        movimientoStockInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoStock.label', default: 'MovimientoStock'), movimientoStockInstance.id])
                redirect movimientoStockInstance
            }
            '*' { respond movimientoStockInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoStock movimientoStockInstance) {

        if (movimientoStockInstance == null) {
            notFound()
            return
        }

        movimientoStockInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoStock.label', default: 'MovimientoStock'), movimientoStockInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoStock.label', default: 'MovimientoStock'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def stock={

def movimientos = MovimientoStock.findAllById(0)



        return [movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: 0, total: 0]

    }

    def getSaldoStock = {

       if(params.idProducto && params.idProducto!='null' ) {

           params.max = Math.min(params.max ? params.int('max') : 10, 100)
           def productoInstance = Producto.read(params?.idProducto as String)
           def movimientos = MovimientoStock.findAllByProducto(productoInstance, [sort: "fecha", order: "desc",max: params.max, offset: params.offset])

           def ingreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                   "where ms.ingreso=true and  ms.producto = :producto",
                   [producto: productoInstance])

           def egreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                   "where ms.ingreso=false and  ms.producto = :producto",
                   [producto: productoInstance])

        def ing  = (ingreso[0])? ingreso[0]:0

           def egr  = (egreso[0])? egreso[0]:0

           def total = ing- egr


           render(template: 'movimientos', model: [movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: MovimientoStock.findAllByProducto(productoInstance).size(), total: total,idProducto:productoInstance.id])
       }
        else {
           def movimientos = MovimientoStock.findAllById(0)

           render(template: 'movimientos', model: [movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: 0, total: 0])
       }
    }


    def chequearCantidad = {

      def cantidad=  params.cantidad as Long

      def producto = Producto.get(params.producto)


        def ingreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                "where ms.ingreso=true and  ms.producto = :producto",
                [producto: producto])

        def egreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                "where ms.ingreso=false and  ms.producto = :producto",
                [producto: producto])

        def ing  = (ingreso[0])? ingreso[0]:0

        def egr  = (egreso[0])? egreso[0]:0

        def total = ing- egr

       total= total - cantidad

        def resultado

        if(total >= 0){
            resultado= true
        }
        else {
            resultado= false
        }


        response.contentType = "application/json"
        render """{"resultado":${resultado}}"""

    }


    def chequearMinimo = {

        def cantidad=  params.cantidad as Long

        def producto = Producto.get(params.producto)


        def ingreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                "where ms.ingreso=true and  ms.producto = :producto",
                [producto: producto])

        def egreso = MovimientoStock.executeQuery("select sum(cantidad) from MovimientoStock ms " +
                "where ms.ingreso=false and  ms.producto = :producto",
                [producto: producto])

        def ing  = (ingreso[0])? ingreso[0]:0

        def egr  = (egreso[0])? egreso[0]:0

        def total = ing- egr

        total= total - cantidad

        def resultado

        if(total >= producto.cantidadMinima){
            resultado= true
        }
        else {
            resultado= false
        }


        response.contentType = "application/json"
        render """{"resultado":${resultado}}"""

    }

}
