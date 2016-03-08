package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = true)
class DestinoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Destino.list(params), model: [destinoInstanceCount: Destino.count()]
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

        def criteria = Destino.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def destinos = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [codigo:params.codigo,nombre:params.nombre]

        def model = [destinoInstanceList: destinos, destinoInstanceTotal:destinos.size(), filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }


    def show(Destino destinoInstance) {
        respond destinoInstance
    }

    def create() {
        respond new Destino(params)
    }

    @Transactional
    def save(Destino destinoInstance) {
        if (destinoInstance == null) {
            notFound()
            return
        }

        if (destinoInstance.hasErrors()) {
            respond destinoInstance.errors, view: 'create'
            return
        }

        destinoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'destino.label', default: 'Destino'), destinoInstance.id])
                redirect action: 'index'
            }
            '*' { respond destinoInstance, [status: CREATED],view: 'index' }
        }
    }

    def edit(Destino destinoInstance) {
        respond destinoInstance
    }

    @Transactional
    def update(Destino destinoInstance) {
        if (destinoInstance == null) {
            notFound()
            return
        }

        if (destinoInstance.hasErrors()) {
            respond destinoInstance.errors, view: 'edit'
            return
        }

        destinoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Destino.label', default: 'Destino'), destinoInstance.id])
                redirect action: 'index'
            }
            '*' { respond destinoInstance, [status: OK],view: 'index' }
        }
    }

    @Transactional
    def delete(Destino destinoInstance) {

        if (destinoInstance == null) {
            notFound()
            return
        }

        destinoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Destino.label', default: 'Destino'), destinoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'destino.label', default: 'Destino'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
