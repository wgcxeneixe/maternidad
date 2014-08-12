package maternidad

class Localidad {

    String nombre
    String abreviatura
	String codigoPostal
	Boolean activo = true
	
	static belongsTo = [provincia:Provincia]

	static mapping = {
	    sort "nombre"
	}

    static constraints = {
        nombre(size:3..40,nullable: false,blank: false)
        abreviatura(size:3..10,nullable: true,blank: true)
        codigoPostal(nullable: true,blank: true)
    }

	String toString() { "${nombre} (${provincia.nombre} - ${provincia.pais.codigo})" }

}
