<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="administrador" />
    <g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a></a>
<div class="slider col s12 m12">
    <div id="list-vehiculo" class="content scaffold-list" role="main">
        <div class="row">
            <table class="responsive-table bordered highlight centered">
                <thead>
                <tr>
                    <th></th>
                    <th>Patente</th>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Año</th>
                    <th>Sucursal</th>
                    <th>Tipo de vehiculo</th>
                    <th>Valor Día</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="v" in="${vehiculoList}">
                    <tr>
                        <td>
                            <g:link class="waves-effect waves-light tooltipped" action="index" params="[vehiculo:v.id]" data-position="top" data-delay="50" data-tooltip="Cambiar foto de ${controllerName}"><asset:image src="vehiculos/${v.archivo}" width="50" height="50" alt="" class="circle"/></g:link>
                        </td>
                        <td>${v.patente}</td>
                        <td>${v.marca}</td>
                        <td>${v.modelo}</td>
                        <td>${v.año}</td>
                        <td>${v.sucursal.region}</td>
                        <td>${v.tipoVehiculo.nombre}</td>
                        <td>${v.valor}</td>
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
            <g:paginate total="${vehiculoCount ?: 0}" />
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
                <g:form class="col s12" resource="${this.vehiculo}" method="PUT">
                    <div class="row">
                        <div class="input-field col s12 m1">
                            <f:input class="tooltipped" length="8" maxlength="8" property="patente" id="patente" bean="vehiculo" data-position="bottom" data-delay="50" data-tooltip="Ej: AA-BB-88"/>
                            <label for="patente">Patente</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="marca">Marca</label>
                            <f:input property="marca" id="marca" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="modelo">Modelo</label>
                            <f:input property="modelo" id="modelo" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m1">
                            <label for="año">Año</label>
                            <f:input type="number" property="año" id="año" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="chasis">N° chasis</label>
                            <f:input property="chasis" id="chasis" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m4">
                            <label for="descripcion">Descripción</label>
                            <f:input class="materialize-textarea" length="99" maxlength="100" property="descripcion" id="descripcion" bean="vehiculo"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m3">
                            <f:input property="sucursal" id="patente" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m3">
                            <f:input property="tipoVehiculo" id="patente" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="valor">Valor</label>
                            <f:input type="number" property="valor" id="valor" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="valorh">Valor hora</label>
                            <f:input type="number" property="valorHoraExtra" id="valorh" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Indique si este vehiculo esta disponible para ser alquilado">
                            <select name="estado">
                                <option value="" disabled>Elija opcion</option>
                                <option value="ACTIVO">Activo</option>
                                <option value="NO_ACTIVO">No Activo</option>
                            </select>
                        </div>
                    </div>
                    <!-- Menu Modal Edit -->
                    <div class="fixed-action-btn">
                        <button name="create" class="save waves-effect waves-light btn-floating btn-large teal tooltipped" value="${message(code: 'default.button.create.label', default: 'Create')}" type="submit" data-position="left" data-delay="50" data-tooltip="Guardar ${controllerName}"><i class="material-icons right">send</i></button>
                        <a class="modal-action modal-close waves-effect waves-light btn-floating btn-large red tooltipped" href="<g:createLink controller="vehiculo" action="index" />" data-position="left" data-delay="50" data-tooltip="Cancelar"><i class="material-icons">cancel</i></a>
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
                <g:form action="save">
                    <div class="row">
                        <div class="input-field col s12 m1">
                            <label for="patente">Patente</label>
                            <f:input class="tooltipped" length="8" maxlength="8" property="patente" id="patente" bean="vehiculo" data-position="bottom" data-delay="50" data-tooltip="Ej: AA-BB-88"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="marca">Marca</label>
                            <f:input property="marca" id="marca" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="modelo">Modelo</label>
                            <f:input property="modelo" id="modelo" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m1">
                            <label for="año">Año</label>
                            <f:input type="number" property="año" id="año" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="chasis">N° chasis</label>
                            <f:input property="chasis" id="chasis" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m4">
                            <label for="descripcion">Descripción</label>
                            <f:input class="materialize-textarea" length="99" maxlength="100" property="descripcion" id="descripcion" bean="vehiculo"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m3">
                            <f:field property="sucursal" id="patente" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m3">
                            <f:input property="tipoVehiculo" id="patente" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="valor">Valor</label>
                            <f:input type="number" property="valor" id="valor" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2">
                            <label for="valorh">Valor hora</label>
                            <f:input type="number" property="valorHoraExtra" id="valorh" bean="vehiculo"/>
                        </div>
                        <div class="input-field col s12 m2 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Indique si este vehiculo esta disponible para ser alquilado">
                            <select name="estado">
                                <option value="" disabled selected>Elija opcion</option>
                                <option value="ACTIVO">Activo</option>
                                <option value="NO_ACTIVO">No Activo</option>
                            </select>
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
    <g:if test="${params.vehiculo}">
        <a data-position="right" href="#modal1" id="clickButton"class="sesion"></a>
    </g:if>
<!-- Modal Subir archivo -->

    <div id="modal1" class="modal">
        <div class="modal-content">
            <h4>Imagen de vehiculo</h4>
                <!-- <p>A bunch of text</p> -->

        <g:uploadForm controller="vehiculo" action="upload">
            <div class="file-field input-field">
                <div class="btn">
                    <span>Archivo</span>
                    <input type="file" name="archivo">
                </div>
                <input type="hidden" name="idVehiculo" value="${params.vehiculo}">
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
                </div>
            </div>

            </div>
            <div class="modal-footer">
                <button class="save btn waves-effect waves-light" type="submit" value="Cargar">Guardar
                    <!-- <i class="material-icons right">send</i> -->
                </button>
                <button class="volver modal-action modal-close btn waves-effect waves-light" action="index">Volver
                    <!-- <i class="material-icons right">send</i> -->
                </button>
            </div>
        </g:uploadForm>
    </div>
</body>
</html>