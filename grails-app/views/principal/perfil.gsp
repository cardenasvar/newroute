<!DOCTYPE html>
    <html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="">
        <nav>
            <div class="nav-wrapper blue-grey">
                <form>
                    <div class="input-field">
                        <input id="search" type="search" placeholder="Buscar algunas cosas">
                        <label for="search"><i class="material-icons">search</i></label>
                        <i class="material-icons">close</i>
                    </div>
                </form>
            </div>
        </nav>
    </div>

    <h5>Mis Datos</h5>
    <div class="row">
    <!---RUT, marca, modelo, chasis, año, valor, estado, descripcion, valorHoraExtra--->
        <g:form class="col s12" action="updateCliente" resource="${this.cliente}" method="PUT"name="evt">
            <div class="row">
                <div class="input-field col s12 m1">
                    <f:input class="tooltipped" length="12" maxlength="13" oninput="checkRut(this)" property="rut" id="rut" name="rut" bean="cliente" data-position="bottom" data-delay="50" data-tooltip="Ej: 12.345.678-k"/>
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
                <button name="update" class="save waves-effect waves-light btn-floating btn-large teal tooltipped" value="${message(code: 'default.button.create.label', default: 'Update')}" type="submit" data-position="left" data-delay="50" data-tooltip="Guardar"><i class="material-icons right">save</i></button>
                <a class="modal-action modal-close waves-effect waves-light btn-floating btn-large red tooltipped" href="<g:createLink controller="principal" action="index" />" data-position="left" data-delay="50" data-tooltip="Cancelar"><i class="material-icons">cancel</i></a>
            </div>
        </g:form>
    </div>

    <h5>Mis Reservas</h5>
    <div class="row">
        <table class="responsive-table bordered highlight centered">
            <thead>
            <tr>
                <th>Fecha de Retiro</th>
                <th>Fecha de devolucion</th>
                <th>Monto Pagado</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Matricula</th>
                <th>Estado</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="r" in="${reservas}">
                <tr>
                    <td>${r.fechaRetiro}</td>
                    <td>${r.fechaDevolucion}</td>
                    <td>$${r.monto}</td>
                    <td>${r.vehiculo.marca}</td>
                    <td>${r.vehiculo.modelo}</td>
                    <td>${r.vehiculo.patente}</td>
                    <td>${r.estado}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
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
            if(cuerpo.length < 7) {
                rut.setCustomValidity("RUT Incompleto"); 
                return false;}
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