package sami

class Pais {

	String codigo
	String nombre
	String abreviatura
	String gentilicio
	
	Boolean frecuente = true

	static hasMany = [provincias:Provincia]

    static constraints = {
        abreviatura(nullable: true)
    }

    static listar() {
    	Pais.withCriteria(){
    		and {
    		    order("frecuente", "desc")
    			order("nombre", "asc")
    		}    		
    	}
    }

	String toString() { "${nombre}" }

}
