package facturaElectronica

class FacturaElectronica {
    Long cuit
    String razonSocial
    Boolean personaFisica
    String direccion
    String localidad
    Integer codigoPostal
    String provincia
    TipoFactura tipoFactura
    Float totalNeto
    Float totalIva
    Float total
    String cae
    Date fecha
    Integer puntoVenta
    Integer numeroFactura

    Set<DetalleFacturaElectronica> detalles = []

    static constraints = {
        tipoFactura(nullable: false)
        total(nullable: false, validator: totalValidator)
    }


    static def totalValidator = {
        val, FacturaElectronica obj ->
            if (val > 0) {
                obj.totalNeto = val / 1.21
                obj.totalNeto = obj.totalNeto.round(2)
                obj.totalIva = val - obj.totalNeto
                obj.totalIva = obj.totalIva.round(2)
                true
            } else {
                false
            }
    }

}
