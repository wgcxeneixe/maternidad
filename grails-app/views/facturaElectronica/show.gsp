
<%@ page import="facturaElectronica.FacturaElectronica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'facturaElectronica.label', default: 'FacturaElectronica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-facturaElectronica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-facturaElectronica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list facturaElectronica">
			
				<g:if test="${facturaElectronicaInstance?.cae}">
				<li class="fieldcontain">
					<span id="cae-label" class="property-label"><g:message code="facturaElectronica.cae.label" default="Cae" /></span>
					
						<span class="property-value" aria-labelledby="cae-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="cae"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="facturaElectronica.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.cuit}">
				<li class="fieldcontain">
					<span id="cuit-label" class="property-label"><g:message code="facturaElectronica.cuit.label" default="Cuit" /></span>
					
						<span class="property-value" aria-labelledby="cuit-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="cuit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="facturaElectronica.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="facturaElectronica.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${facturaElectronicaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.localidad}">
				<li class="fieldcontain">
					<span id="localidad-label" class="property-label"><g:message code="facturaElectronica.localidad.label" default="Localidad" /></span>
					
						<span class="property-value" aria-labelledby="localidad-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="localidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.numeroFactura}">
				<li class="fieldcontain">
					<span id="numeroFactura-label" class="property-label"><g:message code="facturaElectronica.numeroFactura.label" default="Numero Factura" /></span>
					
						<span class="property-value" aria-labelledby="numeroFactura-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="numeroFactura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.personaFisica}">
				<li class="fieldcontain">
					<span id="personaFisica-label" class="property-label"><g:message code="facturaElectronica.personaFisica.label" default="Persona Fisica" /></span>
					
						<span class="property-value" aria-labelledby="personaFisica-label"><g:formatBoolean boolean="${facturaElectronicaInstance?.personaFisica}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.provincia}">
				<li class="fieldcontain">
					<span id="provincia-label" class="property-label"><g:message code="facturaElectronica.provincia.label" default="Provincia" /></span>
					
						<span class="property-value" aria-labelledby="provincia-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="provincia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.puntoVenta}">
				<li class="fieldcontain">
					<span id="puntoVenta-label" class="property-label"><g:message code="facturaElectronica.puntoVenta.label" default="Punto Venta" /></span>
					
						<span class="property-value" aria-labelledby="puntoVenta-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="puntoVenta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.razonSocial}">
				<li class="fieldcontain">
					<span id="razonSocial-label" class="property-label"><g:message code="facturaElectronica.razonSocial.label" default="Razon Social" /></span>
					
						<span class="property-value" aria-labelledby="razonSocial-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="razonSocial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.tipoFactura}">
				<li class="fieldcontain">
					<span id="tipoFactura-label" class="property-label"><g:message code="facturaElectronica.tipoFactura.label" default="Tipo Factura" /></span>
					
						<span class="property-value" aria-labelledby="tipoFactura-label"><g:link controller="tipoFactura" action="show" id="${facturaElectronicaInstance?.tipoFactura?.id}">${facturaElectronicaInstance?.tipoFactura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="facturaElectronica.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.totalIva}">
				<li class="fieldcontain">
					<span id="totalIva-label" class="property-label"><g:message code="facturaElectronica.totalIva.label" default="Total Iva" /></span>
					
						<span class="property-value" aria-labelledby="totalIva-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="totalIva"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaElectronicaInstance?.totalNeto}">
				<li class="fieldcontain">
					<span id="totalNeto-label" class="property-label"><g:message code="facturaElectronica.totalNeto.label" default="Total Neto" /></span>
					
						<span class="property-value" aria-labelledby="totalNeto-label"><g:fieldValue bean="${facturaElectronicaInstance}" field="totalNeto"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:facturaElectronicaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${facturaElectronicaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
