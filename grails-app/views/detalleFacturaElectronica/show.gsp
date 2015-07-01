
<%@ page import="facturaElectronica.DetalleFacturaElectronica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleFacturaElectronica.label', default: 'DetalleFacturaElectronica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleFacturaElectronica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleFacturaElectronica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleFacturaElectronica">
			
				<g:if test="${detalleFacturaElectronicaInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="detalleFacturaElectronica.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${detalleFacturaElectronicaInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaElectronicaInstance?.concepto}">
				<li class="fieldcontain">
					<span id="concepto-label" class="property-label"><g:message code="detalleFacturaElectronica.concepto.label" default="Concepto" /></span>
					
						<span class="property-value" aria-labelledby="concepto-label"><g:link controller="conceptoDetalleFacturaElectronica" action="show" id="${detalleFacturaElectronicaInstance?.concepto?.id}">${detalleFacturaElectronicaInstance?.concepto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaElectronicaInstance?.factura}">
				<li class="fieldcontain">
					<span id="factura-label" class="property-label"><g:message code="detalleFacturaElectronica.factura.label" default="Factura" /></span>
					
						<span class="property-value" aria-labelledby="factura-label"><g:link controller="facturaElectronica" action="show" id="${detalleFacturaElectronicaInstance?.factura?.id}">${detalleFacturaElectronicaInstance?.factura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaElectronicaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="detalleFacturaElectronica.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${detalleFacturaElectronicaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaElectronicaInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="detalleFacturaElectronica.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${detalleFacturaElectronicaInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:detalleFacturaElectronicaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${detalleFacturaElectronicaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
