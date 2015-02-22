package contabilidad

import grails.plugin.springsecurity.annotation.Secured

import grails.transaction.Transactional

@Secured("hasRole('ROLE_ADMIN')")
@Transactional(readOnly = true)
class AsientoController {

    def scaffold = true
}
