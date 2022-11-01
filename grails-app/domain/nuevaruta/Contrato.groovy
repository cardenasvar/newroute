package nuevaruta

class Contrato {
    String pactos, aceptacion, estado, solicitud, comprobante, resolucion
    Integer seguroInternaciona, sillaBebe,gps,cadenasNieve, valorDevolucion, iva, total, montoGarantia
            Date fechaInicio, fechaTermino
    Date fechaCreacion = new Date()
    Date fechaDesde = new Date()
    static belongsTo = [sucursal:Sucursal,cliente:Cliente]
    static hasMany = []
    static constraints = {
        estado nullable: true, blank: true
    }
}
