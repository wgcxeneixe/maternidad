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
    def practicasNomencladasp= Practica.findAllByNomencladaAndIdNotInList(Boolean.TRUE,valores)
   // valores practicas de nomencladas
    def valoresPracticas=ValorPractica.withCriteria {
  eq("planConvenio",planConvenio)
  practica{ eq("nomenclada",Boolean.TRUE)
      if(practicasModulos){
          not{ 'in'("id",practicasModulos)}
      }
  }

  }


valoresPracticas

practicasNomencladasp.each {


}


}


}
