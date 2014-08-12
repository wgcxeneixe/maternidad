package maternidad

class EstadoCivil {

	String denominacion

	static mapping = {
	        sort "denominacion"
	}	

    static constraints = {
    }

    String toString() { "${denominacion}" }

}
