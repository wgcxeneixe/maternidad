package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = true)
class SectorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sector.list(params), model: [sectorInstanceCount: Sector.count()]
    }

    def show(Sector sectorInstance) {
        respond sectorInstance
    }

    def create() {
        respond new Sector(params)
    }

    @Transactional
    def save(Sector sectorInstance) {
        if (sectorInstance == null) {
            notFound()
            return
        }

        if (sectorInstance.hasErrors()) {
            respond sectorInstance.errors, view: 'create'
            return
        }

        sectorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sector.label', default: 'Sector'), sectorInstance.id])
                redirect sectorInstance
            }
            '*' { respond sectorInstance, [status: CREATED] }
        }
    }

    def edit(Sector sectorInstance) {
        respond sectorInstance
    }

    @Transactional
    def update(Sector sectorInstance) {
        if (sectorInstance == null) {
            notFound()
            return
        }

        if (sectorInstance.hasErrors()) {
            respond sectorInstance.errors, view: 'edit'
            return
        }

        sectorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Sector.label', default: 'Sector'), sectorInstance.id])
                redirect sectorInstance
            }
            '*' { respond sectorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Sector sectorInstance) {

        if (sectorInstance == null) {
            notFound()
            return
        }

        sectorInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Sector.label', default: 'Sector'), sectorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sector.label', default: 'Sector'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
