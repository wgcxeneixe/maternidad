
<%@ page import="maternidad.SubDetalleCaja" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subDetalleCaja.label', default: 'SubDetalleCaja')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subDetalleCaja" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subDetalleCaja" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subDetalleCaja">
			
				<g:if test="${subDetalleCajaInstance?.conceptocaja}">
				<li class="fieldcontain">
					<span id="conceptocaja-label" class="property-label"><g:message code="subDetalleCaja.conceptocaja.label" default="Conceptocaja" /></span>
					
						<span class="property-value" aria-labelledby="conceptocaja-label"><g:link controller="conceptoCaja" action="show" id="${subDetalleCajaInstance?.conceptocaja?.id}">${subDetalleCajaInstance?.conceptocaja?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subDetalleCajaInstance?.credito}">
				<li class="fieldcontain">
					<span id="credito-label" class="property-label"><g:message code="subDetalleCaja.credito.label" default="Credito" /></span>
					
						<span class="property-value" aria-labelledby="credito-label"><g:formatBoolean boolean="${subDetalleCajaInstance?.credito}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subDetalleCajaInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="subDetalleCaja.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${subDetalleCajaInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subDetalleCajaInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="subDetalleCaja.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${subDetalleCajaInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subDetalleCajaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="subDetalleCaja.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${subDetalleCajaInstance?.usuario?.id}">${subDetalleCajaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subDetalleCajaInstance?.detalleCaja}">
				<li class="fieldcontain">
					<span id="detalleCaja-label" class="property-label"><g:message code="subDetalleCaja.detalleCaja.label" default="Detalle Caja" /></span>
					
						<span class="property-value" aria-labelledby="detalleCaja-label"><g:link controller="detalleCaja" action="show" id="${subDetalleCajaInstance?.detalleCaja?.id}">${subDetalleCajaInstance?.detalleCaja?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:subDetalleCajaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${subDetalleCajaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
