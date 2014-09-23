package maternidad

import grails.plugin.springsecurity.annotation.Secured

class HomeController {


    @Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    def index() {}
}
