package maternidad


class PlanillasSinPresentar {

    String fecha
    List<LineaPlanillaSinPresentar> items

    static generar(List<PlanillaInternacion> planillas){
        def planilla = new PlanillasSinPresentar()
        planilla.items= new ArrayList<LineaPlanillaSinPresentar>()

        planilla.fecha=new Date().format("dd-MM-yyyy")

        planillas.each {

                LineaPlanillaSinPresentar detalle = new LineaPlanillaSinPresentar()

                detalle.fechaInternacion = it?.fechaInternacion?.format("dd-MM-yyyy")
                detalle.paciente=it?.paciente?.toString()
                detalle.nroInternacion=it?.numeroIngreso
                detalle.obraSocial=it?.plan?.obrasocial?.toString()
                planilla.items.add(detalle)

        }

        planilla
    }


}
