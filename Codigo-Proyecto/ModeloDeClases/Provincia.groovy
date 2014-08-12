package sami

import maternidad.Localidad
import maternidad.Pais

class Provincia {

	String nombre
	String abreviatura
	
	static hasMany = [localidades:Localidad]
	static belongsTo = [pais:Pais]

	static mapping = {
	    sort "nombre"
	}

    static constraints = {
        abreviatura(nullable: true)
    }

    String toString() { "${nombre} (${pais.codigo})" }	
        
}
