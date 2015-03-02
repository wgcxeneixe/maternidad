
<%@ page import="contabilidad.Movimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimiento.label', default: 'Movimiento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-movimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movimiento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movimiento">
			
				<g:if test="${movimientoInstance?.debe}">
				<li class="fieldcontain">
					<span id="debe-label" class="property-label"><g:message code="movimiento.debe.label" default="Debe" /></span>
					
						<span class="property-value" aria-labelledby="debe-label"><g:fieldValue bean="${movimientoInstance}" field="debe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoInstance?.haber}">
				<li class="fieldcontain">
					<span id="haber-label" class="property-label"><g:message code="movimiento.haber.label" default="Haber" /></span>
					
						<span class="property-value" aria-labelledby="haber-label"><g:fieldValue bean="${movimientoInstance}" field="haber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoInstance?.asiento}">
				<li class="fieldcontain">
					<span id="asiento-label" class="property-label"><g:message code="movimiento.asiento.label" default="Asiento" /></span>
					
						<span class="property-value" aria-labelledby="asiento-label"><g:link controller="asiento" action="show" id="${movimientoInstance?.asiento?.id}">${movimientoInstance?.asiento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoInstance?.cuenta}">
				<li class="fieldcontain">
					<span id="cuenta-label" class="property-label"><g:message code="movimiento.cuenta.label" default="Cuenta" /></span>
					
						<span class="property-value" aria-labelledby="cuenta-label"><g:link controller="cuenta" action="show" id="${movimientoInstance?.cuenta?.id}">${movimientoInstance?.cuenta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="movimiento.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${movimientoInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="movimiento.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${movimientoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:movimientoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${movimientoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
