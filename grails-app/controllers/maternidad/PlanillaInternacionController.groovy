package maternidad

import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
@Transactional(readOnly = true)

class PlanillaInternacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def jasperService
    def springSecurityService

    /*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PlanillaInternacion.list(params), model:[planillaInternacionInstanceCount: PlanillaInternacion.count()]
    }
*/

    def index = {

        /*  if (!springSecurityService.isLoggedIn()){
              redirect(controller: 'login', action: "auth")
          }
  */
        def query = {
            if (params.dni) {
                paciente{
                    eq('nroDocumento', params.dni as Long)
                }

            }
            if (params.nroplanilla) {
               eq('id',  params.nroplanilla as Long)
            }

            if (params.nombre) {

              or{
                  paciente{ilike('nombre', '%' + params.nombre + '%')}
                  paciente{ilike('apellido', '%' + params.nombre + '%')}
              }


            }

            if (params?.estado) {
               estadoPlanilla{ eq('id',  params.estado as Long)}
            }

            if (params.sort){
                order(params.sort,params.order)
            }
        }

        def criteria = PlanillaInternacion.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def planillas = criteria.list(query, max: params.max, offset: params.offset)
        def filters = [dni: params.dni,nroplanilla:params.nroplanilla,nombre:params.nombre,estado:params.estado]

        def model = [planillaInternacionInstanceList: planillas, planillaInternacionInstanceCount:planillas.totalCount, filters: filters]

        if (request.xhr) {
            // ajax request
            render(template: "lista", model: model)
        }
        else {
            model
        }
    }


    def show(PlanillaInternacion planillaInternacionInstance) {
        respond planillaInternacionInstance
    }

    def create() {
        def persona = Persona.findById(params?.id as long)
        if(persona == null){
            redirect action: "createconpaciente", method: "GET"
        }else
        {
            def planillaInternacion = new PlanillaInternacion(params)
            planillaInternacion.paciente = persona
            respond planillaInternacion
        }
    }

    def createconpaciente() {
        def persona = new Persona()
        persona.nroDocumento = params?.nrodocumento as long
        persona.tipoDocumento= TipoDocumento.findByNombre("DNI")
        persona.personaFisica = true

        render(view: "createconpaciente", model: [planillaInternacionInstance: new PlanillaInternacion(),personaInstance:persona])
        //respond  new PlanillaInternacion(params), model:[persona: Persona]
    }

    @Transactional
    def save(PlanillaInternacion planillaInternacionInstance) {
        if (planillaInternacionInstance == null) {
            notFound()
            return
        }

        if (planillaInternacionInstance.hasErrors()) {
            respond planillaInternacionInstance.errors, view:'create'
            return
        }


        def estadoPlanilla = EstadoPlanilla.findByNombre("INICIADA")

        planillaInternacionInstance.estadoPlanilla=estadoPlanilla

        planillaInternacionInstance.save flush:true

        if(estadoPlanilla){

            def usuario = springSecurityService.currentUser
            def movimiento= new  MovimientoPlanilla()
            movimiento.estadoPlanilla=estadoPlanilla
            movimiento.fecha=new Date()
            movimiento.planillaInternacion=planillaInternacionInstance
            movimiento.usuario=usuario as Usuario
            movimiento.save(flush:true)
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'planillaInternacion.label', default: 'Planilla internación'), planillaInternacionInstance.id])
                redirect planillaInternacionInstance
            }
            '*' { respond planillaInternacionInstance, [status: CREATED] }
        }
    }

    @Transactional
    def saveconpersona(PlanillaInternacion planillaInternacionInstance,Persona personaInstance) {
        if (planillaInternacionInstance == null) {
            notFound()
            return
        }

        if (personaInstance == null) {
            notFound()
            return
        }

        if (personaInstance.hasErrors()) {
            respond personaInstance.errors, view: 'createconpaciente'
            return
        }

        personaInstance.save flush: true
        planillaInternacionInstance.paciente=personaInstance

        if (planillaInternacionInstance.hasErrors()) {
            respond planillaInternacionInstance.errors, view: 'createconpaciente'
            return
        }


        def estadoPlanilla = EstadoPlanilla.findByNombre("INICIADA")

        planillaInternacionInstance.estadoPlanilla=estadoPlanilla

        planillaInternacionInstance.save flush:true

        if(estadoPlanilla){

            def usuario = springSecurityService.currentUser
            def movimiento= new  MovimientoPlanilla()
            movimiento.estadoPlanilla=estadoPlanilla
            movimiento.fecha=new Date()
            movimiento.planillaInternacion=planillaInternacionInstance
            movimiento.usuario=usuario as Usuario
            movimiento.save(flush:true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'planillaInternacion.label', default: 'Planilla internación'), planillaInternacionInstance.id])
                //redirect action:'index'
                //redirect planillaInternacionInstance
                redirect(action: "index")
            }
            '*' { respond planillaInternacionInstance, [status: CREATED],view:'index' }
        }
    }


    def edit(PlanillaInternacion planillaInternacionInstance) {
        respond planillaInternacionInstance

    }

    @Transactional
    def update(PlanillaInternacion planillaInternacionInstance) {
        if (planillaInternacionInstance == null) {
            notFound()
            return
        }

        if (planillaInternacionInstance.hasErrors()) {
            respond planillaInternacionInstance.errors, view:'edit'
            return
        }

        planillaInternacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PlanillaInternacion.label', default: 'PlanillaInternacion'), planillaInternacionInstance.id])
                //redirect planillaInternacionInstance
                redirect(action: "index")
            }
            '*'{ respond planillaInternacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PlanillaInternacion planillaInternacionInstance) {

        if (planillaInternacionInstance == null) {
            notFound()
            return
        }

        planillaInternacionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PlanillaInternacion.label', default: 'PlanillaInternacion'), planillaInternacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def buscapaciente() {
        return
    }

    def derivarpaciente={
        if(params?.paciente == "" || params?.paciente== null){
            redirect action: "buscapaciente", method: "GET"
            return
        }
        def persona = Persona.findByNroDocumento(params?.paciente as long)
        if(persona == null){
            forward(action: "createconpaciente", params: [nrodocumento: params?.paciente])
            //forward(["nrodocumento":params?.paciente])
            //redirect action: "createconpaciente", method: "POST"
            //redirect action: "createconpaciente", method: "POST", params: ["nrodocumento":params?.paciente]
        }
        else
        {
            redirect action: "create", method: "GET", id: persona?.id
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'planillaInternacion.label', default: 'PlanillaInternacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }



    // ***************************
    // Imprimir orden Internacion
    // ***************************
    def imprimirOrden = {
        def planillaInstance = PlanillaInternacion.get(params.id)
        if(!planillaInstance){
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'permiso.label', default: 'Planilla'), params.id])}"
            redirect(action: "index")
        }else{

            def data = OrdenInternacion.generar(planillaInstance)

            generarPDF('ordenInternacion.jasper', "Orden", [data], 'orden-' + planillaInstance?.id)

          //  redirect(action: "show", id: planillaInstance.id)

        }
    }


    // ***************************
    // Imprimir Detalle Valorizado
    // ***************************
    def imprimirDetalle = {
        def planillaInstance = PlanillaInternacion.get(params.id)
        if(!planillaInstance){
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'permiso.label', default: 'Planilla'), params.id])}"
            redirect(action: "index")
        }else{

         try{   def data = DetalleValorizado.generar(planillaInstance)

            generarPDF('detalleValorizado.jasper', "Detalle", [data], 'detalle-' + planillaInstance?.id)
         }catch(Exception ex){
             ex
         }

         //si la planilla tiene el estado en proceso entonces cambiarla a impresa

            if (planillaInstance.estadoPlanilla.codigo=="EPR" || planillaInstance.estadoPlanilla.codigo=="INI" ){

                def estadoPlanilla = EstadoPlanilla.findByCodigo("IMP")

                def usuario = springSecurityService.currentUser
                def movimiento= new  MovimientoPlanilla()
                movimiento.estadoPlanilla=estadoPlanilla
                movimiento.fecha=new Date()
                movimiento.planillaInternacion=planillaInstance
                movimiento.usuario=usuario as Usuario
                movimiento.save(flush:true)


                planillaInstance.estadoPlanilla=estadoPlanilla

                planillaInstance.save flush:true


            }



          //  redirect(action: "show", id: planillaInstance.id)

        }
    }


    def imprimirDetalleMedicamento = {

        def planillaInstance = PlanillaInternacion.get(params.id)
        if (!planillaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'permiso.label', default: 'Planilla'), params.id])}"
            redirect(action: "index")
        } else {

            try {
                def data = FacturaMedicamentos.generar(planillaInstance)

                generarPDF('FacturacionMedicamentos.jasper', "Detalle Medicamento", [data], 'detalleMedicamentos-' + planillaInstance?.id)
            } catch (Exception ex) {
                ex
            }


        }
    }


    // ***************************
    // Generar PDF para impresion
    // ***************************
    def private generarPDF(reporte, titulo, data, nombre){
        //Seteamos los directorios de los subreportes y las imagenes
        def params = [:]

        params.SUBREPORT_DIR = servletContext.getRealPath('/reports') + "/"
        // Definimos el reporte
        def reportDef = new JasperReportDef(name: reporte,
                fileFormat: JasperExportFormat.PDF_FORMAT,
                reportData: data,
                parameters: params
        )

        // Establecemos un nombre de archivo único...
        response.setHeader("Content-disposition", "attachment; filename=\"${nombre}.pdf\"");
        // Establecemos el tipo de archivo a PDF...
        response.contentType = "application/pdf"
        // Enviamos el contenido del PDF
        response.outputStream << jasperService.generateReport(reportDef).toByteArray()

    }


    def facturarSeleccionadas={

        def seleccionados=params?.list("facturar")

        seleccionados.each {
sel ->
           def planilla=PlanillaInternacion.findById(sel as Integer)
           def estado=EstadoPlanilla.findByCodigo("AFA")

           planilla.estadoPlanilla=estado
           planilla.save(flush: true)


            def usuario = springSecurityService.currentUser
            def movimiento= new  MovimientoPlanilla()
            movimiento.estadoPlanilla=estado
            movimiento.fecha=new Date()
            movimiento.planillaInternacion=planilla
            movimiento.usuario=usuario as Usuario
            movimiento.save(flush:true)

        }


        redirect(action: "index")

    }


    def presentarSeleccionadas={

        def seleccionados=params?.list("facturar")

        seleccionados.each {
            sel ->
                def planilla=PlanillaInternacion.findById(sel as Integer)
                def estado=EstadoPlanilla.findByCodigo("PRE")

                planilla.estadoPlanilla=estado
                planilla.save(flush: true)


                def usuario = springSecurityService.currentUser
                def movimiento= new  MovimientoPlanilla()
                movimiento.estadoPlanilla=estado
                movimiento.fecha=new Date()
                movimiento.planillaInternacion=planilla
                movimiento.usuario=usuario as Usuario
                movimiento.save(flush:true)

        }


        redirect(action: "index")

    }


    def facturar={


        def planillas = params.list("planilla")
        def periodo = (params?.periodo)?:  "" + new Date().getAt(Calendar.MONTH) + "/" + new Date().getAt(Calendar.YEAR)


        planillas.each {

            sel ->
                def planilla = PlanillaInternacion.findById(sel as Integer)
                def estadoFacturada = EstadoPlanilla.findByCodigo("FAC")
                def estadoAprobacion = EstadoPlanilla.findByCodigo("PEN")

                // si no tiene ente -> factura
                if (!planilla.plan.obrasocial.enteReceptor) {
                    //facturar


                    planilla.estadoPlanilla = estadoFacturada
                    planilla.save(flush: true)

                    def usuario = springSecurityService.currentUser
                    def movimiento = new MovimientoPlanilla()
                    movimiento.estadoPlanilla = estadoFacturada
                    movimiento.fecha = new Date()
                    movimiento.planillaInternacion = planilla
                    movimiento.usuario = usuario as Usuario
                    movimiento.save(flush: true)


                    Factura factura = new Factura()



                    factura.fecha = new Date()
                    factura.periodo = periodo

                    def maxNroFactura=  Factura.createCriteria().get {
                        projections {
                            max "nrofactura"
                        }
                    } as Long

                    factura.nrofactura= (maxNroFactura)?maxNroFactura+1:0

                    try{

                        factura.planillaInternacion=planilla

                        /* planilla.detalles.each { d->

                            factura.detallesFactura.add(d)
                        }
*/

                        factura.save(flush: true,validate: false)


                    }catch (Exception ex){
                        ex
                    }


                }
                //sino si tiene ente y pide aprobacion -> marca con aprobacion
                else if (planilla.plan.obrasocial.enteReceptor.pidePreAprobacion) {

                    planilla.estadoPlanilla = estadoAprobacion
                    planilla.save(flush: true)

                    def usuario = springSecurityService.currentUser
                    def movimiento = new MovimientoPlanilla()
                    movimiento.estadoPlanilla = estadoAprobacion
                    movimiento.fecha = new Date()
                    movimiento.planillaInternacion = planilla
                    movimiento.usuario = usuario as Usuario
                    movimiento.save(flush: true)

                } else if (!planilla.plan.obrasocial.enteReceptor.pidePreAprobacion) {


                    planilla.estadoPlanilla = estadoFacturada
                    planilla.save(flush: true)

                    def usuario = springSecurityService.currentUser
                    def movimiento = new MovimientoPlanilla()
                    movimiento.estadoPlanilla = estadoFacturada
                    movimiento.fecha = new Date()
                    movimiento.planillaInternacion = planilla
                    movimiento.usuario = usuario as Usuario
                    movimiento.save(flush: true)

                    Factura factura = new Factura()



                    factura.fecha = new Date()
                    factura.periodo = periodo

                    def maxNroFactura=  Factura.createCriteria().get {
                        projections {
                            max "nrofactura"
                        }
                    } as Long

                    factura.nrofactura= (maxNroFactura)?maxNroFactura+1:0

                    try{

                        factura.planillaInternacion= planilla

                     /*   planilla.detalles.each { d->

                            factura.detallesFactura.add(d)
                        }
*/

                        factura.save(flush: true,validate: false)


                    }catch (Exception ex){
                        ex
                    }




                }




                redirect(controller: "factura",action: "index")
        }

    }

   def asociarProfesional ={

       def planilla=PlanillaInternacion.get(params.id)

       render(view: "asociarProfesional", model: [planillaInternacionInstance: planilla])


   }


    def saveAsociacionProfesional={

        def planilla=PlanillaInternacion.get(params.planillaInternacion.id)
        def profesional=Profesional.get(params.profesional.id)

        if (!planilla.profesionales.contains(profesional)){
            planilla.profesionales.add(profesional)
        }
        else {

        flash.message="Ya está asociado el Profesional"
        }

        planilla.save(flush: true)

        render(view: "asociarProfesional", model: [planillaInternacionInstance: planilla])

    }

}
