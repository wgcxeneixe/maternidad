package maternidad

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = false)
class PracticaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Practica.list(params), model: [practicaInstanceCount: Practica.count()]
    }

    def show(Practica practicaInstance) {
        respond practicaInstance
    }

    def create() {
        respond new Practica(params)
    }

    @Transactional
    def save(Practica practicaInstance) {
        if (practicaInstance == null) {
            notFound()
            return
        }

        if (practicaInstance.hasErrors()) {
            respond practicaInstance.errors, view: 'create'
            return
        }

        practicaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'practica.label', default: 'Practica'), practicaInstance.id])
                redirect practicaInstance
            }
            '*' { respond practicaInstance, [status: CREATED] }
        }
    }

    def edit(Practica practicaInstance) {
        respond practicaInstance
    }

    @Transactional
    def update(Practica practicaInstance) {
        if (practicaInstance == null) {
            notFound()
            return
        }

        if (practicaInstance.hasErrors()) {
            respond practicaInstance.errors, view: 'edit'
            return
        }

        practicaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Practica.label', default: 'Practica'), practicaInstance.id])
                redirect practicaInstance
            }
            '*' { respond practicaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Practica practicaInstance) {

        if (practicaInstance == null) {
            notFound()
            return
        }

        practicaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Practica.label', default: 'Practica'), practicaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'practica.label', default: 'Practica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    @Transactional
    def createModulo() {

        def planConvenioInstance
        def practicaInstance
        def valorPracticaInstance= new ValorPractica()

        def loopCount


        practicaInstance= new Practica()
        practicaInstance.modulo=Boolean.TRUE
        practicaInstance.nomenclada=Boolean.FALSE



     if(params.id){

    planConvenioInstance= PlanConvenio.get(params.id )
valorPracticaInstance.planConvenio=planConvenioInstance

     }

        render(view: "createModulo", model: [practicaInstance: practicaInstance,planConvenioInstance:planConvenioInstance,valorPracticaInstance:valorPracticaInstance,loopCount:loopCount])
    }


    def saveModulo(Practica practicaInstance,ValorPractica valorPracticaInstance){

        if (practicaInstance == null) {
            notFound()
            return
        }

        if (practicaInstance.hasErrors()) {
            respond practicaInstance.errors, view: 'create'
            return
        }


        if (valorPracticaInstance == null) {
            notFound()
            return
        }

     def planConvenioInstance= PlanConvenio.read(params.planConvenio)

        practicaInstance.obrasocial=planConvenioInstance.plan.obrasocial
        practicaInstance.modulo=Boolean.TRUE
        practicaInstance.nomenclada=Boolean.FALSE
        practicaInstance.save flush: true


        valorPracticaInstance.planConvenio=planConvenioInstance
        valorPracticaInstance.plan=planConvenioInstance.plan
        valorPracticaInstance.fechaActualizado=new Date()
        valorPracticaInstance.practica=practicaInstance

        valorPracticaInstance.valorGastoModulo=(params?.valorGastoModulo)? params?.valorGastoModulo as Double : 0
        valorPracticaInstance.valorHonorarioModulo=(params?.valorHonorarioModulo)? params?.valorHonorarioModulo as Double : 0

        valorPracticaInstance.save flush: true

      /*  def listaPracticas = params.practicas as List

        for( i in listaPracticas ) {
            def practicaModulo= new PracticaModulo()
            practicaModulo.modulo=practicaInstance
            practicaModulo.practica=Practica.findById(params['practica'+i] as Long)
           practicaModulo.valorEspecialista =(params['valorEspecialista'+i])?params['valorEspecialista'+i] as Double:null
           practicaModulo.valorAyudante =(params['valorAyudante'+i])?params['valorAyudante'+i] as Double:null
            practicaModulo.valorAnestecista=(params['valorAnestesista'+i])?params['valorAnestesista'+i] as Double:null
            practicaModulo.valorGasto=(params['valorGasto'+i])?params['valorGasto'+i] as Double:null
            practicaModulo.save()
        }
*/

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'practica.label', default: 'Módulo'), practicaInstance.id])
                redirect(controller:'convenio',  action: "editPlan" , params: [id:planConvenioInstance?.id])
            }
            '*' { respond practicaInstance, [status: CREATED] }
        }

    }

    def renderizar={

     def loop = params.loop
      render(template: "practicaModulo" ,model: [loopCount: loop ] )

    }


