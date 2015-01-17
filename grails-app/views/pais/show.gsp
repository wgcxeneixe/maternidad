
<%@ page import="maternidad.Pais" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pais.label', default: 'Pais')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pais" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pais" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pais">
			
				<g:if test="${paisInstance?.abreviatura}">
				<li class="fieldcontain">
					<span id="abreviatura-label" class="property-label"><g:message code="pais.abreviatura.label" default="Abreviatura" /></span>
					
						<span class="property-value" aria-labelledby="abreviatura-label"><g:fieldValue bean="${paisInstance}" field="abreviatura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="pais.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${paisInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.frecuente}">
				<li class="fieldcontain">
					<span id="frecuente-label" class="property-label"><g:message code="pais.frecuente.label" default="Frecuente" /></span>
					
						<span class="property-value" aria-labelledby="frecuente-label"><g:formatBoolean boolean="${paisInstance?.frecuente}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.gentilicio}">
				<li class="fieldcontain">
					<span id="gentilicio-label" class="property-label"><g:message code="pais.gentilicio.label" default="Gentilicio" /></span>
					
						<span class="property-value" aria-labelledby="gentilicio-label"><g:fieldValue bean="${paisInstance}" field="gentilicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="pais.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${paisInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.provincias}">
				<li class="fieldcontain">
					<span id="provincias-label" class="property-label"><g:message code="pais.provincias.label" default="Provincias" /></span>
					
						<g:each in="${paisInstance.provincias}" var="p">
						<span class="property-value" aria-labelledby="provincias-label"><g:link controller="provincia" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:paisInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${paisInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
