
<%@ page import="maternidad.Convenio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'convenio.label', default: 'Convenio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-convenio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-convenio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list convenio">
			
				<g:if test="${convenioInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="convenio.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${convenioInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.obrasocial}">
				<li class="fieldcontain">
					<span id="obrasocial-label" class="property-label"><g:message code="convenio.obrasocial.label" default="Obrasocial" /></span>
					
						<span class="property-value" aria-labelledby="obrasocial-label"><g:link controller="obraSocial" action="show" id="${convenioInstance?.obrasocial?.id}">${convenioInstance?.obrasocial?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="convenio.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${convenioInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="convenio.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate date="${convenioInstance?.fechaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="convenio.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${convenioInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="convenio.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${convenioInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:convenioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${convenioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
