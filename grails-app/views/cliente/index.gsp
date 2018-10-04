<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="administrador" />
    <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
    <script type="text/javascript"></script>
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="slider col s12 m12">
    <div id="list-cliente" class="content scaffold-list" role="main">
        <div class="row">
            <table class="responsive-table bordered highlight centered">
                <thead>
                <tr>
                    <th>RUT</th>
                    <th>Nombres</th>
                    <th>Paterno</th>
                    <th>Materno</th>
                    <th>Fech. Nacimiento</th>
                    <th>Telefono</th>
                    <th>Correo</th>
                    <th>Estado</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="v" in="${clienteList}">
                    <tr class="tooltipped" data-position="top" data-delay="2000" data-tooltip="ID Facebook ${v.facebookID}">
                        <td>${v.rut}</td>
                        <td>${v.nombres}</td>
                        <td>${v.paterno}</td>
                        <td>${v.materno}</td>
                        <td>${v.fechaNacimiento}</td>
                        <td>${v.telefono}</td>
                        <td>${v.correo}</td>
                        <td>${v.estado}</td>
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
            <g:paginate total="${clienteCount ?: 0}" />
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
            <!---RUT, marca, modelo, chasis, año, valor, estado, descripcion, valorHoraExtra--->
                <g:form class="col s12" resource="${this.cliente}" method="PUT" name="evt">
                    <div class="row">
                        <div class="input-field col s12 m1">
                            <f:input class="tooltipped" length="12" name="rut" oninput="checkRut(this)" maxlength="13" onKeyPress="return SoloNumeros(event)" property="rut" id="rut" bean="cliente" data-position="bottom" data-delay="50" data-tooltip="Ej: 12.345.678-k"/>
                            <label for="RUT">RUT</label>
                        </div>
                        <div class="input-field col s12 m3">
                            <f:input property="nombres" id="nombres" onKeyPress="return soloLetras(event)" onKeyUp="this.value = this.value.toUpperCase()" bean="cliente"/>
                            <label for="nombres">Nombres</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <f:input property="paterno" id="paterno" onKeyPress="return soloLetras(event)" onKeyUp="this.value = this.value.toUpperCase()" bean="cliente"/>
                            <label for="paterno">Paterno</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <f:input property="materno" id="materno" onKeyPress="return soloLetras(event)" onKeyUp="this.value = this.value.toUpperCase()" bean="cliente"/>
                            <label for="materno">Materno</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <f:input property="telefono" id="telefono" name="telefono" minLength="9" maxlength="9" onKeyPress="return SoloNumeros(event)" bean="cliente"/>
                            <label for="telefono">Telefono</label>
                        </div>
                        <div class="input-field inline col s12 m4">
                            <f:input class="validate" type="email" property="correo" id="correo" bean="cliente"/>
                            <label for="correo" data-error="El email debe estar en formato usuario@dominio.com" data-success="">Correo</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <f:input property="clave" id="clave" bean="cliente"/>
                            <label for="clave">Contraseña</label>
                        </div>
                        <div class="input-field col s12 m1">
                            <f:input property="fechaNacimiento" id="fechaNacimiento" bean="cliente"/>
                            <label for="fechaNacimiento">F. Nacimiento</label>
                        </div>
                    </div>

                    <!-- Menu Modal Edit -->
                    <div class="fixed-action-btn">
                        <button name="create" class="save waves-effect waves-light btn-floating btn-large teal tooltipped" value="${message(code: 'default.button.create.label', default: 'Create')}" type="submit" data-position="left" data-delay="50" data-tooltip="Guardar ${controllerName}"><i class="material-icons right">send</i></button>
                        <a class="modal-action modal-close waves-effect waves-light btn-floating btn-large red tooltipped" href="<g:createLink controller="cliente" action="index" />" data-position="left" data-delay="50" data-tooltip="Cancelar"><i class="material-icons">cancel</i></a>
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
            <!---RUT, marca, modelo, chasis, año, valor, estado, descripcion, valorHoraExtra--->
                <g:form class="col s12" action="save" name="form">
                    <div class="row">
                        <div class="input-field col s12 m1">
                            <f:input class="tooltipped" length="12" oninput="checkRut(this)" name="rut" maxlength="13" property="rut" id="rut"  bean="cliente" data-position="bottom" data-delay="50" data-tooltip="Ej: 12.345.678-k"/>
                            <label for="RUT">Rut</label>
                        </div>
                        <div class="input-field col s12 m3">
                            <f:input property="nombres" id="nombres" onKeyPress="return soloLetras(event)" onKeyUp="this.value = this.value.toUpperCase()" bean="cliente"/>
                            <label for="nombres">Nombres</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <f:input property="paterno" id="paterno" onKeyPress="return soloLetras(event)" onKeyUp="this.value = this.value.toUpperCase()" bean="cliente"/>
                            <label for="paterno">Paterno</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <f:input property="materno" id="materno" onKeyPress="return soloLetras(event)" onKeyUp="this.value = this.value.toUpperCase()" bean="cliente"/>
                            <label for="materno">Materno</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <f:input property="telefono" id="telefono" name="telefono" minLength="9" maxlength="9" onKeyPress="return SoloNumeros(event);" bean="cliente"/>
                            <label for="telefono">Telefono</label>
                        </div>
                        <div class="input-field inline col s12 m4">
                            <f:input class="validate" type="email" property="correo" id="correo" bean="cliente"/>
                            <label for="correo" data-error="El email debe estar en formato usuario@dominio.com" data-success="">Correo</label>
                        </div>
                        <div class="input-field col s12 m2">
                            <f:input property="clave" id="clave" bean="cliente"/>
                            <label for="clave">Contraseña</label>
                        </div>
                        <div class="input-field col s12 m1">
                            <f:input property="fechaNacimiento" id="fechaNacimiento" bean="cliente"/>
                            <label for="fechaNacimiento">F. Nacimiento</label>
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
        <!--funcion para validar el rut-->
        function checkRut(rut) {
            // para Despejar Puntos
            var valor = rut.value.replace('.','');
            // para Despejar Guión
            valor = valor.replace('-','');
            // Aislar Cuerpo y Dígito Verificador
            cuerpo = valor.slice(0,-1);
            dv = valor.slice(-1).toUpperCase();
            // Formatear RUN
            rut.value = cuerpo + '-'+ dv
            // Si no cumple con el mínimo ej. (1.222.333)
            if(cuerpo.length < 7) { rut.setCustomValidity("RUT Incompleto"); return false;}
            // Calcular Dígito Verificador
            suma = 0;
            multiplo = 2;
            // Para cada dígito del Cuerpo
            for(i=1;i<=cuerpo.length;i++) {
                // Obtener su Producto con el Múltiplo Correspondiente
                index = multiplo * valor.charAt(cuerpo.length - i);
                // Sumar al Contador General
                suma = suma + index;
                // Consolidar Múltiplo dentro del rango [2,7]
                if(multiplo < 7) { multiplo = multiplo + 1; } else { multiplo = 2; }
            }
            // Calcular Dígito Verificador en base al Módulo 11
            dvEsperado = 11 - (suma % 11);
            // Casos Especiales (0 y K)
            dv = (dv == 'K')?10:dv;
            dv = (dv == 0)?11:dv;
            // Validar que el Cuerpo coincide con su Dígito Verificador
            if(dvEsperado != dv) { rut.setCustomValidity("RUT Inválido"); return false; }
            // Si todo sale bien, eliminar errores (decretar que es válido)
            rut.setCustomValidity('');
        }
    </script>
</body>
</html>