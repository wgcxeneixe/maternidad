package maternidad

class TipoDocumento {

	Boolean activo=true
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
        pais(nullable: true)
        prioridad(nullable: true)
        codigo(size:2..10, nullable:true, blank:true)
        descripcion(size:2..120, nullable:true, blank:true)

    }

    String toString() { "${nombre}"  }

}
