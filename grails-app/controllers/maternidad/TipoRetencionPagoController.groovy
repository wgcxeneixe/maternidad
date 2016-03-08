package maternidad

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_GENERAL')")
class TipoRetencionPagoController {

    static scaffold = true
}
