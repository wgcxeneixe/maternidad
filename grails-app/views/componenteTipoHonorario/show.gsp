
<%@ page import="maternidad.ComponenteTipoHonorario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'componenteTipoHonorario.label', default: 'ComponenteTipoHonorario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-componenteTipoHonorario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-componenteTipoHonorario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list componenteTipoHonorario">
			
				<g:if test="${componenteTipoHonorarioInstance?.componente}">
				<li class="fieldcontain">
					<span id="componente-label" class="property-label"><g:message code="componenteTipoHonorario.componente.label" default="Componente" /></span>
					
						<span class="property-value" aria-labelledby="componente-label"><g:link controller="componente" action="show" id="${componenteTipoHonorarioInstance?.componente?.id}">${componenteTipoHonorarioInstance?.componente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${componenteTipoHonorarioInstance?.tipoHonorario}">
				<li class="fieldcontain">
					<span id="tipoHonorario-label" class="property-label"><g:message code="componenteTipoHonorario.tipoHonorario.label" default="Tipo Honorario" /></span>
					
						<span class="property-value" aria-labelledby="tipoHonorario-label"><g:link controller="tipoHonorario" action="show" id="${componenteTipoHonorarioInstance?.tipoHonorario?.id}">${componenteTipoHonorarioInstance?.tipoHonorario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:componenteTipoHonorarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${componenteTipoHonorarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
