package maternidad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CajaDiariaController {

   // static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CajaDiaria.list(params), model:[cajaDiariaInstanceCount: CajaDiaria.count()]
    }

    def show(CajaDiaria cajaDiariaInstance) {
        respond cajaDiariaInstance
    }

    def create() {
        def cajaDiariaAbiertaInstance =  CajaDiaria.findByFechaCierreIsNull()
        if(cajaDiariaAbiertaInstance == null ){
            def cajaDiariaInstance = new CajaDiaria(params)
            //cajaDiariaInstance.usuarioApertura = springSecurityService.currentUser
            /* Buscamos el saldo final de la ultima caja */
            def cajaDiariaUltimaInstance = CajaDiaria.listOrderByFechaCierre()
            if(cajaDiariaUltimaInstance.size() > 0 ){
            cajaDiariaInstance.saldoInicial = cajaDiariaUltimaInstance.first().saldoFinal}
            respond cajaDiariaInstance}
        else{
            redirect action: "edit", method: "POST", params: [id:cajaDiariaAbiertaInstance.id]
        }

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

        /* Controlamos la ultima fecha y la fecha de apertura */
        /* Buscamos el saldo final de la ultima caja */
        def cajaDiariaUltimaInstance = CajaDiaria.listOrderByFechaCierre()
        if(cajaDiariaUltimaInstance.size() > 0 ){
            def fecha = cajaDiariaUltimaInstance.last().fechaCierre
            if(cajaDiariaUltimaInstance.last().fechaCierre > cajaDiariaInstance.fechaApertura){
                flash.message = message(code: 'cajaDiaria.ultimocierremayor.message', args: [message(code: 'cajaDiaria.label', default: 'Caja diaria'), cajaDiariaInstance.id])
                respond cajaDiariaInstance.errors, view:'create'
                return
            }
        }

        cajaDiariaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'cajaDiaria.created.message', args: [message(code: 'cajaDiaria.label', default: 'Caja diaria'), cajaDiariaInstance.id])
                redirect cajaDiariaInstance
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
        cajaDiariaInstance.saldoFinal = saldofinal
        def cajacerrada = new Boolean(false)
        if(cajaDiariaInstance.fechaCierre != null){
            cajacerrada = true
        }else{
            cajaDiariaInstance.fechaCierre = new Date()
        }
        respond cajaDiariaInstance, model:[cajaDiariaInstanceCerrada: cajacerrada]
    }

    @Transactional
    def update(CajaDiaria cajaDiariaInstance) {
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
        def cajaDiariaUltimaInstance = CajaDiaria.findAllByIdNotEqual(cajaDiariaInstance.id, [sort: "fechaCierre", order: "asc"])
        if(cajaDiariaUltimaInstance.size() > 0 ){
            def fecha = cajaDiariaUltimaInstance.last().fechaCierre
            if(cajaDiariaUltimaInstance.last().fechaCierre > cajaDiariaInstance.fechaApertura){
                flash.message = message(code: 'cajaDiaria.ultimocierremayor.message', args: [message(code: 'cajaDiaria.label', default: 'Caja diaria'), cajaDiariaInstance.id])
                respond cajaDiariaInstance.errors, view:'edit', model:[cajaDiariaInstanceCerrada: false]
                return
            }
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
