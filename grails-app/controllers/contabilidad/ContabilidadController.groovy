package contabilidad

import grails.plugin.springsecurity.annotation.Secured

class ContabilidadController {
    @Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    def diario() {
        println "diario"
        def fechaHasta = params?.fechaHasta
        def fechaDesde = params?.fechaDesde
        def asientoInstanceList = []

//        if (params?.fechaDesde?.size() == 10) fechaDesde = new Date().parse("dd/MM/yyyy", params.fechaDesde as String)
//        if (params?.fechaHasta?.size() == 10) fechaHasta = new Date().parse("dd/MM/yyyy", params.fechaHasta as String)

        if (fechaHasta && fechaDesde && fechaHasta >= fechaDesde) {
            asientoInstanceList = Asiento.findAllByFechaBetween(fechaDesde, fechaHasta)
        } else {
            flash.errors = "El rango de búsqueda no es válido"
        }
        return [fechaHasta: fechaHasta, fechaDesde: fechaDesde, asientoInstanceList: asientoInstanceList]
    }

    def consultar = {
        println "consultar"
        def fechaHasta = params?.fechaHasta
        def fechaDesde = params?.fechaDesde
        def asientoInstanceList = []

//        if (params?.fechaDesde?.size() == 10) fechaDesde = new Date().parse("dd/MM/yyyy", params.fechaDesde as String)
//        if (params?.fechaHasta?.size() == 10) fechaHasta = new Date().parse("dd/MM/yyyy", params.fechaHasta as String)

        if (fechaHasta && fechaDesde && fechaHasta >= fechaDesde) {
            asientoInstanceList = Asiento.findAllByFechaBetween(fechaDesde, fechaHasta)
        } else {
            flash.errors = "El rango de búsqueda no es válido"
        }
        render(view: diario(), params:[fechaHasta: fechaHasta, fechaDesde: fechaDesde, asientoInstanceList: asientoInstanceList])
    }
}
