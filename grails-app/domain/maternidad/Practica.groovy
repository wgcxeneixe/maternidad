package maternidad

class Practica {

    String nombre
    String codigo
    String observacion
    Boolean nomenclada
    Boolean modulo
    Double multiplicadorHonorario
    Double multiplicadorGasto
    ObraSocial obrasocial

    static constraints = {
        nombre(size:2..120, nullable:false, blank:false)
        codigo(size:2..10, nullable:false, blank:false)
        observacion(size:0..5000, nullable:true, blank:true)
        nomenclada(nullable:true, blank:true)
        modulo(nullable:true, blank:true)
        multiplicadorHonorario(nullable:true, blank:true)
        multiplicadorGasto(nullable:true, blank:true)
        obrasocial(nullable:true, blank:true)
    }
}
