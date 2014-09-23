package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ProductoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


   /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Producto.list(params), model: [productoInstanceCount: Producto.count()]
    }
*/

    def index = {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        def query = {

            if (params.codigo) {
                ilike('codigo', '%' + params.codigo + '%')
            }

            if (params.nombre) {
                ilike('nombre', '%' + params.nombre + '%')

            }

            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = Producto.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def productos = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [codigo:params.codigo,nombre:params.nombre]

        def model = [productoInstanceList: productos, productoInstanceTotal:productos.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }



    def show(Producto productoInstance) {
        respond productoInstance
    }

    def create() {
        respond new Producto(params)
    }

    @Transactional
    def save(Producto productoInstance) {
        if (productoInstance == null) {
            notFound()
            return
        }

        if (productoInstance.hasErrors()) {
            respond productoInstance.errors, view: 'create'
            return
        }

        productoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'producto.label', default: 'Producto'), productoInstance.id])
                redirect productoInstance
            }
            '*' { respond productoInstance, [status: CREATED] }
        }
    }

    def edit(Producto productoInstance) {
        respond productoInstance
    }

    @Transactional
    def update(Producto productoInstance) {
        if (productoInstance == null) {
            notFound()
            return
        }

        if (productoInstance.hasErrors()) {
            respond productoInstance.errors, view: 'edit'
            return
        }

        productoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Producto.label', default: 'Producto'), productoInstance.id])
                redirect productoInstance
            }
            '*' { respond productoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Producto productoInstance) {

        if (productoInstance == null) {
            notFound()
            return
        }

        productoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Producto.label', default: 'Producto'), productoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
