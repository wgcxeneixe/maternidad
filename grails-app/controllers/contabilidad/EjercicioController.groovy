package contabilidad

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasRole('ROLE_ADMIN')")
class EjercicioController {

    def scaffold = true
}
