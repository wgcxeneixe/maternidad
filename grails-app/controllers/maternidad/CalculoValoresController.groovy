package maternidad

import grails.plugin.springsecurity.annotation.Secured


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
class CalculoValoresController {

    def index() {}


    def calculo(Plan plan,Integer funcion,Practica practica){
      /*  10 - honorarios
        20- ayudante
        30-anestecista
        60 - gasto
        70 - gasto y honorarios
        91 - libre carga valor honorario a mano */

//10
      ValorUnidadHonorario.findAllByPractica(practica)



    }

def calcularValores={

  def planConvenio=  PlanConvenio.get(params.id)
  def practicasNomencladas= Practica.findAllByNomenclada(Boolean.TRUE)
  def modulos=ValorPractica.withCriteria {
        eq("planConvenio",planConvenio)
        practica{ eq("modulo",Boolean.TRUE)}
    }?.practica
  def practicasModulos=  PracticaModulo.findAllByModuloInList(modulos)?.practica?.id
    def valores= new ArrayList()
  // valores practicas que no se pueden pisar
    valores= ValorPractica.findAllByPlanConvenioAndPisar(planConvenio,Boolean.FALSE)?.practica?.id
   // practicas nomencladas que se pueden actualizar
    def practicasNomencladaspisar= Practica.findAllByNomencladaAndIdNotInList(Boolean.TRUE,valores)
   // valores practicas de nomencladas no relacionadas con modulos
    def valoresPracticas=ValorPractica.withCriteria {
  eq("planConvenio",planConvenio)
  practica{ eq("nomenclada",Boolean.TRUE)
      if(practicasModulos){
          not{ 'in'("id",practicasModulos)}
      }
  }

  }

def valorPractica

practicasNomencladaspisar.each {

 def valorGasto=   calcularValorGasto(it,planConvenio)
 def valorHonorario= calcularValorHonorario(it,planConvenio)

  if(valoresPracticas.practica.contains(it)) {

  valorPractica=valoresPracticas.find {it?.practica==it}
  valorPractica.fechaActualizado= new Date()
      valorPractica.valorGasto=valorGasto
      valorPractica.valorAnestecista=valorHonorario.get(0)
      valorPractica.valorAyudante=valorHonorario.get(1)
      valorPractica.valorEspecialista=valorHonorario.get(2)
      valorPractica.save(flush: true)

  } else {
  valorPractica= new ValorPractica()
  valorPractica.practica=it
  valorPractica.fechaActualizado= new Date()
      valorPractica.planConvenio=planConvenio
      valorPractica.plan=planConvenio.plan
      valorPractica.valorAnestecista=valorHonorario.get(0)
      valorPractica.valorAyudante=valorHonorario.get(1)
      valorPractica.valorEspecialista=valorHonorario.get(2)
     // valorPractica.valorHonorario=valorPractica.valorAnestecista+valorPractica.valorAyudante+ valorPractica.valorEspecialista
      valorPractica.valorGasto=valorGasto
  valorPractica.save(flush: true)
  }

}

    redirect(controller:"convenio",action: "editPlan",params: [id:planConvenio?.id])


}


    def calcularValorGasto(Practica practica , PlanConvenio planconvenio){

        def sum=0
        //obtener valores unidad gasto de la practica
     def  valoresGasto= ValorUnidadGasto.findAllByPractica(practica)
     //para cada uno encontrar el valor galeno y multiplicar
     valoresGasto.each {
         def valorGalenoGasto=ValorGalenoGasto.findByTipoGastoAndPlanConvenio(it.tipoGasto,planconvenio)
         def calculo=0
         if (valorGalenoGasto){
         // si existe calculo el valor gasto resultante
         calculo= valorGalenoGasto.valor * it.valor * practica.multiplicadorGasto
         }

        sum+=calculo
     }

        return sum

    }



    def calcularValorHonorario (Practica practica,PlanConvenio planConvenio){

        def lista=[]
        def valorEspecialista=0
        def valorAnestesista=0
        def valorAyudante=0

    //obtener Componentes del tipohonorario
        def componentes=  ComponenteTipoHonorario.findAllByTipoHonorario(practica?.tipoHonorario).componente

    // obtener valorGalenoHonorario
        def valorGalenohonorario=ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio,practica?.tipoHonorario)

        componentes.each {
            // valor ayudante
            if (it?.id==1){
              def valorunidad= ValorUnidadHonorario.findByComponenteAndPractica(it,practica)

            valorAyudante=valorunidad?.valor * valorGalenohonorario?.valor * practica.multiplicadorHonorario

           }

            // valor anestesista
            if (it?.id==2){
                def valorunidad= ValorUnidadHonorario.findByComponenteAndPractica(it,practica)

                valorAnestesista=valorunidad?.valor * valorGalenohonorario?.valor * practica.multiplicadorHonorario
            }


            // valor especialista
            if (it?.id==3){
                def valorunidad= ValorUnidadHonorario.findByComponenteAndPractica(it,practica)

                valorEspecialista=valorunidad?.valor * valorGalenohonorario?.valor * practica.multiplicadorHonorario
            }

        }

lista=[valorAyudante,valorAnestesista,valorEspecialista]

        return lista
    }




}
