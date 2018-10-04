package nuevaruta

class TipoVehiculo {
    String nombre
    static hasMany = [vehiculo:Vehiculo]
    static constraints = {
    }
}
