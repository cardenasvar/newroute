<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="administrador" />
    <g:set var="entityName" value="${message(code: 'sucursal.label', default: 'Sucursal')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="slider col s12 m12">
    <div id="list-sucursal" class="content scaffold-list" role="main">
        <div class="row">
            <table class="responsive-table bordered highlight centered">
                <thead>
                <tr>
                    <th>Rut</th>
                    <th>Nombre</th>
                    <th>Región</th>
                    <th>Ciudad</th>
                    <th>Fono</th>
                    <th>Correo</th>
                    <th>Estado</th>
                    <th>Gerente</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="v" in="${sucursalList}">
                    <tr>
                        <td>${v.rut}</td>
                        <td>${v.nombre}</td>
                        <td>${v.region}</td>
                        <td>${v.ciudad}</td>
                        <td>${v.fono}</td>
                        <td>${v.correo}</td>
                        <td>${v.estado}</td>
                        <td>${v.usuario.nombres} ${v.usuario.paterno} ${v.usuario.paterno}</td>
                        <td>
                            <g:link class="btn-floating waves-effect waves-light yellow darken-2 tooltipped" id="${v.id}" data-position="left" data-delay="50" data-tooltip="Editar ${controllerName}"><i class="material-icons">edit</i></g:link>
                            <g:link class="btn-floating waves-effect waves-light red tooltipped" action="eliminar" id="${v.id}" data-position="left" data-delay="50" data-tooltip="Eliminar ${controllerName}"><i class="material-icons">delete</i></g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="pagination">
            <g:paginate total="${sucursalCount ?: 0}" />
        </div>
    </div>

    <!-- Menu flotante Crear -->
    <div class="fixed-action-btn">
        <a class="create waves-effect waves-light btn-floating btn-large teal tooltipped" href="#modalCreate" data-position="left" data-delay="50" data-tooltip="Agregar ${controllerName}"><i class="material-icons">add</i></a>
    </div>

    <!-- Modal Edition Structure -->
    <div id="modalEdicion" class="modal bottom-sheet">
        <div class="modal-content">
            <h5>Editar ${controllerName}</h5>
            <div class="row">
            <!---patente, marca, modelo, chasis, año, valor, estado, descripcion, valorHoraExtra--->
                <g:form class="col s12" resource="${this.sucursal}" name="form" method="PUT">
                    <div class="row">
                        <div class="input-field col s12 m1">
                            <label for="rut">Rut</label>
                            <f:input class="tooltipped" length="12" maxlength="13" property="rut" id="rut" bean="sucursal" data-position="bottom" data-delay="50" data-tooltip="Ej: 12.345.678-k"/>
                        </div>
                        <div class="input-field col s12 m3">
                            <label for="nombre">Nombre Sucursal</label>
                            <f:input property="nombre" id="nombre" onKeyPress="return soloLetras(event)" bean="sucursal"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="region">Region</label>
                            <f:input property="region" id="region" onKeyPress="return soloLetras(event)" bean="sucursal"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="ciudad">Ciudad</label>
                            <f:input type="text" property="ciudad" onKeyPress="return soloLetras(event)" id="ciudad" bean="sucursal"/>
                        </div>
                        <div class="input-field col s12 m1">
                            <label for="fono">N° Telefono</label>
                            <f:input property="fono" id="fono" onKeyPress="return SoloNumeros(event);" bean="sucursal"/>
                        </div>
                        <div class="input-field inline col s12 m3">
                            <f:input class="validate" type="email" property="correo" id="correo" bean="sucursal"/>
                            <label for="correo" data-error="El email debe estar en formato usuario@dominio.com" data-success="">Correo</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="row">
                            <div class="input-field col s12 m2">
                                <label for="estado">Estado</label>
                                <f:input type="text" property="estado" id="estado" bean="sucursal"/>
                            </div>
                            <div class="input-field col s12 m5">
                                <label for="direccion">Dirección</label>
                                <f:input type="text" property="direccion" id="direccion" bean="sucursal"/>
                            </div>
                            <div class="input-field col s12 m2">
                                <f:input type="" property="usuario" id="usuario" bean="sucursal"/>
                            </div>
                        </div>
                    </div>
                    <!-- Menu Modal Edit -->
                    <div class="fixed-action-btn">
                        <button name="create" class="save waves-effect waves-light btn-floating btn-large teal tooltipped" value="${message(code: 'default.button.create.label', default: 'Create')}" type="submit" data-position="left" data-delay="50" data-tooltip="Guardar ${controllerName}"><i class="material-icons right">send</i></button>
                        <a class="modal-action modal-close waves-effect waves-light btn-floating btn-large red tooltipped" href="<g:createLink controller="sucursal" action="index" />" data-position="left" data-delay="50" data-tooltip="Cancelar"><i class="material-icons">cancel</i></a>
                    </div>
                </g:form>
            </div>
        </div>

    </div>

    <!-- Modal Creacion Structure -->
    <div id="modalCreate" class="modal bottom-sheet">
        <div class="modal-content">
            <h5>Crear ${controllerName}</h5>
            <div class="row">
            <!---patente, marca, modelo, chasis, año, valor, estado, descripcion, valorHoraExtra--->
                <g:form action="save" name="form">
                    <div class="row">
                        <div class="input-field col s12 m1">
                            <label for="rut">Rut</label>
                            <f:input class="tooltipped" length="12" maxlength="13" property="rut" id="rut" bean="sucursal" data-position="bottom" data-delay="50" data-tooltip="Ej: 12.345.678-k"/>
                        </div>
                        <div class="input-field col s12 m3">
                            <label for="nombre">Nombre Sucursal</label>
                            <f:input property="nombre" id="nombre" onKeyPress="return soloLetras(event)" bean="sucursal"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="region">Region</label>
                            <f:input property="region" id="region" onKeyPress="return soloLetras(event)" bean="sucursal"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="ciudad">Ciudad</label>
                            <f:input type="text" property="ciudad" onKeyPress="return soloLetras(event)" id="ciudad" bean="sucursal"/>
                        </div>
                        <div class="input-field col s12 m1">
                            <label for="fono">N° Telefono</label>
                            <f:input property="fono" id="fono" onKeyPress="return SoloNumeros(event);" bean="sucursal"/>
                        </div>
                        <div class="input-field inline col s12 m3">
                            <f:input class="validate" type="email" property="correo" id="correo" bean="sucursal"/>
                            <label for="correo" data-error="El email debe estar en formato usuario@dominio.com" data-success="">Correo</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="row">
                            <div class="input-field col s12 m2">
                                <label for="estado">Estado</label>
                                <f:input type="text" property="estado" onKeyPress="return soloLetras(event)" id="estado" bean="sucursal"/>
                            </div>
                            <div class="input-field col s12 m5">
                                <label for="direccion">Dirección</label>
                                <f:input type="text" property="direccion" id="direccion" bean="sucursal"/>
                            </div>
                            <div class="input-field col s12 m2">
                                <f:input type="" property="usuario" id="usuario" bean="sucursal"/>
                            </div>
                        </div>
                    </div>

                    <!-- Menu Modal Create-->
                    <div class="fixed-action-btn">
                        <button name="create" class="save waves-effect waves-light btn-floating btn-large teal tooltipped" value="${message(code: 'default.button.create.label', default: 'Create')}" type="submit" data-position="left" data-delay="50" data-tooltip="Guardar ${controllerName}"><i class="material-icons right">send</i></button>
                        <a class="modal-action modal-close waves-effect waves-light btn-floating btn-large red tooltipped" href="#!" data-position="left" data-delay="50" data-tooltip="Cancelar"><i class="material-icons">cancel</i></a>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
    <g:if test="${params.id}">
        <a type="hidden" href="#modalEdicion" data-position="left" data-delay="50" id="clickButton"></a>
    </g:if>
