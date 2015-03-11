package maternidad

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)
class LiquidacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Liquidacion.list(params), model: [liquidacionInstanceCount: Liquidacion.count()]
    }

    def show(Liquidacion liquidacionInstance) {
        respond liquidacionInstance
    }

    def create() {
        respond new Liquidacion(params)
    }

    @Transactional
    def save(Liquidacion liquidacionInstance) {
        if (liquidacionInstance == null) {
            notFound()
            return
        }

        if (liquidacionInstance.hasErrors()) {
            respond liquidacionInstance.errors, view: 'create'
            return
        }

        liquidacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'liquidacion.label', default: 'Liquidacion'), liquidacionInstance.id])
                redirect liquidacionInstance
            }
            '*' { respond liquidacionInstance, [status: CREATED] }
        }
    }

    def edit(Liquidacion liquidacionInstance) {
        respond liquidacionInstance
    }

    @Transactional
    def update(Liquidacion liquidacionInstance) {
        if (liquidacionInstance == null) {
            notFound()
            return
        }

        if (liquidacionInstance.hasErrors()) {
            respond liquidacionInstance.errors, view: 'edit'
            return
        }

        liquidacionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Liquidacion.label', default: 'Liquidacion'), liquidacionInstance.id])
                redirect liquidacionInstance
            }
            '*' { respond liquidacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Liquidacion liquidacionInstance) {

        if (liquidacionInstance == null) {
            notFound()
            return
        }

        liquidacionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Liquidacion.label', default: 'Liquidacion'), liquidacionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'liquidacion.label', default: 'Liquidacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def configurarLiquidacion = {
        def listaPagos = PagoFactura.withCriteria {
            le('porcentajeLiquidado', new Double(100))
        }
        [listaPagos: listaPagos]
    }

    def armarLiquidacion = {
        def conceptos = params?.conceptos
        def listaPagos = []
        def listaConceptos = ConceptoProfesional.findAllByIdInList([conceptos])
        def mapaLiquidaciones = [:]
        try {
            listaPagos = PagoFactura.withCriteria {
                le('porcentajeLiquidado', Double.valueOf(100))
                gt('porcentajeALiquidar', Double.valueOf(0))
            }


            Profesional.findAllByActivo(true)?.each { profesional ->
                mapaLiquidaciones.put(profesional, new Liquidacion(profesional: profesional))
            }

            listaPagos.each {
                pago ->
                    mapaLiquidaciones.values()?.each {
                        liq ->
                            liq.agregarPagoFactura(pago)

                    }
            }

            mapaLiquidaciones.values()?.each {
                liquidacion ->
                    liquidacion.agregarConceptosProfesional(listaConceptos?.codigo)
            }

        } catch (e) {
            flash.errors = "Ocurrió un error al consultar la liquidación"
            redirect(action: "configurarLiquidacion", controller: Liquidacion)
        }
        render(template: "confirmarLiquidacion", model: [listaLiquidaciones: mapaLiquidaciones.values(), listaConceptoProfesional: listaConceptos, listaPagoFactura: listaPagos])
    }

    def liquidarAction = {
        println "entro al liquidar"
        println   params
        println params?.dump()
        return null
    }

    @Transactional
    def liquidarAction(Collection<Liquidacion> listaLiquidaciones) {
        println "entro al liquidar"
        println   listaLiquidaciones
        println params
        if (!listaLiquidaciones) {
            notFound()
            return
        }
        listaLiquidaciones?.each {
            if (it.hasErrors()) {
                respond it.errors, view: 'configurarLiquidacion'
                return
            }
        }

        listaLiquidaciones?.each { facturaInstance ->
            facturaInstance.save flush: true
        }
        flash.message = "Se generó la liquidación correctamente"
        redirect(action: "configurarLiquidacion", controller: Liquidacion)
    }

}
