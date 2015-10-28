package maternidad

import grails.transaction.Transactional

@Transactional
class FacturacionService {

    static transactional = true
    def springSecurityService

    def cerrar(String periodo,String directorio){


        def estado = EstadoPlanilla.findByCodigo("PRE")
        try {
            def data = []
            def d
            def planillasss
            def os = ObraSocial.list()
            os.planes.each {
                def Plan planid = it?.first()

                planillasss = PlanillaInternacion.findAllByPlanAndEstadoPlanilla(planid, estado)
                def listaFacturas = []
                planillasss?.each { PlanillaInternacion planilla ->
                    listaFacturas += facturarPlanilla(planilla,periodo)
                }
                if(listaFacturas?.size()>0){
                    FacturaPeriodo facturaPeriodo = new FacturaPeriodo()
                    facturaPeriodo.facturas =  listaFacturas
                    facturaPeriodo.plan = planid
                    facturaPeriodo.periodo = periodo
                    facturaPeriodo.fecha = new Date()
                    facturaPeriodo.save(flush: true)

                    d = CierreMes.generar(planillasss, periodo, directorio)

                    data.add(d)

                }
            }

         return data

        } catch (Exception ex) {
            ex
        }


    }


    private Factura facturarPlanilla(PlanillaInternacion planilla, String periodo){
        planilla.estadoPlanilla = EstadoPlanilla.findByCodigo('CER')
       // planilla.save(flush: true)

        Factura factura = new Factura()

        factura.fecha = new Date()
        factura.periodo = periodo

        def maxNroFactura=  Factura.createCriteria().get {
            projections {
                max "nrofactura"
            }
        } as Long

        factura.nrofactura= (maxNroFactura)?maxNroFactura+1:0


        factura.planillaInternacion=planilla

        try{
            factura.save(flush: true,validate: true,insert: true)
        }
        catch(Exception ex) {
            ex
        }

        //Movimiento Planilla
        def usuario = springSecurityService.currentUser
        def movimiento = new MovimientoPlanilla()
        movimiento.estadoPlanilla = planilla.estadoPlanilla
        movimiento.fecha = new Date()
        movimiento.planillaInternacion = planilla
        movimiento.usuario = usuario as Usuario
        movimiento.save(flush: true)

        //Cuenta corriente
        def movimientoPlan = new MovimientoPlan()
        def conceptoMovimiento=ConceptoPlan.findByCodigo("FACP")
        movimientoPlan.conceptoPlan=conceptoMovimiento
        movimientoPlan.credito=false
        movimientoPlan.fecha=new Date()
        movimientoPlan.monto=factura?.totalFacturado
        movimientoPlan.plan=planilla?.plan
        movimientoPlan.save(flush: true)

        return factura
    }


    def imprimirPeriodo(String periodo,String directorio){



        try {
            def data = []
            def d
            def planillasss
            def os = ObraSocial.list()
            os.planes.each {
                def Plan planid = it?.first()
planillasss=Factura.findAllByPeriodoAndPlan(periodo,planid)?.planillaInternacion


                if(planillasss?.size()>0){

                    d = CierreMes.generar(planillasss, periodo, directorio)

                    data.add(d)

                }
            }

            return data

        } catch (Exception ex) {
            ex
        }


    }



}
