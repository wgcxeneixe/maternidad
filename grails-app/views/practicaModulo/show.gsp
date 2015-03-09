
<%@ page import="maternidad.PracticaModulo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'practicaModulo.label', default: 'PracticaModulo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-practicaModulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-practicaModulo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list practicaModulo">
			
				<g:if test="${practicaModuloInstance?.valorGasto}">
				<li class="fieldcontain">
					<span id="valorGasto-label" class="property-label"><g:message code="practicaModulo.valorGasto.label" default="Valor Gasto" /></span>
					
						<span class="property-value" aria-labelledby="valorGasto-label"><g:fieldValue bean="${practicaModuloInstance}" field="valorGasto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${practicaModuloInstance?.valorAnestecista}">
				<li class="fieldcontain">
					<span id="valorAnestecista-label" class="property-label"><g:message code="practicaModulo.valorAnestecista.label" default="Valor Anestecista" /></span>
					
						<span class="property-value" aria-labelledby="valorAnestecista-label"><g:fieldValue bean="${practicaModuloInstance}" field="valorAnestecista"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${practicaModuloInstance?.valorAyudante}">
				<li class="fieldcontain">
					<span id="valorAyudante-label" class="property-label"><g:message code="practicaModulo.valorAyudante.label" default="Valor Ayudante" /></span>
					
						<span class="property-value" aria-labelledby="valorAyudante-label"><g:fieldValue bean="${practicaModuloInstance}" field="valorAyudante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${practicaModuloInstance?.valorEspecialista}">
				<li class="fieldcontain">
					<span id="valorEspecialista-label" class="property-label"><g:message code="practicaModulo.valorEspecialista.label" default="Valor Especialista" /></span>
					
						<span class="property-value" aria-labelledby="valorEspecialista-label"><g:fieldValue bean="${practicaModuloInstance}" field="valorEspecialista"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${practicaModuloInstance?.practica}">
				<li class="fieldcontain">
					<span id="practica-label" class="property-label"><g:message code="practicaModulo.practica.label" default="Practica" /></span>
					
						<span class="property-value" aria-labelledby="practica-label"><g:link controller="practica" action="show" id="${practicaModuloInstance?.practica?.id}">${practicaModuloInstance?.practica?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${practicaModuloInstance?.modulo}">
				<li class="fieldcontain">
					<span id="modulo-label" class="property-label"><g:message code="practicaModulo.modulo.label" default="Modulo" /></span>
					
						<span class="property-value" aria-labelledby="modulo-label"><g:link controller="practica" action="show" id="${practicaModuloInstance?.modulo?.id}">${practicaModuloInstance?.modulo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:practicaModuloInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${practicaModuloInstance}"><g:message code="default.button.editar.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
