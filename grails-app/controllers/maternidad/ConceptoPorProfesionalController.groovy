package maternidad

import com.sun.org.apache.xpath.internal.operations.Bool
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
@Transactional(readOnly = false)
class ConceptoPorProfesionalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoPorProfesional.list(params), model: [conceptoPorProfesionalInstanceCount: ConceptoPorProfesional.count()]
    }

    def show(ConceptoPorProfesional conceptoPorProfesionalInstance) {
        respond conceptoPorProfesionalInstance
    }

    def create() {

        def profesional
        def conceptos
        def concepto

        if(params.id){

            profesional= Profesional.get(params.id as Long)
             conceptos= ConceptoPorProfesional.findAllByProfesional(profesional)
             concepto = new ConceptoPorProfesional()
//            conceptos.properties = params

        }
        else{

             conceptos= ConceptoPorProfesional.findAllById(0)
             concepto = new ConceptoPorProfesional()
           // conceptos.properties = params
             profesional =null

        }

        return [concepto:concepto,conceptos:conceptos,profesional: profesional,"profesional.id":profesional?.id]
    }

    def save = {

        def profesional

        if(params.profesional.id && params.profesional.id!='null' ){
             profesional=Profesional.get(params?.profesional?.id as Long)
        }else {
            profesional=null
        }


        if(profesional) {

            for (conceptoL in ConceptoProfesional.list()) {


                def lista = params?.conceptos as List

                if (lista?.contains(conceptoL.id as String)) {
                    def conceptoInstance = new ConceptoPorProfesional()
                    conceptoInstance.profesional = profesional
                    conceptoInstance.conceptoProfesional = conceptoL
                    conceptoInstance.fecha = new Date()
                    conceptoInstance.montoFijo = (params['valor' + conceptoL?.id])? params['valor' + conceptoL?.id] as Double :0
                    conceptoInstance.porcentaje = (params['porcentaje' + conceptoL?.id]) ? params['porcentaje' + conceptoL?.id]  as Double:0
                    conceptoInstance.porUnicaVez = (params['unicavez' + conceptoL?.id] as Boolean)? true:false
                    conceptoInstance.observacion = params['observacion' + conceptoL?.id] as String
                    conceptoInstance.activo = (params['activo' + conceptoL?.id] as Boolean)? true:false

                    def conceptoInstanceAux = ConceptoPorProfesional.findByConceptoProfesionalAndProfesional(conceptoL, profesional)

                    if (conceptoInstanceAux == null) {
                        if (conceptoInstance.save(flush: true)) {

                        }
                    }else {

                        conceptoInstanceAux.fecha = new Date()
                        conceptoInstanceAux.montoFijo = (params['valor' + conceptoL?.id]) ? params['valor' + conceptoL?.id] as Double :0
                        conceptoInstanceAux.porcentaje = (params['porcentaje' + conceptoL?.id]) ? params['porcentaje' + conceptoL?.id] as Double:0
                        conceptoInstanceAux.porUnicaVez = (params['unicavez' + conceptoL?.id] as Boolean)? true:false
                        conceptoInstanceAux.observacion = params['observacion' + conceptoL?.id] as String
                        conceptoInstanceAux.activo = (params['activo' + conceptoL?.id] as Boolean)? true:false


                        if (conceptoInstanceAux.save(flush: true)) {


                        }

                    }


                } else {

                    def conceptoInstanceDel = ConceptoPorProfesional.findByConceptoProfesionalAndProfesional(conceptoL, profesional)

                    if (conceptoInstanceDel ) {

                        conceptoInstanceDel.delete()

                    }

                }


            }
        }

       // flash.message = "${message(code: 'default.created.message', args: [message(code: 'documentacionTipoTramite.label', default: 'DocumentacionTipoTramite')])}"
        redirect(action: "edit", controller: "profesional",params: [id: profesional?.id] )



    }

    def edit(ConceptoPorProfesional conceptoPorProfesionalInstance) {
        respond conceptoPorProfesionalInstance
    }

    @Transactional
    def update(ConceptoPorProfesional conceptoPorProfesionalInstance) {
        if (conceptoPorProfesionalInstance == null) {
            notFound()
            return
        }

        if (conceptoPorProfesionalInstance.hasErrors()) {
            respond conceptoPorProfesionalInstance.errors, view: 'edit'
            return
        }

        conceptoPorProfesionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConceptoPorProfesional.label', default: 'ConceptoPorProfesional'), conceptoPorProfesionalInstance.id])
                redirect conceptoPorProfesionalInstance
            }
            '*' { respond conceptoPorProfesionalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConceptoPorProfesional conceptoPorProfesionalInstance) {

        if (conceptoPorProfesionalInstance == null) {
            notFound()
            return
        }

        conceptoPorProfesionalInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConceptoPorProfesional.label', default: 'ConceptoPorProfesional'), conceptoPorProfesionalInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoPorProfesional.label', default: 'ConceptoPorProfesional'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def getConceptos = {

        def profesionalInstance= Profesional.read(params?.idProfesional as String)

        def conceptos= ConceptoPorProfesional.findAllByProfesional(profesionalInstance)

        render(template: 'conceptos', model: [conceptos:conceptos,profesional:profesionalInstance])
    }

}
