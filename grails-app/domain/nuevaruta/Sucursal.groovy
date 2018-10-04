package nuevaruta

class Sucursal {
    String rut, direccion, nombre, logo, region, ciudad, fono, correo, estado
    static belongsTo = [usuario:Usuario]
    static hasMany = [contrato:Contrato, vehiculo:Vehiculo]
    static constraints = {
        estado nullable: true, blank: true
        logo nullable: true, blank:true
    }
}
