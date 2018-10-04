<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Pagina no encontrada</title>
    <meta name="layout" content="main">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>
<body>
        <ul id="dropdown1" class="dropdown-content">
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
                <li><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
            </g:each>
        </ul>
        <ul class="right hide-on-med-and-down">
            <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Controladores Disponibles<i class="material-icons right">arrow_drop_down</i></a></li>
            <!--<li><a href="${createLink(controller:'login', action:'login')}">Iniciar Sesión</a></li>-->
        </ul>
        <ul id="nav-mobile" class="side-nav">
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
            <li><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
        </g:each>
        <!--<li><a href="${createLink(controller:'login', action:'login')}">Iniciar Sesión</a></li>-->
        </ul>
            <a href="" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
    <ul class="errors">
        <li>Error: Page Not Found (404)</li>
        <li>Path: ${request.forwardURI}</li>
    </ul>
</body>
</html>
