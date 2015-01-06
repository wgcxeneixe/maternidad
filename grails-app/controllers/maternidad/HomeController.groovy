package maternidad

import grails.plugin.springsecurity.annotation.Secured


@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
class HomeController {

    def pdfRenderingService


    def index() {}


/*
    def renderBoleta ={
       // def tijera = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/tijera45px.png"))
        //def formInstance = Profile.get(params.id)
        def args = [template:"/home/boleta",filename:"boleta"]
        pdfRenderingService.render(args+[controller:this],response)
    }
*/




}
