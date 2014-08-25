
<%@ page import="maternidad.ValorGalenoGasto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valorGalenoGasto.label', default: 'ValorGalenoGasto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-valorGalenoGasto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-valorGalenoGasto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list valorGalenoGasto">
			
				<g:if test="${valorGalenoGastoInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="valorGalenoGasto.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${valorGalenoGastoInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorGalenoGastoInstance?.tipoGasto}">
				<li class="fieldcontain">
					<span id="tipoGasto-label" class="property-label"><g:message code="valorGalenoGasto.tipoGasto.label" default="Tipo Gasto" /></span>
					
						<span class="property-value" aria-labelledby="tipoGasto-label"><g:link controller="tipoGasto" action="show" id="${valorGalenoGastoInstance?.tipoGasto?.id}">${valorGalenoGastoInstance?.tipoGasto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorGalenoGastoInstance?.planConvenio}">
				<li class="fieldcontain">
					<span id="planConvenio-label" class="property-label"><g:message code="valorGalenoGasto.planConvenio.label" default="Plan Convenio" /></span>
					
						<span class="property-value" aria-labelledby="planConvenio-label"><g:link controller="planConvenio" action="show" id="${valorGalenoGastoInstance?.planConvenio?.id}">${valorGalenoGastoInstance?.planConvenio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:valorGalenoGastoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${valorGalenoGastoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
