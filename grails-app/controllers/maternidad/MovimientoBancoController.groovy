package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class MovimientoBancoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoBanco.list(params), model: [movimientoBancoInstanceCount: MovimientoBanco.count()]
    }

    def show(MovimientoBanco movimientoBancoInstance) {
        respond movimientoBancoInstance
    }

    def create() {

        if (params.id){
            def banco=Banco.get(params.id)

            def movimiento = new MovimientoBanco(params)

            movimiento.banco=banco

            respond movimiento
        }else {

            respond new MovimientoBanco(params)

        }

    }

    @Transactional
    def save(MovimientoBanco movimientoBancoInstance) {
        if (movimientoBancoInstance == null) {
            notFound()
            return
        }

        if (movimientoBancoInstance.hasErrors()) {
            respond movimientoBancoInstance.errors, view: 'create'
            return
        }

        movimientoBancoInstance.monto=(params?.monto)? params?.monto as Double:0
        movimientoBancoInstance.fecha=(params.fecha)? params.fecha as Date : new Date()
        movimientoBancoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoBanco.label', default: 'MovimientoBanco'), movimientoBancoInstance.id])
                if(params.parametro){forward(controller: 'banco',action: 'index')}else {
                   // redirect action: 'index'
                   redirect(action:'index')
                }
            }
            '*' { respond movimientoBancoInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoBanco movimientoBancoInstance) {
        respond movimientoBancoInstance
    }

    @Transactional
    def update(MovimientoBanco movimientoBancoInstance) {
        if (movimientoBancoInstance == null) {
            notFound()
            return
        }

        if (movimientoBancoInstance.hasErrors()) {
            respond movimientoBancoInstance.errors, view: 'edit'
            return
        }

        movimientoBancoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoBanco.label', default: 'MovimientoBanco'), movimientoBancoInstance.id])
                redirect movimientoBancoInstance
            }
            '*' { respond movimientoBancoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoBanco movimientoBancoInstance) {

        if (movimientoBancoInstance == null) {
            notFound()
            return
        }

        movimientoBancoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoBanco.label', default: 'MovimientoBanco'), movimientoBancoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoBanco.label', default: 'MovimientoBanco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def cuentaCorriente={

        def movimientos = MovimientoBanco.findAllById(0)



        return [movimientoBancoInstanceList: movimientos, movimientoBancoInstanceCount: 0, total: 0]

    }

    def getCuenta = {

        if(params.idBanco && params.idBanco!='null' ) {

            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def bancoInstance = Banco.read(params?.idBanco as String)
            def movimientos = MovimientoBanco.findAllByBanco(bancoInstance, [sort: "fecha", order: "desc",max: params.max, offset: params.offset])

            def ingreso = MovimientoBanco.executeQuery("select sum(monto) from MovimientoBanco mb " +
                    "where mb.credito=true and  mb.banco = :banco",
                    [banco: bancoInstance])

            def egreso = MovimientoBanco.executeQuery("select sum(monto) from MovimientoBanco mb " +
                    "where mb.credito=false and  mb.banco = :banco",
                    [banco: bancoInstance])

            def ing  = (ingreso[0])? ingreso[0]:0

            def egr  = (egreso[0])? egreso[0]:0

            def total = ing- egr


            render(template: 'movimientos', model: [movimientoBancoInstanceList: movimientos, movimientoBancoInstanceCount: MovimientoBanco.findAllByBanco(bancoInstance).size(), total: total,idBanco:bancoInstance.id])
        }
        else {
            def movimientos = MovimientoBanco.findAllById(0)

            render(template: 'movimientos', model: [movimientoBancoInstanceList: movimientos, movimientoBancoInstanceCount: 0, total: 0])
        }
    }


}
