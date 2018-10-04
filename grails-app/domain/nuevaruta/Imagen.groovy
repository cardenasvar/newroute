package nuevaruta

class Imagen {
    String ruta
    static belongsTo = [vehiculo:Vehiculo]
    static constraints = {
    }
}
