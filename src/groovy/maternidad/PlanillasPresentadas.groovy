package maternidad


class PlanillasPresentadas {

    String obraSocial
    String fecha
    String cantidad
    List<LineaPlanillasPresentadas> items

    static generar(List<PlanillaInternacion> planillas){
        def planilla = new PlanillasPresentadas()
        planilla.items= new ArrayList<LineaPlanillasPresentadas>()

        planilla.obraSocial=planillas?.get(0)?.plan?.obrasocial?.toString()
        planilla.fecha=new Date().format("dd-MM-yyyy")
        planilla.cantidad=planillas?.size()

        planillas.each {

            LineaPlanillasPresentadas detalle = new LineaPlanillasPresentadas()

            detalle.fechaInternacion =(it?.fechaInternacion)?it?.fechaInternacion?.format("dd-MM-yyyy"):""
            detalle.nombreYApellido=it?.paciente?.toString()
            detalle.nroFicha=(it?.fichaAcler)?it?.fichaAcler:""
            detalle.fechaAlta=(it?.fechaAlta)? it?.fechaAlta?.format("dd-MM-yyyy"):""
            planilla.items.add(detalle)

        }

        planilla
    }


}
