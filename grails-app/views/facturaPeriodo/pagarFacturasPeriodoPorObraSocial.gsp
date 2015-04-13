<%--
  Created by IntelliJ IDEA.
  User: christian
  Date: 30/09/14
  Time: 11:22 PM
--%>

<%@ page import="maternidad.Factura" %>
<%@ page import="maternidad.ObraSocial" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main">
    <script src="//ajax.googleapis.com/ajax/libs/prototype/1.6.1.0/prototype.js"></script>

    <g:set var="entityName" value="${message(code: 'pagoFactura.label', default: 'Pago Factura')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <g:javascript library="jQuery"/>
</head>

<body>
<div class="body">
    <g:if test="${flash.error}">
        <div class="errors">${flash.error}</div>
    </g:if>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>


        <span class="label_input">
            <label>Buscar Facturas de :</label>
        </span>

        <g:select name="obraSocial.id"
                  class="select"
                  noSelection="['': 'Seleccione Obra Social']"
                  optionKey="id"
                  value="${obraSocialSelected?.id}"
                  from="${ObraSocial.list()}"
                  onChange="${remoteFunction(action: 'selectFactura',
                          params: '\'idObraSocial=\' + this.value',
                          update: 'remotoDivListaFacturas')};"/>

        <div class="list" id="remotoDivListaFacturas">
            <g:render template="listaFacturasPeriodo"
                      model="['listaFacturasSinPagar': listaFacturasSinPagar, 'obrasocialNombre': obrasocialNombre]"/>
        </div>


</div>
</body>
</html>