package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class CajaDiariaController {

   // static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = 'fechaApertura'
        params.order = 'desc'
        respond CajaDiaria.list(params), model:[cajaDiariaInstanceCount: CajaDiaria.count()]
    }

    def show(CajaDiaria cajaDiariaInstance) {
        respond cajaDiariaInstance
    }

    def create() {
        def cajaDiariaAbiertaInstance =  CajaDiaria.findByFechaCierreIsNull()
        if(cajaDiariaAbiertaInstance == null ){
            def cajaDiariaInstance = new CajaDiaria(params)
            /* Buscamos el saldo final de la ultima caja */
            def cajaDiariaUltimaInstance = CajaDiaria.listOrderByFechaCierre()
            if(cajaDiariaUltimaInstance.size() > 0 ){
            cajaDiariaInstance.saldoInicial = cajaDiariaUltimaInstance.last().saldoFinal}
            //Asignamos la fecha, hora y usuario actual
            cajaDiariaInstance.fechaApertura = new Date()
            cajaDiariaInstance.usuarioApertura = springSecurityService.currentUser
            respond cajaDiariaInstance}
        else{
            redirect action: "edit", method: "POST", params: [id:cajaDiariaAbiertaInstance.id]
        }

    }

    @Transactional
    def save(CajaDiaria cajaDiariaInstance) {
        //Asignamos la fecha actual como fecha de apertura

        cajaDiariaInstance.fechaApertura = new Date()
        cajaDiariaInstance.usuarioApertura = springSecurityService.currentUser
        //params?.usuarioApertura = springSecurityService.currentUser.id
        if (cajaDiariaInstance == null) {
            notFound()1
            return
        }

        if (cajaDiariaInstance.hasErrors()) {
            respond cajaDiariaInstance.errors, view:'create'
            return
        }
        /* Controlamos la ultima fecha y la fecha de apertura */
        /* Buscamos el saldo final de la ultima caja */
        /*
        def cajaDiariaUltimaInstance = CajaDiaria.listOrderByFechaCierre()
        if(cajaDiariaUltimaInstance.size() > 0 ){
            def fecha = cajaDiariaUltimaInstance.last().fechaCierre
            if(cajaDiariaUltimaInstance.last().fechaCierre > cajaDiariaInstance.fechaApertura){
                flash.message = message(code: 'cajaDiaria.ultimocierremayor.message', args: [message(code: 'cajaDiaria.label', default: 'Caja diaria'), cajaDiariaInstance.id])
                respond cajaDiariaInstance.errors, view:'create'
                return
            }
        }
        */
        cajaDiariaInstance.saldoInicial=(params.saldoInicial)? params.saldoInicial as Double:0
        cajaDiariaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'cajaDiaria.created.message', args: [message(code: 'cajaDiaria.label', default: 'Caja diaria'), cajaDiariaInstance.id])
               // redirect cajaDiariaInstance
               redirect(action: 'index')

            }
            '*' { respond cajaDiariaInstance, [status: CREATED] }
        }
    }

    def edit(CajaDiaria cajaDiariaInstance) {
        //cajaDiariaInstance.usuarioApertura = springSecurityService.currentUser
        def detallesCaja = DetalleCaja.findAllByCaja(cajaDiariaInstance)
        def saldofinal = 0
        for(undetalle in detallesCaja)
        {
           if(undetalle.credito == true){
               saldofinal = saldofinal + undetalle.monto
           }else{
               saldofinal = saldofinal - undetalle.monto
           }
        }
        cajaDiariaInstance.saldoFinal = cajaDiariaInstance.saldoInicial + saldofinal
        def cajacerrada = new Boolean(false)
        if(cajaDiariaInstance.fechaCierre != null){
            cajacerrada = true
        }else{
            cajaDiariaInstance.fechaCierre = new Date()
        }
        //Solo lo asignamos si no tiene usuario asignado
        if(cajaDiariaInstance.usuarioCierre == null){
            cajaDiariaInstance.usuarioCierre = springSecurityService.currentUser
        }
        respond cajaDiariaInstance, model:[cajaDiariaInstanceCerrada: cajacerrada]
    }

    @Transactional
    def update(CajaDiaria cajaDiariaInstance) {
        if(cajaDiariaInstance.usuarioCierre == null){
            cajaDiariaInstance.usuarioCierre = springSecurityService.currentUser
        }

        if(cajaDiariaInstance.fechaCierre == null){
            cajaDiariaInstance.fechaCierre = new Date()
        }

        if (cajaDiariaInstance == null) {
            notFound()
            return
        }

        if (cajaDiariaInstance.hasErrors()) {
            respond cajaDiariaInstance.errors, view:'edit', model:[cajaDiariaInstanceCerrada: false]
            return
        }

        /* Controlamos la ultima fecha y la fecha de apertura */
        /* Buscamos el saldo final de la ultima caja */
        //CajaDiaria.listOrderByFechaCierre()
        /*
        def cajaDiariaUltimaInstance = CajaDiaria.findAllByIdNotEqual(cajaDiariaInstance.id, [sort: "fechaCierre", order: "asc"])
        if(cajaDiariaUltimaInstance.size() > 0 ){
            def fecha = cajaDiariaUltimaInstance.last().fechaCierre
            if(cajaDiariaUltimaInstance.last().fechaCierre > cajaDiariaInstance.fechaApertura){
                flash.message = message(code: 'cajaDiaria.ultimocierremayor.message', args: [message(code: 'cajaDiaria.label', default: 'Caja diaria'), cajaDiariaInstance.id])
                respond cajaDiariaInstance.errors, view:'edit', model:[cajaDiariaInstanceCerrada: false]
                return
            }
        }
        */

        cajaDiariaInstance.saldoInicial=(params?.saldoInicial)? params?.saldoInicial as Double:0
        cajaDiariaInstance.saldoFinal=(params?.saldoFinal)? params?.saldoFinal as Double:0


        cajaDiariaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CajaDiaria.label', default: 'Caja Diaria'), cajaDiariaInstance.id])
              //  redirect cajaDiariaInstance

                redirect(action:'index')

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
