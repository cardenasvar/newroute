package nuevaruta

class Usuario {
    String rut, nombres, paterno, materno, telefono, correo, tipo, estado, clave
    Date fechaCreacion, fechaNacimiento
    static hasMany = [sucursal:Sucursal]
    static constraints = {
        fechaCreacion nullable: true, blank:true
        fechaNacimiento nullable: true, blank:true
        estado nullable: true, blank: true
    }
}