<!--Import jQuery before materialize.js-->
    <asset:javascript src="js/jquery-2.1.1.min.js"/>
    <asset:javascript src="js/materialize.js"/>
    <asset:javascript src="js/forms.js"/>
    <script>
        //funcion para que el campo  solo acepte numeros
        function SoloNumeros(evt){
            if(window.event){//asignamos el valor de la tecla a keynum
                keynum = evt.keyCode; //IE
            }
            else{
                keynum = evt.which; //FF
            }
            //comprobamos si se encuentra en el rango numérico y que teclas no recibirá.
            if((keynum > 47 && keynum < 58) || keynum == 8 || keynum == 13 || keynum == 6 ){
                return true;
            }
            else{
                alert('No se aceptan letras');
                return false;
            }
        }
        //funcion para que el campo de texto solo acepte letras
        function soloLetras(e) {
            key = e.keyCode || e.which;
            tecla = String.fromCharCode(key).toString();
            letras = " áéíóúabcdefghijklmnñopqrstuvwxyzÁÉÍÓÚABCDEFGHIJKLMNÑOPQRSTUVWXYZ";//Se define todo el abecedario que se quiere que se muestre.
            especiales = [8, 37, 39, 46, 6]; //Es la validación del KeyCodes, que teclas recibe el campo de texto.
            tecla_especial = false
            for(var i in especiales) {
                if(key == especiales[i]) {
                    tecla_especial = true;
                    break;
                }
            }
            if(letras.indexOf(tecla) == -1 && !tecla_especial){
                alert('No se aceptan Numeros');
                return false;
            }
        }
        <!--funcion para validar el numero telefonico-->
        function validarnumero(){
            //Almacenamos los valores
            telefono=$('telefono').val();
            //Comprobamos la longitud de caracteres
            if (telefono.length>8){
                return true;
            }
            else {
                alert('Minimo 9 caracteres');
                return false;
            }
        }
    </script>
</body>
</html>