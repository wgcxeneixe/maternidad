
<%@ page import="maternidad.Profesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesional.label', default: 'Profesional')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profesional" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profesional">
			
				<g:if test="${profesionalInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="profesional.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${profesionalInstance?.persona?.id}">${profesionalInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="profesional.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${profesionalInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.matriculaProvincial}">
				<li class="fieldcontain">
					<span id="matriculaProvincial-label" class="property-label"><g:message code="profesional.matriculaProvincial.label" default="Matricula Provincial" /></span>
					
						<span class="property-value" aria-labelledby="matriculaProvincial-label"><g:fieldValue bean="${profesionalInstance}" field="matriculaProvincial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.fechaMatriculacion}">
				<li class="fieldcontain">
					<span id="fechaMatriculacion-label" class="property-label"><g:message code="profesional.fechaMatriculacion.label" default="Fecha Matriculacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaMatriculacion-label"><g:formatDate date="${profesionalInstance?.fechaMatriculacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.cbu}">
				<li class="fieldcontain">
					<span id="cbu-label" class="property-label"><g:message code="profesional.cbu.label" default="Cbu" /></span>
					
						<span class="property-value" aria-labelledby="cbu-label"><g:fieldValue bean="${profesionalInstance}" field="cbu"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.banco}">
				<li class="fieldcontain">
					<span id="banco-label" class="property-label"><g:message code="profesional.banco.label" default="Banco" /></span>
					
						<span class="property-value" aria-labelledby="banco-label"><g:link controller="banco" action="show" id="${profesionalInstance?.banco?.id}">${profesionalInstance?.banco?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesionalInstance?.listaConceptos}">
				<li class="fieldcontain">
					<span id="listaConceptos-label" class="property-label"><g:message code="profesional.listaConceptos.label" default="Lista Conceptos" /></span>
					
						<g:each in="${profesionalInstance.listaConceptos}" var="l">
						<span class="property-value" aria-labelledby="listaConceptos-label"><g:link controller="conceptoPorProfesional" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:profesionalInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${profesionalInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
