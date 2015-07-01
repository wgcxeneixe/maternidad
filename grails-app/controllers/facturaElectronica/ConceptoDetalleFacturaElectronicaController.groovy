package facturaElectronica

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
class ConceptoDetalleFacturaElectronicaController {

    def scaffold = ConceptoDetalleFacturaElectronica
}
