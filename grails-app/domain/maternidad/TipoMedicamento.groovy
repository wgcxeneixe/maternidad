package maternidad

class TipoMedicamento {
    String codigo
    String descripcion

    static constraints = {

    }

    String toString() { "${descripcion}" }
}
