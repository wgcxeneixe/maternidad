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
    }
}
