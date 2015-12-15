
<%@ page import="maternidad.ReciboMaternidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recibo.label', default: 'Recibo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recibo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recibo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recibo">
			
				<g:if test="${reciboInstance?.nro}">
				<li class="fieldcontain">
					<span id="nro-label" class="property-label"><g:message code="recibo.nro.label" default="Nro" /></span>
					
						<span class="property-value" aria-labelledby="nro-label"><g:fieldValue bean="${reciboInstance}" field="nro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reciboInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="recibo.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${reciboInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reciboInstance?.profesional}">
				<li class="fieldcontain">
					<span id="profesional-label" class="property-label"><g:message code="recibo.profesional.label" default="Profesional" /></span>
					
						<span class="property-value" aria-labelledby="profesional-label"><g:link controller="profesional" action="show" id="${reciboInstance?.profesional?.id}">${reciboInstance?.profesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reciboInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="recibo.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${reciboInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reciboInstance?.detalle}">
				<li class="fieldcontain">
					<span id="detalle-label" class="property-label"><g:message code="recibo.detalle.label" default="Detalle" /></span>
					
						<g:each in="${reciboInstance.detalle}" var="d">
						<span class="property-value" aria-labelledby="detalle-label"><g:link controller="detalleRecibo" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:reciboInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reciboInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
