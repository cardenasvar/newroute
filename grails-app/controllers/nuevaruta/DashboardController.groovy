package nuevaruta

class DashboardController {
    def label="dsa"
    def index() { }
    def login(){
        if(params.correo){
            def u=Usuario.findByCorreoAndClave(params.correo,params.clave)
            if(u){
                session.usuarioLogeado = u
                println     "cliente: "+u.nombres
                flash.message = "Sesión iniciada correctamente"
                redirect controller: "dashboard", action: "index"
            }else{
                flash.message = "No puedes acceder comprueba tus credenciales de Usuario"
                redirect controller: "dashboard", action: "login"
            }
        }

    }

}
