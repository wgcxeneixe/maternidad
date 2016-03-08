package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = true)
class MedicamentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

   // static scaffold = true


    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Medicamento.list(params), model: [medicamentoInstanceCount: Medicamento.count()]
    }
*/
    def index = {

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

        def criteria = Medicamento.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def medicamentos = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [codigo:params.codigo,nombre:params.nombre]

        def model = [medicamentoInstanceList: medicamentos, medicamentoInstanceTotal:medicamentos.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }

    def show(Medicamento medicamentoInstance) {
        respond medicamentoInstance
    }

    def create() {
        respond new Medicamento(params)
    }

    @Transactional
    def save(Medicamento medicamentoInstance) {
        if (medicamentoInstance == null) {
            notFound()
            return
        }

        if (medicamentoInstance.hasErrors()) {
            respond medicamentoInstance.errors, view: 'create'
            return
        }
        medicamentoInstance.valor=(params?.valor)?params?.valor as Double:null
        medicamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medicamento.label', default: 'Medicamento'), medicamentoInstance.id])
                redirect medicamentoInstance
            }
            '*' { respond medicamentoInstance, [status: CREATED] }
        }
    }

    def edit(Medicamento medicamentoInstance) {
        respond medicamentoInstance
    }

    @Transactional
    def update(Medicamento medicamentoInstance) {
        if (medicamentoInstance == null) {
            notFound()
            return
        }

        if (medicamentoInstance.hasErrors()) {
            respond medicamentoInstance.errors, view: 'edit'
            return
        }
        medicamentoInstance.valor=(params?.valor)?params?.valor as Double:null
        medicamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Medicamento.label', default: 'Medicamento'), medicamentoInstance.id])
                redirect medicamentoInstance
            }
            '*' { respond medicamentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Medicamento medicamentoInstance) {

        if (medicamentoInstance == null) {
            notFound()
            return
        }

        medicamentoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Medicamento.label', default: 'Medicamento'), medicamentoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicamento.label', default: 'Medicamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
