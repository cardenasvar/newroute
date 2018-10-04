import nuevaruta.Sucursal
import nuevaruta.TipoVehiculo
import nuevaruta.Usuario
import nuevaruta.Vehiculo

class BootStrap {

    def init = {
        if (!Usuario.count()){
            new Usuario(rut: "18.279.378-3",
                    nombres: "Pablo Andrés",
                    paterno: "Zumelzu",
                    materno: "Zumelzu",
                    correo: "pablo@zumelzu.cl",
                    clave: "qwerty",
                    telefono: "1234456768",
                    tipo: "administrador",
                    estado: "activo"
            ).save(failOnError:true)
        }
        if (!Sucursal.count()){
            new Sucursal(rut: "76.816.854-3",
                    nombre: "nuevaRuta Puerto Montt",
                    direccion: "Puerto Montt, #376, alerce sur",
                    logo: "/img/logo.png",
                    region: "Puerto Montt",
                    ciudad: "Puerto Montt",
                    fono: "123456689",
                    usuario: "1",
                    correo: "contacto@nuevaruta.cl"
            ).save(failOnError:true)
        }
        if (!TipoVehiculo.count()){
            new TipoVehiculo(nombre: "Sedan").save(failOnError:true)
            new TipoVehiculo(nombre: "Estation Vagon").save(failOnError:true)
            new TipoVehiculo(nombre: "Hatchback").save(failOnError:true)
            new TipoVehiculo(nombre: "Camioneta").save(failOnError:true)
            new TipoVehiculo(nombre: "City Car").save(failOnError:true)
        }
        if (!Vehiculo.count()){
            new Vehiculo(marca: "toyota",
                    modelo: "yaris",
                    patente: "bk-bx-75",
                    estado: "ACTIVO",
                    descripcion: "vehiculo de gran tamaño y económico",
                    sucursal: 1,
                    año: 2016,
                    valor: 14400,
                    valorHoraExtra: 7800,
                    tipoVehiculo: 1,
                    archivo: '14-yaris-negro-mica-metalico.png'
            ).save(failOnError:true)
        }
    }
    def destroy = {
    }
}
