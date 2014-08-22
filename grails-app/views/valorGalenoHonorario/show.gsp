
<%@ page import="maternidad.ValorGalenoHonorario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valorGalenoHonorario.label', default: 'ValorGalenoHonorario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-valorGalenoHonorario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-valorGalenoHonorario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list valorGalenoHonorario">
			
				<g:if test="${valorGalenoHonorarioInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="valorGalenoHonorario.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${valorGalenoHonorarioInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorGalenoHonorarioInstance?.tipoHonorario}">
				<li class="fieldcontain">
					<span id="tipoHonorario-label" class="property-label"><g:message code="valorGalenoHonorario.tipoHonorario.label" default="Tipo Honorario" /></span>
					
						<span class="property-value" aria-labelledby="tipoHonorario-label"><g:link controller="tipoHonorario" action="show" id="${valorGalenoHonorarioInstance?.tipoHonorario?.id}">${valorGalenoHonorarioInstance?.tipoHonorario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorGalenoHonorarioInstance?.planConvenio}">
				<li class="fieldcontain">
					<span id="planConvenio-label" class="property-label"><g:message code="valorGalenoHonorario.planConvenio.label" default="Plan Convenio" /></span>
					
						<span class="property-value" aria-labelledby="planConvenio-label"><g:link controller="planConvenio" action="show" id="${valorGalenoHonorarioInstance?.planConvenio?.id}">${valorGalenoHonorarioInstance?.planConvenio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:valorGalenoHonorarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${valorGalenoHonorarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
