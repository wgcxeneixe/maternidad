package maternidad

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasAnyRole('ROLE_ADMIN')")
class EstadoPlanillaController {

    static scaffold = true
}
