package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class ObraSocialController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ObraSocial.list(params), model:[obraSocialInstanceCount: ObraSocial.count()]
    }
*/

    def index = {

      /*  if (!springSecurityService.isLoggedIn()){
            redirect(controller: 'login', action: "auth")
        }
*/
        def query = {
            if (params.sigla) {
                ilike('sigla', '%' + params.sigla + '%')
            }
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

        def criteria = ObraSocial.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def obrasociales = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [sigla: params.sigla,codigo:params.codigo,nombre:params.nombre]

        def model = [obraSocialInstanceList: obrasociales, obraSocialInstanceTotal:obrasociales.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }


    def seleccion = {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        def query = {
            if (params.sigla) {
                ilike('sigla', '%' + params.sigla + '%')
            }
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

        def criteria = ObraSocial.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def obrasociales = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [sigla: params.sigla,codigo:params.codigo,nombre:params.nombre]

        def model = [obraSocialInstanceList: obrasociales, obraSocialInstanceTotal:obrasociales.size(), filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grillaSeleccionable", model: model)
        }
        else {
            model
        }
    }

    def show(ObraSocial obraSocialInstance) {
        respond obraSocialInstance
    }

    def create() {
        respond new ObraSocial(params)
    }

    @Transactional
    def save(ObraSocial obraSocialInstance) {
        if (obraSocialInstance == null) {
            notFound()
            return
        }

        if (obraSocialInstance.hasErrors()) {
            respond obraSocialInstance.errors, view:'create'
            return
        }

        obraSocialInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'obraSocial.label', default: 'ObraSocial'), obraSocialInstance.id])
                redirect(action: "index")
            }
            '*' { respond obraSocialInstance, [status: CREATED],view: 'index'  }
        }
    }

    def edit(ObraSocial obraSocialInstance) {
        respond obraSocialInstance
    }

    @Transactional
    def update(ObraSocial obraSocialInstance) {
        if (obraSocialInstance == null) {
            notFound()
            return
        }

        if (obraSocialInstance.hasErrors()) {
            respond obraSocialInstance.errors, view:'edit'
            return
        }

        obraSocialInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ObraSocial.label', default: 'ObraSocial'), obraSocialInstance.id])
                redirect(action: "index")
            }
            '*'{ respond obraSocialInstance, [status: OK],view:'index' }
        }
    }

    @Transactional
    def delete(ObraSocial obraSocialInstance) {

        if (obraSocialInstance == null) {
            notFound()
            return
        }

        obraSocialInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ObraSocial.label', default: 'ObraSocial'), obraSocialInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'obraSocial.label', default: 'ObraSocial'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def verPlanes={

        def obraSocial=ObraSocial.get(params.id as Long)

        render(view: "verPlanes", model: [os:obraSocial])

    }




    def conveniosDeOS= {

        params.max = Math.min(params.max ?: 10, 100)

        def os=ObraSocial.findById(params.id)
        def convenios=  Convenio.findAllByObrasocial(os,params)

        respond convenios, model:[obraSocialInstanceCount: convenios?.size()]
    }



}
