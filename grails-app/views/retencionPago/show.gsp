
<%@ page import="maternidad.RetencionPago" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'retencionPago.label', default: 'RetencionPago')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-retencionPago" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-retencionPago" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list retencionPago">
			
				<g:if test="${retencionPagoInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="retencionPago.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${retencionPagoInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${retencionPagoInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="retencionPago.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${retencionPagoInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${retencionPagoInstance?.pagoFactura}">
				<li class="fieldcontain">
					<span id="pagoFactura-label" class="property-label"><g:message code="retencionPago.pagoFactura.label" default="Pago Factura" /></span>
					
						<span class="property-value" aria-labelledby="pagoFactura-label"><g:link controller="pagoFactura" action="show" id="${retencionPagoInstance?.pagoFactura?.id}">${retencionPagoInstance?.pagoFactura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${retencionPagoInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="retencionPago.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipoRetencionPago" action="show" id="${retencionPagoInstance?.tipo?.id}">${retencionPagoInstance?.tipo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:retencionPagoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${retencionPagoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
