<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="row"><!-- Base de la zona del contenido sector blanco -->
    <div class="col s12 m3"><!-- Zona lateral izquerda -->
        <div class="row">
            <div class="row">
                <div class="col s12">
                    <div class="card-panel teal white-text z-depth-4">
                        <div class="row">
                            <h5>Rentar Ahora!</h5>
                            <g:form action="index" method="get" class="col s12" name="fechas">
                                <div class="input-field col s12">
                                    <select name="tipo">
                                        <option value="" disabled selected>Elija opcion</option>
                                        <g:each var="t" in="${tipovehiculo}">
                                            <option value="${t.id}">${t.nombre}</option>
                                        </g:each>
                                    </select>
                                    <label class="white-text">Tipo Vehiculo</label>
                                </div>
                                <div class="input-field col s12">
                                    <select name="sucursal">
                                        <option value="" disabled selected>Elija opcion</option>
                                        <g:each var="s" in="${sucursal}">
                                            <option value="${s.id}">${s.region}</option>
                                        </g:each>
                                    </select>
                                    <label class="white-text">Arriendo de movil en</label>
                                </div>
                                <div class="input-field col s12">
                                    <input type="date" name="fecharetiro" class="datepicker" id="fechaRetiro" >
                                    <label class="white-text" >Fecha de retiro</label>
                                </div>
                                <div class="input-field col s12">
                                    <input type="date" name="fechadevolucion" class="datepicker" id="fechaDevolucion" >
                                    <label class="white-text">Fecha de devolucion</label>
                                </div>
                                <div class="input-field col s12 center-align">
                                    <g:if test="${session.clienteLogeado}">
                                        <g:submitButton  class="waves-effect waves-light btn tooltipped" data-position="right" name="buscar" value="busqueda"></g:submitButton>
                                    </g:if>
                                    <g:else>
                                        <a  class="waves-effect waves-light btn tooltipped" data-position="right" name="buscar" value="busqueda" onclick="alert('Debes iniciar sesión o registrarte para tener acceso a esta página, \nHazlo Ahora es gratis!!');">Buscar</a>
                                    </g:else>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
    <!--
            <div class="row">
                <div class="col s12">
                    <div class="card-panel teal z-depth-4">
                        <span class="white-text">
                            <span class="card-title">Card Title</span>
                            Environment: ${grails.util.Environment.current.name}<br>
                            App profile: ${grailsApplication.config.grails?.profile}<br>
                            Grails version: <g:meta name="info.app.grailsVersion"/><br>
                            Groovy version: ${GroovySystem.getVersion()}<br>
                            JVM version: ${System.getProperty('java.version')}<br>
                            Reloading active: ${grails.util.Environment.reloadingAgentEnabled}<br><br>
                            <a class="btn tooltipped" data-position="right" data-tooltip="Esto prueba un mensaje de informacion de prueba" onclick="Materialize.toast('Se esta incluyendo la funciones de mensajes', 5000,'')">Test de mesajes</a>
                            <br></br>
                            <!-- Modal Trigger --
                            <a class="tooltipped waves-effect waves-light btn" data-position="right" data-tooltip="Abre un modal" href="#modal1">Test Modal</a>
                        </span>
                    </div>
                </div>
            </div>
-->
        </div>
    </div>

    <div class="slider card-panel z-depth-0 col s12 m9"><!-- Contenido derecho -->
        <ul class="slides">
            <li>
                <img src="assets/vehiculos/14-yaris-negro-mica-metalico.png"> <!-- random image -->
                <div class="caption center-align">
                    <h3>Toyota Yaris</h3>
                    <h5 class="light grey-text text-lighten-3">4 Puertas · 5300L Maleta · 5 Ocupantes.</h5>
                <!--<a class="waves-effect waves-light btn">Ver Oferta</a> -->
                </div>
            </li>
            <li>
                <img src="assets/vehiculos/2samsungsm3.jpg"> <!-- random image -->
                <div class="caption left-align">
                    <h3>Samsung SM3</h3>
                    <h5 class="light grey-text text-lighten-3">4 Puertas · 5100L Maleta · 5 Ocupantes.</h5>
                <!-- <a class="waves-effect waves-light btn">Ver Oferta</a> -->
                </div>
            </li>
            <li>
                <img src="assets/vehiculos/27721.jpg"> <!-- random image -->
                <div class="caption left-align">
                    <h3 class="grey-text darken-3">Mazda Mazda 3</h3>
                    <h5 class=" grey-text darken-4 text-lighten-3">4 Puertas · 5100L Maleta · 5 Ocupantes.</h5>
                    <!-- <a class="waves-effect waves-light btn">Ver Oferta</a> -->
                </div>
            </li>
        </ul>
    </div>
    <h3 class="center">Variedad de vehiculos para elegir</h3>
</div>
<g:if test="${vehiculo!=null}">
    <a id="clickButton2" class="tooltipped waves-effect waves-light btn" data-position="right" data-tooltip="Abre un modal" href="#modalvehiculos">Test Modal</a>
</g:if>
<div id="modalvehiculos" class="modal">
    <div class="modal-content">
        <input type="hidden" name="fechaRet" value="${params.fecharetiro}" id="fechaRet">
        <input type="hidden" name="fechaDev" value="${params.fechadevolucion}" id="fechaDev">
        <h4>Listado de autos</h4>
        <ul class="collection">
            <g:each var="v" in="${vehiculo}">
                <li class="collection-item avatar">
                    <asset:image src="vehiculos/${v.archivo}" width="50" height="50" alt="" class="circle"/>
                    <span class="title">${v.marca} ${v.modelo} </span>
                    <p>
                        ${v.descripcion}<br>
                        Valor por dia :<label value="${valor}" id="valor">$${v.valor} </label><br>
                        Cantidad de dias: <label id="dias"></label><br>
                        Precio aproximado: <label id="sumar" onclick="calcularvalor()"></label>
                    </p>
                    <g:link action="reserva" params="[idvehiculo:v.id, idsucursal:v.sucursalId, fecharetiro:params.fecharetiro, fechadevolucion:params.fechadevolucion, dias: ndias]">Seleccionar</g:link>
                </li>
            </g:each>
        </ul>
    </div>
    <div class="modal-footer">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
    </div>
</div>
<script>
    window.onload = function() {
        document.getElementById('clickButton2').click();
        var x= document.getElementById("fechaRet").value;
        var y= document.getElementById("fechaDev").value;
        var aFecha1 = x.split('-');
        var aFecha2 = y.split('-');
        var fFecha1 = Date.UTC(aFecha1[0],aFecha1[1]-1,aFecha1[2]);
        var fFecha2 = Date.UTC(aFecha2[0],aFecha2[1]-1,aFecha2[2]);
        var dif = fFecha2 - fFecha1;
        var dias = Math.floor(dif / (1000 * 60 * 60 * 24));
        document.getElementById("dias").innerHTML=dias;
    }
    function calcularvalor(){
        alert ("esto esta trabajando")
        var dias = document.getElementById("dias").value;
        var precio = document.getElementById("valor").value;
        var valor=precio*dias;
        document.getElementById("sumar").innerHTML=valor;
    }
</script>
</body>
</html>