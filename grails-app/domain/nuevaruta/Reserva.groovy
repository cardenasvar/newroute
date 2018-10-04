package nuevaruta

import java.sql.Time

class Reserva {

    Date fechaCreacion=new Date()
    String fechaRetiro, fechaDevolucion, estado
    Integer precioVehiculo, monto
    String horaRetiro, horaDevolucion
    static belongsTo = [vehiculo:Vehiculo, cliente:Cliente]
    static hasMany = [pago:Pago]
    static constraints = {
        estado nullable: true, blank: true
        horaRetiro inList: ["8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00"]
        horaDevolucion inList: ["8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00"]
    }
}
