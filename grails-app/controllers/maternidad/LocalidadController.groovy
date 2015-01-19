package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class LocalidadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Localidad.list(params), model: [localidadInstanceCount: Localidad.count()]
    }

    def show(Localidad localidadInstance) {
        respond localidadInstance
    }

    def create() {
        respond new Localidad(params)
    }

    @Transactional
    def save(Localidad localidadInstance) {
        if (localidadInstance == null) {
            notFound()
            return
        }

        if (localidadInstance.hasErrors()) {
            respond localidadInstance.errors, view: 'create'
            return
        }

        localidadInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'localidad.label', default: 'Localidad'), localidadInstance.id])
                redirect localidadInstance
            }
            '*' { respond localidadInstance, [status: CREATED] }
        }
    }

    def edit(Localidad localidadInstance) {
        respond localidadInstance
    }

    @Transactional
    def update(Localidad localidadInstance) {
        if (localidadInstance == null) {
            notFound()
            return
        }

        if (localidadInstance.hasErrors()) {
            respond localidadInstance.errors, view: 'edit'
            return
        }

        localidadInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Localidad.label', default: 'Localidad'), localidadInstance.id])
                redirect localidadInstance
            }
            '*' { respond localidadInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Localidad localidadInstance) {

        if (localidadInstance == null) {
            notFound()
            return
        }

        localidadInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Localidad.label', default: 'Localidad'), localidadInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'localidad.label', default: 'Localidad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
