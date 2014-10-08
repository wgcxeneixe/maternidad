package maternidad

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
class TipoRetencionPagoController {

    static scaffold = true
}
