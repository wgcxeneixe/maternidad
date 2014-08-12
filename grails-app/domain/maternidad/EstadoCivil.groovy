package maternidad

class EstadoCivil {

	String denominacion

	static mapping = {
	        sort "denominacion"
	}	

    static constraints = {
        denominacion(nullable: false,blank: false,matches: "[a-zA-Z]+")
    }

    String toString() { "${denominacion}" }

}
