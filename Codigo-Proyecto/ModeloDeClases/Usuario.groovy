package sami

import maternidad.Persona
import maternidad.Rol
import maternidad.UsuarioRol

class Usuario {
    transient springSecurityService

    String username
    String password
    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false

    Persona persona


    static constraints = {
        username blank: false, unique: true
        password blank: false

    }


    static mapping = {
        password column: '`password`'
    }

    String toString() { "${username}" }

    Set<Rol> getAuthorities() {
        UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
    }

    def beforeInsert() {
        encodePassword()

    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }


}