def verModulos = {

  def planConvenioAux=PlanConvenio.get(params.id)



    def c = ValorPractica.createCriteria().list {  planConvenio{eq('id',planConvenioAux.id)}
        practica{eq('modulo',true)}}
    def valores = c.list {
        planConvenio{eq('id',planConvenioAux.id)}
        practica{eq('modulo',true)}


    }

return [valores:valores]


}

   def showModulo={

   def valorPractica= ValorPractica.get( params.id)

       return [practicaInstance:valorPractica.practica,valorPracticaInstance: valorPractica]

   }


    @Transactional
    def editModulo() {
        def loopCount
def practicaInstance
def valorPracticaInstance

        if(params.id && params.valorPractica){

          practicaInstance=  Practica.get(params.id)
        valorPracticaInstance= ValorPractica.findById(params.valorPractica)
        }

        render(view: "editModulo", model: [practicaInstance: practicaInstance,planConvenioInstance:valorPracticaInstance?.planConvenio,valorPracticaInstance:valorPracticaInstance,loopCount:loopCount])




    }




    def updateModulo(Practica practicaInstance){

        if (practicaInstance == null) {
            notFound()
            return
        }

        if (practicaInstance.hasErrors()) {
            respond practicaInstance.errors, view: 'create'
            return
        }


       /* if (valorPracticaInstance == null) {
            notFound()
            return
        }
*/
        practicaInstance.save flush: true

def valorPracticaInstance=ValorPractica.findById(params.valorPractica)

        valorPracticaInstance.fechaActualizado=new Date()
        valorPracticaInstance.valorGastoModulo=(params.valorGastoModulo)?params.valorGastoModulo as Double:null
        valorPracticaInstance.valorHonorarioModulo=(params.valorHonorarioModulo)?params.valorHonorarioModulo as Double:null

        valorPracticaInstance.save flush: true

/*

        def listaPracticasExistentes = params.practicasDelModulo as List

        for( i in listaPracticasExistentes ) {
            def practicaModulo= PracticaModulo.findById(i)

            practicaModulo.practica=Practica.findById(params['practica'+i] as Long)
            practicaModulo.valorEspecialista =(params['valorEspecialista'+i])?params['valorEspecialista'+i] as Double:null
            practicaModulo.valorAyudante =(params['valorAyudante'+i])?params['valorAyudante'+i] as Double:null
            practicaModulo.valorAnestecista=(params['valorAnestesista'+i])?params['valorAnestesista'+i] as Double:null
            practicaModulo.valorGasto=(params['valorGasto'+i])?params['valorGasto'+i] as Double:null
            practicaModulo.save()
        }



        def listaPracticas = params.practicas as List

        for( i in listaPracticas ) {
            def practicaModulo= new PracticaModulo()
            practicaModulo.modulo=practicaInstance
            practicaModulo.practica=Practica.findById(params['practica'+i] as Long)
            practicaModulo.valorEspecialista =(params['valorEspecialista'+i])?params['valorEspecialista'+i] as Double:null
            practicaModulo.valorAyudante =(params['valorAyudante'+i])?params['valorAyudante'+i] as Double:null
            practicaModulo.valorAnestecista=(params['valorAnestesista'+i])?params['valorAnestesista'+i] as Double:null
            practicaModulo.valorGasto=(params['valorGasto'+i])?params['valorGasto'+i] as Double:null
            practicaModulo.save()
        }

*/

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'practica.label', default: 'Módulo'), practicaInstance.id])
                redirect(controller:'convenio',  action: "editPlan" , params: [id:valorPracticaInstance?.planConvenio?.id])
            }
            '*' { respond practicaInstance, [status: CREATED] }
        }

    }




    def nomenclador = {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        def query = {

            eq("nomenclada",Boolean.TRUE)

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

        def criteria = Practica.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def practicas = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [codigo:params.codigo,nombre:params.nombre]

        def model = [practicaInstanceList: practicas, practicaInstanceTotal:practicas.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "grilla", model: model)
        }
        else {
            model
        }
    }


    def editNomenclada(Practica practicaInstance) {
        respond practicaInstance
    }


    @Transactional
    def updateNomenclada(Practica practicaInstance) {
        if (practicaInstance == null) {
            notFound()
            return
        }

        if (practicaInstance.hasErrors()) {
            respond practicaInstance.errors, view: 'editNomenclada'
            return
        }

        practicaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Practica.label', default: 'Practica'), practicaInstance.id])
                redirect controller: 'practica', action: "nomenclador"
            }
            '*' { respond practicaInstance, [status: OK] }
        }
    }


    def showNomenclada(Practica practicaInstance) {
        respond practicaInstance
    }


}
