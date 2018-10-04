<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="administrador" />
        <g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-vehiculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-vehiculo" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.vehiculo}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.vehiculo}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <div class="row">
                <!---patente, marca, modelo, chasis, año, valor, estado, descripcion, valorHoraExtra--->
                <g:form action="save">
                    <div class="row">
                        <fieldset class="form">
                            <div class="input-field col s6">
                                <label for="patente">Patente</label>
                                <f:input property="patente" id="patente" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <label for="marca">Marca</label>
                                <f:input property="marca" id="marca" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <label for="modelo">Modelo</label>
                                <f:input property="modelo" id="modelo" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <label for="año">Año</label>
                                <f:input property="año" id="año" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <f:input property="sucursal" id="patente" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <f:input property="tipoVehiculo" id="patente" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <label for="valor">Valor</label>
                                <f:input property="valor" id="valor" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <label for="valorh">Valor hora</label>
                                <f:input property="valorHoraExtra" id="valorh" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <label for="descripcion">Descripción</label>
                                <f:input property="descripcion" id="descripcion" bean="vehiculo"/>
                            </div>
                            <div class="input-field col s6">
                                <select name="estado">
                                    <option value="" disabled selected>Elija opcion</option>
                                    <option value="ACTIVO">Activo</option>
                                    <option value="NO_ACTIVO">No Activo</option>
                                </select>
                            </div>
                            <div class="input-field col s6">
                                <label for="chasis">N° chasis</label>
                                <f:input property="chasis" id="chasis" bean="vehiculo"/>
                            </div>
                        </fieldset>
                    </div>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </body>
</html>
