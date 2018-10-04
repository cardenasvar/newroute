<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
    <body>


    <script src="paypal-button.min.js?merchant=YOUR_MERCHANT_ID"
            data-button="buynow"
            data-name="My product"
            data-amount="1.00"
            async
    ></script>
    </body>
</html>