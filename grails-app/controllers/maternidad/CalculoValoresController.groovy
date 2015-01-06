package maternidad

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
}
