package maternidad

/**
 * Created by walter on 15/12/2015.
 */
class ReciboMaternidad {

    String fecha
    String nro
    List<LineaRecibo> items
    String total
    String profesional

    static generar(Recibo recibo){

        def reciboI = new ReciboMaternidad()
        reciboI.items= new ArrayList<LineaRecibo>()
        reciboI.fecha=recibo.fecha?.format("dd-MM-yyyy")
        reciboI.nro=recibo?.nro
        reciboI.profesional=recibo?.profesional?.toString()
        def total=Math.round(recibo?.total * 100) / 100
        reciboI.total=total

        recibo.detalle.each {

            def lineaRecibo=new LineaRecibo()
            lineaRecibo.concepto=it?.conceptoProfesional?.nombre
            lineaRecibo.debitocredito=(it.debitoCredito)?"CREDITO":"DEBITO"
            lineaRecibo.valor=it?.valor?.toString()
lineaRecibo.descripcion=(it.descripcion)?:""
            reciboI?.items?.add(lineaRecibo)

        }

      reciboI
    }


}
