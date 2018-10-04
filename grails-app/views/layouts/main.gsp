<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <asset:stylesheet src="css/materialize.css"/>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>
        <g:layoutTitle default="Rent a Car"/>
    </title>
    <g:layoutHead/>
</head>
<body>
    <head>
        <div class="navbar-fixed">
            <nav class="z-depth-3">
                <div class="nav-wrapper blue-grey lighten-1">
                    <a id="logo-container" href="http://localhost:8080" class="brand-logo">
                        <asset:image src="img/logo.png" alt="logo" class="img-responsive" width="18%" height="18%" style="padding:1%"/>
                    </a>
                    <ul class="right hide-on-med-and-down">
                        <g:if test="${session.clienteLogeado}">
                            <li><g:link data-position="right" controller="principal" action="perfil" params="[idCliente:session.clienteLogeado.id]" class="sesion" >${session.clienteLogeado.nombres} ${session.clienteLogeado.paterno} ${session.clienteLogeado.materno}</g:link></li>
                            <li><a data-position="right" href="" class="sesion"><g:link controller="principal" action="logout">Salir</g:link></a></li>
                        </g:if>
                        <g:else>
                            <li><a data-position="right" onclick="ingresar();">Ingresar Con Facebook</a>
                            <li><a data-position="right" href="#modal2" class="sesion">Registrate</a></li>
                            <li><a data-position="right" href="#modal1" class="sesion" id="inciarsesion">Iniciar Sesión</a></li>
                        </g:else>
                    </ul>
                    <a href="" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
                </div>
            </nav>
        </div>
    </head>

    <g:layoutBody/>
    <!-- Modal inicio de sesión -->
        <div id="modal1" class="modal">
            <g:form controller="principal" action="login" id="modalinicio" name="form">
            <div class="modal-content">
                <h4>Iniciar sesión</h4>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="correoCliente" type="text" name="correoCliente" class="validate" required="Ingresa tu Correo">
                        <label for="correoCliente">Correo Electrónico</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="passwordCliente" type="password" name="claveCliente" class="validate" required="Ingresa Contraseña">
                        <label for="passwordCliente">Contraseña</label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="input-field col s4">
                    <g:submitButton class="btn-flat" name="ingresar" value="Ingresar" onClick="iniciosesion(this.form)"></g:submitButton>
                </div>
                <div class="input-field col s4">
                    <a href="#!" class=" modal-action modal-close waves-effect waves btn-flat">Cerrar</a>
                </div>
            </div>
            </g:form>
        </div>
<!-----Modal de registro de usuario---->
        <div id="modal2" class="modal" >
            <div class="modal-content">
                <h4>Crear Cuenta</h4>
                <div class="row">
                    <g:form controller="principal" action="registro" class="col s12" name="form">
                        <div class="row">
                            <div class="input-field col s6">
                                <input id="first_name" type="text" name="nombresCliente" class="validate" required="ingrese nombre">
                                <label for="first_name">Nombres</label>
                            </div>
                            <div class="input-field col s3">
                                <input id="last_name" type="text" name="paternoCliente" class="validate" required="ingrese apellido paterno">
                                <label for="last_name">Apellido paterno</label>
                            </div>
                            <div class="input-field col s3">
                                <input id="materno" type="text" name="maternoCliente" class="validate" required="ingrese apellido materno">
                                <label for="materno">Apellido Materno</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="email" type="email" name="correoCliente" class="validate" required="ingrese correo">
                                <label for="email">Correo electrónico</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <input id="password" type="password" name="contrasenaCliente" class="validate" required="contraseña">
                                <label for="password">Contraseña</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="password2" type="password" name="contrasenaCliente2" class="validate" required="repita la contraseña">
                                <label for="password2">Repita la Contraseña</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s8">
                                <g:submitButton class="btn-flat" name="registrar" value="registrar" onClick="validarformularios(this.form),comprobarClave(this.form)"></g:submitButton>
                            </div>
                            <div class="input-field col s4">
                                <a href="#!" class=" modal-action modal-close waves-effect waves btn-flat">Cerrar</a>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    <!--- Aqui va el footer-->
    <footer class="page-footer blue-grey lighten-1 z-depth-3">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Nueva ruta</h5>
                <p class="grey-text text-lighten-4">No te olvides en tu proximo viaje, contactar a NuevaRuta!!</p>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                    <li><g:link controller="dashboard" action="login" class="grey-text text-lighten-3">Ingeso sesión administrador</g:link></li>
                    <li><a class="grey-text text-lighten-3" href="#!"> 2</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!"> 3</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!"> 4</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                © 2014 Copyright Text
                <a class="grey-text text-lighten-4 right" href="#!">Puerto Montt</a>
            </div>
        </div>
    </footer>
