package sami

import maternidad.Provincia

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
        abreviatura(nullable: true)
        codigoPostal(nullable: true)
    }

	String toString() { "${nombre} (${provincia.nombre} - ${provincia.pais.codigo})" }

}
