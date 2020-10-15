package nuevaruta

class Pago {
    String banco, tipoCuenta, monto, observacion, estado, tipoTarjeta, numeroTarjeta, fechaVencimiento, formadepago, error, fechaPago, recepcion
    static belongsTo = [reserva:Reserva, cliente:Cliente]
    static constraints = {
        estado nullable: true, blank: true
        error nullable: true, blank:true
    }
}
