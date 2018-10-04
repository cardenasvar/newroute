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
                    <g:if test="${session.clienteLogeado!=null}">
                        <li><a data-position="right" href="#modal1" class="sesion">${session.clienteLogeado.nombres} ${session.clienteLogeado.paterno} ${session.clienteLogeado.materno}</a></li>
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
    <g:form controller="principal" action="login" id="modalinicio">
        <div class="modal-content">
            <h4>Iniciar sesión</h4>
            <div class="row">
                <div class="input-field col s6">
                    <input id="correoCliente" type="text" name="correoCliente" class="validate">
                    <label for="correoCliente">Correo Electrónico</label>
                </div>
                <div class="input-field col s6">
                    <input id="passwordCliente" type="password" name="claveCliente" class="validate">
                    <label for="passwordCliente">Contraseña</label>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <div class="input-field col s4">
                <g:submitButton class="btn-flat" name="ingresar" value="Ingresar"></g:submitButton>
            </div>
            <div class="input-field col s4">
                <a href="#!" class=" modal-action modal-close waves-effect waves btn-flat">Cerrar</a>
            </div>
        </div>
    </g:form>
</div>
<!-----Modal de registro de usuario---->
<div id="modal2" class="modal">
    <div class="modal-content">
        <h4>Crear Cuenta</h4>
        <div class="row">
            <g:form controller="principal" action="registro" class="col s12">
                <div class="row">
                    <div class="input-field col s6">
                        <input id="first_name" type="text" name="nombresCliente" class="validate">
                        <label for="first_name">Nombres</label>
                    </div>
                    <div class="input-field col s3">
                        <input id="last_name" type="text" name="paternoCliente" class="validate">
                        <label for="last_name">Apellido paterno</label>
                    </div>
                    <div class="input-field col s3">
                        <input id="materno" type="text" name="maternoCliente" class="validate">
                        <label for="materno">Apellido Materno</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" type="email" name="correoCliente" class="validate">
                        <label for="email">Correo electrónico</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="password" type="password" name="contrasenaCliente" class="validate">
                        <label for="password">Contraseña</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="password2" type="password" name="contrasenaCliente2" class="validate">
                        <label for="password2">Repita la Contraseña</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s8">
                        <g:submitButton class="btn-flat" name="registrar" value="registrar" onClick="comprobarClave()"></g:submitButton>
                    </div>
                    <div class="input-field col s4">
                        <a href="#!" class=" modal-action modal-close waves-effect waves btn-flat">Cerrar</a>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>

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
    <!--
    <g:submitButton name="enviar" class="hidden" id="enviarFacebook"></g:submitButton>
    -->
</g:form>
<!--Import jQuery before materialize.js-->
<asset:javascript src="js/jquery-2.1.1.min.js"/>
<asset:javascript src="js/materialize.js"/>
<asset:javascript src="js/forms.js"/>
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
    window.onload = function() {
        document.getElementById('clickButton').click();
    }
</script>
</body>
</html>
