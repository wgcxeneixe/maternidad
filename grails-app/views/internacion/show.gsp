
<%@ page import="maternidad.Internacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'internacion.label', default: 'Internacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-internacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-internacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list internacion">
			
				<g:if test="${internacionInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="internacion.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${internacionInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${internacionInstance?.sector}">
				<li class="fieldcontain">
					<span id="sector-label" class="property-label"><g:message code="internacion.sector.label" default="Sector" /></span>
					
						<span class="property-value" aria-labelledby="sector-label"><g:link controller="sector" action="show" id="${internacionInstance?.sector?.id}">${internacionInstance?.sector?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${internacionInstance?.tipoPension}">
				<li class="fieldcontain">
					<span id="tipoPension-label" class="property-label"><g:message code="internacion.tipoPension.label" default="Tipo Pension" /></span>
					
						<span class="property-value" aria-labelledby="tipoPension-label"><g:fieldValue bean="${internacionInstance}" field="tipoPension"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${internacionInstance?.diasInternacion}">
				<li class="fieldcontain">
					<span id="diasInternacion-label" class="property-label"><g:message code="internacion.diasInternacion.label" default="Dias Internacion" /></span>
					
						<span class="property-value" aria-labelledby="diasInternacion-label"><g:fieldValue bean="${internacionInstance}" field="diasInternacion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:internacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${internacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
