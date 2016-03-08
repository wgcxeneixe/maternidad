package maternidad

import grails.plugin.springsecurity.annotation.Secured


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_CAJA','ROLE_FACTURACION','ROLE_LIQUIDACION','ROLE_CONVENIO','ROLE_PLANILLA','ROLE_STOCK','ROLE_GENERAL')")
class HomeController {



    def index() {}






}
