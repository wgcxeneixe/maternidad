
<%@ page import="maternidad.DetalleRecibo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleRecibo.label', default: 'DetalleRecibo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleRecibo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleRecibo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleRecibo">
			
				<g:if test="${detalleReciboInstance?.conceptoProfesional}">
				<li class="fieldcontain">
					<span id="conceptoProfesional-label" class="property-label"><g:message code="detalleRecibo.conceptoProfesional.label" default="Concepto Profesional" /></span>
					
						<span class="property-value" aria-labelledby="conceptoProfesional-label"><g:link controller="conceptoProfesional" action="show" id="${detalleReciboInstance?.conceptoProfesional?.id}">${detalleReciboInstance?.conceptoProfesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleReciboInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="detalleRecibo.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${detalleReciboInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleReciboInstance?.debitoCredito}">
				<li class="fieldcontain">
					<span id="debitoCredito-label" class="property-label"><g:message code="detalleRecibo.debitoCredito.label" default="Debito Credito" /></span>
					
						<span class="property-value" aria-labelledby="debitoCredito-label"><g:formatBoolean boolean="${detalleReciboInstance?.debitoCredito}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:detalleReciboInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${detalleReciboInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
