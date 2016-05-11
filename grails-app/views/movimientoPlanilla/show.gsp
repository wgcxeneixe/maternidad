
<%@ page import="maternidad.MovimientoPlanilla" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoPlanilla.label', default: 'MovimientoPlanilla')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-movimientoPlanilla" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movimientoPlanilla" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movimientoPlanilla">
			
				<g:if test="${movimientoPlanillaInstance?.estadoPlanilla}">
				<li class="fieldcontain">
					<span id="estadoPlanilla-label" class="property-label"><g:message code="movimientoPlanilla.estadoPlanilla.label" default="Estado Planilla" /></span>
					
						<span class="property-value" aria-labelledby="estadoPlanilla-label"><g:link controller="estadoPlanilla" action="show" id="${movimientoPlanillaInstance?.estadoPlanilla?.id}">${movimientoPlanillaInstance?.estadoPlanilla?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoPlanillaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="movimientoPlanilla.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${movimientoPlanillaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoPlanillaInstance?.planillaInternacion}">
				<li class="fieldcontain">
					<span id="planillaInternacion-label" class="property-label"><g:message code="movimientoPlanilla.planillaInternacion.label" default="Planilla Internacion" /></span>
					
						<span class="property-value" aria-labelledby="planillaInternacion-label"><g:link controller="planillaInternacion" action="show" id="${movimientoPlanillaInstance?.planillaInternacion?.id}">${movimientoPlanillaInstance?.planillaInternacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoPlanillaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="movimientoPlanilla.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${movimientoPlanillaInstance?.usuario?.id}">${movimientoPlanillaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:movimientoPlanillaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${movimientoPlanillaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
