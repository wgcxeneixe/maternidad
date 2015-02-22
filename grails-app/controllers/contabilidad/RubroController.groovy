package contabilidad

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasRole('ROLE_ADMIN')")
class RubroController {

    def scaffold = true
}
