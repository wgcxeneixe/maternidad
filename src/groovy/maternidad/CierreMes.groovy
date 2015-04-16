package maternidad

/**
 * Created by walter on 14/04/2015.
 */
class CierreMes {

    String periodo
    String fecha
    String obraSocial
    List<LineaCierre> items
    String dir

    BigDecimal totalObraSocial

    static generar (List<PlanillaInternacion> planillasInternacion,String periodo,String directorio) {

        def cierreMes = new CierreMes()

        cierreMes.fecha=new Date().format("dd-MM-yyyy")
        cierreMes.obraSocial=planillasInternacion?.first()?.plan?.obrasocial?.codigo+' - '+planillasInternacion?.first()?.plan?.obrasocial?.nombre
        cierreMes.periodo=periodo
        cierreMes.items= new ArrayList<LineaCierre>()
        cierreMes.totalObraSocial=0

        planillasInternacion.each {

            def lineaCierre= new LineaCierre()
            lineaCierre.totalDescartables=0
            lineaCierre.totalMedicamentos=0
            lineaCierre.totalFactura=0
            lineaCierre.paciente=it.paciente?.toString()
            lineaCierre.subItems=new ArrayList<SubLineaCierre>()
            it.detalles.each {
             sel ->
                def subLineaCierre = new SubLineaCierre()
                 subLineaCierre.cantidad=sel.cantidad
                 subLineaCierre.fecha=sel.fecha.format("dd-MM-yyyy")
                 subLineaCierre.prestador=sel?.profesional?.toString()

                 if(sel?.medicamento?.tipoMedicamento?.codigo=='DES'){
                     lineaCierre.totalDescartables+=Math.round(sel.valorMedicamento*sel.cantidad * 100) / 100
                     subLineaCierre.total= Math.round(sel.valorMedicamento*sel.cantidad * 100) / 100
                     subLineaCierre.gastos= Math.round(sel.valorMedicamento * 100) / 100
                     subLineaCierre.practica=sel?.medicamento?.codigo
                     subLineaCierre.honorarios=0
                     lineaCierre.totalFactura+=Math.round(sel.valorMedicamento*sel.cantidad * 100) / 100
                 }
                 else if(sel?.medicamento?.tipoMedicamento?.codigo=='MED'){
                     lineaCierre.totalMedicamentos+=Math.round(sel.valorMedicamento*sel.cantidad * 100) / 100
                     subLineaCierre.total=Math.round(sel.valorMedicamento*sel.cantidad * 100) / 100
                     subLineaCierre.gastos=Math.round(sel.valorMedicamento * 100) / 100
                     subLineaCierre.practica=sel?.medicamento?.codigo
                     subLineaCierre.honorarios=0
                     lineaCierre.totalFactura+=Math.round(sel.valorMedicamento*sel.cantidad * 100) / 100
                 }
                 else if (sel.practica){
                     subLineaCierre.gastos= Math.round(sel.valorGastos * 100) / 100
                     subLineaCierre.honorarios=  Math.round(sel.valorHonorarios * 100) / 100
                     subLineaCierre.practica=sel.practica?.codigo

                     subLineaCierre.total= Math.round(sel?.total() * 100) / 100
                     lineaCierre.totalFactura+=Math.round(sel?.total() * 100) / 100
                 }

                 lineaCierre.subItems.add(subLineaCierre)



            }
            cierreMes.totalObraSocial+=lineaCierre.totalFactura
            cierreMes.items.add(lineaCierre)

        }

cierreMes.dir=directorio
        cierreMes

    }

}