<g:if test="${flash.message!=null}">
    <a id="clickButton" data-position="right" onclick="Materialize.toast('${flash.message}', 5000,'')"></a>
</g:if>
<g:form controller="principal" action="loginfacebook" name="formularioFacebook">
    <input type="hidden" name="controlador" value="${controllerName}">
    <input type="hidden" name="accion" value="${actionName}">
    <input type="hidden" name="parametros" value="${params}">
    <input type="hidden" name="nombreClienteFacebook" id="nombreClienteF">
    <input type="hidden" name="correoClienteFacebook" id="correoClienteF">
    <input type="hidden" name="idClienteFacebook" id="idClienteF">
    <!--nose para que sirve este boton de enviar-->
    <g:submitButton name="enviar" class="hidden-sm" id="enviarFacebook"></g:submitButton>
</g:form>
<!--Import jQuery before materialize.js-->
<!--Import jQuery before materialize.js-->
<asset:javascript src="js/jquery-2.1.1.min.js"/>
<asset:javascript src="js/materialize.js"/>
<asset:javascript src="js/forms.js"/>
<asset:javascript src="validarut.js"/>

<script>
    (function(d,s,id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if(d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "http://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    window.fbAsyncInit = function() {
        FB.init({
            appId : '1483731448310215',
            cookie : true,
            xfbml : true,
            version : 'v2.0'
        });
    }

    function ingresar() {
        FB.login(function(response){
            validarUsuario();
        }, {scope: 'public_profile, email'});
    }
    function validarUsuario() {
        FB.getLoginStatus(function(response) {
            if(response.status == 'connected') {
                FB.api('me?fields=id,name,email,birthday,permissions', function(response) {
                    var nombrecompleto =response.name;
                    var correo = response.email;
                    var idfacebook=response.id;
                    document.getElementById('nombreClienteF').value=nombrecompleto;
                    document.getElementById('correoClienteF').value=correo;
                    document.getElementById('idClienteF').value=idfacebook;
                    document.getElementById('enviarFacebook').click();
                });
            } else if(response.status == 'not_authorized') {
                alert('Debes autorizar la app!');
            } else {
                alert('Debes ingresar a tu cuenta de Facebook!');
            }
        });
    }
    <!--funcion para los campos vacios del formulario de registro-->
    function validarformularios(form) {
        if (form.nombresCliente.value == "") {
            alert('\"Ingresa Nombre\"'); form.nombresCliente.focus(); return true;
        }
        if (form.paternoCliente.value == "") {
            alert('\"Apellido Paterno\"'); form.paternoCliente.focus(); return true;
        }
        if (form.maternoCliente.value == "") {
            alert('\"Apellido Materno\"'); form.maternoCliente.focus(); return true;
        }
        if (form.correoCliente.value == "") {
            alert('\"Correo\"'); form.correoCliente.focus(); return true;
        }
        if (form.contrasenaCliente.value == "") {
            alert('\"Debe tener una Contraseña\"'); form.contrasenaCliente.focus(); return true;
        }
        if (form.contrasenaCliente2.value == "") {
            alert('\"Debe repetir la Contraseña\"'); form.contrasenaCliente2.focus(); return true;
        }
    }
    <!--funcion para validar ambas contraseñas-->
    function comprobarClave(form) {
        if(form.contrasenaCliente2.value == form.contrasenaCliente.value) {

        }else{
            alert("La contrasena no coincide \n Intentalo de nuevo.");
            form.contrasenaCliente2.value = ""; form.contrasenaCliente2.focus();
            return true;
        }
    }
    <!--funcion para el inicio de sesion-->
    function iniciosesion(form){
        if (form.correoCliente.value == "") {
            alert('\"Ingresa Correo\"'); form.correoCliente.focus(); return true;
        }
        if (form.claveCliente.value == "") {
            alert('\"Ingrese Contraseña\"'); form.claveCliente.focus(); return true;
        }
    }
</script>
</body>
</html>
