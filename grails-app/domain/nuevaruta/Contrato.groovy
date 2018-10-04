package nuevaruta

class Contrato {
    String pactos, aceptacion, estado
    Integer seguroInternaciona, sillaBebe,gps,cadenasNieve, valorDevolucion, iva, total, montoGarantia
            Date fechaInicio, fechaTermino
    static belongsTo = [sucursal:Sucursal,cliente:Cliente]
    static hasMany = []
    static constraints = {
        estado nullable: true, blank: true
    }
}
