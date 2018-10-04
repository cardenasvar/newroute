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
<nav class="z-depth-3">
    <div class="nav-wrapper blue-grey lighten-5">
        <a id="logo-container" href="http://localhost:8080" class="brand-logo">
            <asset:image src="img/logo.png" alt="logo" class="img-responsive" width="18%" height="18%" style="padding:1%"/>
        </a>
        <ul id="dropdown1" class="dropdown-content">
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
                <li><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
            </g:each>
        </ul>
        <ul class="right hide-on-med-and-down">
            <li><a class="dropdown-button black-text" href="#!" data-activates="dropdown1">Controladores Disponibles<i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="black-text" href="${createLink(controller:'principal', action:'logout')}">Cerrar Sesión</a></li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
                <li><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
            </g:each>
            <li><a href="${createLink(controller:'login', action:'login')}">Cerrar Sesión</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav><!-- Aqui termina la continuacion del nav desde layout/main.gsp -->

<nav class="z-depth-3">
    <div class="nav-wrapper teal darken-1">
        <ul id="slide-out" class="side-nav">
            <li>
                <div class="userView">
                    <div class="background">
                        <img src="http://materializecss.com/images/office.jpg">
                    </div>
                    <a href="#!user"><img class="circle" src="http://materializecss.com/images/yuna.jpg"></a>
                    <a href="#!name"><span class="white-text name">Nombre Apellido</span></a>
                    <a href="#!email"><span class="white-text email">usaurio@nuevaruta.cl</span></a>
                </div>
            </li>
            <li><a href="<g:createLink controller="dashboard" action="index" />"><i class="material-icons">home</i>Página Principal</a></li>
            <li><div class="divider"></div></li>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
                <li><g:link controller="${c.logicalPropertyName}"><i class="material-icons">
                    <g:if test="${c.name=="Usuario"}">person</g:if>
                    <g:if test="${c.name=="Contrato"}">insert_drive_file</g:if>
                    <g:if test="${c.name=="Dashboard"}">dashboard</g:if>
                    <g:if test="${c.name=="Pago"}">payment</g:if>
                    <g:if test="${c.name=="Principal"}">home</g:if>
                    <g:if test="${c.name=="Reserva"}">directions_car</g:if>
                    <g:if test="${c.name=="Sucursal"}">domain</g:if>
                    <g:if test="${c.name=="Vehiculo"}">airport_shuttle</g:if>
                    <g:if test="${c.name=="Cliente"}">people</g:if>
                </i>${c.name}</g:link></li>
            </g:each>
            <li><div class="divider"></div></li>
            <li><a class="subheader">Subheader</a></li>
            <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
        </ul>

        <ul class="left">
            <a href="#" data-activates="slide-out" class="menu-s"><i class="material-icons">menu</i></a>
        </ul>
        <ul class="left">
            <a class="flow-text m_title" href="<g:createLink controller="dashboard" action="index" />">Consola de administracion</a>
        </ul>
        <ul class="left"> | </ul>
        <ul class="left">
            <a class="flow-text m_title" href="<g:createLink controller="${controllerName}" action="index" />"><g:layoutTitle/></a>
        </ul>
        <ul class="left">&nbsp;</ul>
        <ul class="left">
            <g:if test="${controllerName == 'dashboard'}">${grailsApplication.controllerClasses.count {this}} elementos</g:if>
            <g:if test="${controllerName == 'vehiculo'}">${vehiculoCount ?: 0} elementos</g:if>
            <g:if test="${controllerName == 'usuario'}">${usuarioCount ?: 0} elementos</g:if>
            <g:if test="${controllerName == 'cliente'}">${clienteCount ?: 0} elementos</g:if>
            <g:if test="${controllerName == 'contrato'}">${contratoCount ?: 0} elementos</g:if>
            <g:if test="${controllerName == 'pago'}">${pagoCount ?: 0} elementos</g:if>
            <g:if test="${controllerName == 'reserva'}">${reservaCount ?: 0} elementos</g:if>
            <g:if test="${controllerName == 'sucursal'}">${sucursalCount ?: 0} elementos</g:if>
        </ul>
        <ul class="right">

        </ul>
    </div>
</nav>

<div class="row">
    <!--
        <div class="col s12 m3">
            <div class="row">
                <div class="row">
                    <div class="col s12">
                        <div class="card-panel teal z-depth-4">
                            <span class="white-text">
                                Environment: ${grails.util.Environment.current.name}<br>
                                App profile: ${grailsApplication.config.grails?.profile}<br>
                                Grails version: <g:meta name="info.app.grailsVersion"/><br>
                                Groovy version: ${GroovySystem.getVersion()}<br>
                                JVM version: ${System.getProperty('java.version')}<br>
                                Reloading active: ${grails.util.Environment.reloadingAgentEnabled}<br><br>
                                <a class="btn tooltipped" data-position="right" data-tooltip="Esto prueba un mensaje de informacion de prueba" onclick="Materialize.toast('Se esta incluyendo la funciones de mensajes', 5000,'')">Test de mesajes</a>
                                <br></br>
                                <!-- Modal Trigger --><!--
                                <a class="tooltipped waves-effect waves-light btn" data-position="right" data-tooltip="Abre un modal" href="#modal1">Test Modal</a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        -->
    <g:layoutBody/>
</div>
<!--Import jQuery before materialize.js-->
<asset:javascript src="js/jquery-2.1.1.min.js"/>
<asset:javascript src="js/materialize.js"/>
<asset:javascript src="js/forms.js"/>
<script>
    window.onload = function() {
        document.getElementById('clickButton').click();
    }
</script>
<g:if test="${flash.message}">
    <script>
        Materialize.toast('${flash.message}', 8000);
    </script>
</g:if>
</body>
</html>

