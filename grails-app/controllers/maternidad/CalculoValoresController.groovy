package maternidad

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


@Secured("hasAnyRole('ROLE_ADMIN')")
class CalculoValoresController {

    def index() {}
    def CalculoValoresService


    def calcularValores = {

      def responseData=  CalculoValoresService.calcular(params?.id as Integer)

        render responseData as JSON

    }



}
