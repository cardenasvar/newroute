package nuevaruta

import org.apache.tools.ant.taskdefs.Get
import java.util.Date
import java.text.ParseException;
import java.text.SimpleDateFormat;
import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK

class PrincipalController {
    def index() {
        def tipovehiculo = TipoVehiculo.findAll()
        def sucursal = Sucursal.findAll()
        def vehiculo=null
        if(params.login){
            loginfacebook()
        }
        if(params.tipo&&params.sucursal&&params.fecharetiro&&params.fechadevolucion!=null){
            vehiculo=Vehiculo.executeQuery("from Vehiculo as v where v.sucursal="+params.sucursal+"and v.tipoVehiculo="+params.tipo)
        }
        [tipovehiculo:tipovehiculo, sucursal:sucursal, vehiculo:vehiculo]
    }
    def reserva(){
        def cliente=null
        def vehiculo= Vehiculo.findById(params.idvehiculo)
        def sucursal= Sucursal.findById(params.idsucursal)
        def reserva= new Reserva(params)
        if(session.clienteLogeado){
            cliente=Cliente.findByCorreo(session.clienteLogeado.correo)
        }else{
            respond new Cliente(params), model:[vehiculo: vehiculo, cliente:cliente, sucursal:sucursal, reserva:reserva]
        }
        [vehiculo: vehiculo, cliente:cliente, sucursal:sucursal, reserva:reserva]

    }
    def guardarReserva(){
        def clienteId=session.clienteLogeado.id
        def cliente =Cliente.get(clienteId)
        cliente.properties=params
        cliente.rut=params.rut
        //cliente.rut= params.rut
        cliente.nombres=params.nombres
        cliente.paterno=params.paterno
        cliente.materno=params.materno
        cliente.correo=params.correo
        cliente.telefono=params.telefono
        cliente.fechaNacimiento= params.fechaNacimiento

        println "grabando cliente..."+ cliente.nombres
        cliente.save flush:true


        def r = new Reserva(fechaRetiro: params.fechaRetiro, fechaDevolucion: params.fechaDevolucion,
                            horaRetiro: params.horaRetiro, horaDevolucion: params.horaDevolucion, monto: params.monto,
                            precioVehiculo: params.precioVehiculo, vehiculo: params.idvehiculo, cliente: cliente
        )
        r.save flush:true
        if (!r.save()) {
            r.errors.allErrors.each {
                println it
            }
        }
        redirect action: "perfil", params:[idCliente:session.clienteLogeado.id]
    }
    def pago(){

    }
    def perfil(){
        if(params.idCliente){
            def cliente=Cliente.findById(session.clienteLogeado.id)
            def reservas=Reserva.findAllByCliente(Cliente.findById(session.clienteLogeado.id))
            [cliente:cliente, reservas:reservas ]
        }else{
            flash.message="No tienes las credenciales necesarias para ingreas aquí"
            redirect controller: "principal", action: "index"
        }


    }
    def updateCliente(Cliente cliente){

        cliente.save flush:true

    }
    //Registro y sistema de logeo
    def registro(){
        def c= new Cliente(nombres: params.nombresCliente,correo: params.correoCliente, paterno: params.paternoCliente, materno: params.maternoCliente, clave: params.contrasenaCliente)
        c.save(flush:true)
        if(!c.save()){
            c.errors.each {
                println it
                flash.message= "error al crear el Cliente por favor Vuelva a intentarlo mas tarde"
                /// /redirect(action:"index")
            }
        }else{
            flash.message= "El cliente ha sido creado exitosamente y a inciado su sesion"
            session.clienteLogeado = c
            redirect(action:"index")
        }

    }
    def login(){
        def c=Cliente.findByCorreoAndClave(params.correoCliente,params.claveCliente)
        if(c){
            session.clienteLogeado = c
            println     "cliente: "+c.nombres
            flash.message = "Sesión iniciada correctamente"
            redirect controller: "principal", action: "index"
        }else{
            flash.message = "No podemos encontrarte, REGISTRATE POR FAVOR"
            redirect controller: "principal", action: "index"
        }
    }
    def loginfacebook(){
        println "nombre y correo :"+params.nombreClienteFacebook+" "+params.correoClienteFacebook;
        if(params.nombreClienteFacebook&&params.correoClienteFacebook&&params.idClienteFacebook!=null){
            def cliente= Cliente.findByCorreo(params.correoClienteFacebook);
            if(cliente){
                session.clienteLogeado = cliente
                flash.message = "Sesión iniciada correctamente"
                String [] entrada= params.parametros
                println "Parametros : "+entrada[0]
                redirect model: entrada
            }else {
                def c = new Cliente(nombres: params.nombreClienteFacebook, correo: params.correoClienteFacebook, facebookID: params.idClienteFacebook)
                        .save(flush: true)
                if (c) {
                    session.clienteLogeado = c
                    flash.message = "Sesión iniciada correctamente"
                    redirect controller: "principal", action: "index"
                } else {
                    flash.message = "No podemos registrarte, Revisa tus credenciales de facebook"
                    redirect controller: "principal", action: "index"
                }
            }
        }
    }
    def logout (){
        session.invalidate()
        flash.message = "Sesión cerrada correctamente"
        redirect controller: "principal", action: "index"
    }
}
