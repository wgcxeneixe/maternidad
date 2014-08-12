package maternidad

class TipoDocumento {

	Boolean activo
	String codigo
	String nombre
	String descripcion
	String entidadEmisora
	String aclaracion
	Pais pais
	Integer prioridad

	static mapping = {
	    sort "prioridad"
	}

    static constraints = {
        entidadEmisora(nullable: true)
        aclaracion(nullable: true)
    }

    String toString() { "${nombre} (${pais.codigo})" }

}
