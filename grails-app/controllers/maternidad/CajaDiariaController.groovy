package maternidad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CajaDiariaController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CajaDiaria.list(params), model:[cajaDiariaInstanceCount: CajaDiaria.count()]
    }

    def show(CajaDiaria cajaDiariaInstance) {
        respond cajaDiariaInstance
    }

    def create() {
        respond new CajaDiaria(params)
    }

    @Transactional
    def save(CajaDiaria cajaDiariaInstance) {
        if (cajaDiariaInstance == null) {
            notFound()
            return
        }

        if (cajaDiariaInstance.hasErrors()) {
            respond cajaDiariaInstance.errors, view:'create'
            return
        }

        cajaDiariaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cajaDiaria.label', default: 'CajaDiaria'), cajaDiariaInstance.id])
                redirect cajaDiariaInstance
            }
            '*' { respond cajaDiariaInstance, [status: CREATED] }
        }
    }

    def edit(CajaDiaria cajaDiariaInstance) {
        respond cajaDiariaInstance
    }

    @Transactional
    def update(CajaDiaria cajaDiariaInstance) {
        if (cajaDiariaInstance == null) {
            notFound()
            return
        }

        if (cajaDiariaInstance.hasErrors()) {
            respond cajaDiariaInstance.errors, view:'edit'
            return
        }

        cajaDiariaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CajaDiaria.label', default: 'CajaDiaria'), cajaDiariaInstance.id])
                redirect cajaDiariaInstance
            }
            '*'{ respond cajaDiariaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CajaDiaria cajaDiariaInstance) {

        if (cajaDiariaInstance == null) {
            notFound()
            return
        }

        cajaDiariaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CajaDiaria.label', default: 'CajaDiaria'), cajaDiariaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cajaDiaria.label', default: 'CajaDiaria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
