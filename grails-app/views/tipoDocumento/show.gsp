
<%@ page import="maternidad.TipoDocumento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoDocumento.label', default: 'TipoDocumento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoDocumento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoDocumento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoDocumento">
			
				<g:if test="${tipoDocumentoInstance?.entidadEmisora}">
				<li class="fieldcontain">
					<span id="entidadEmisora-label" class="property-label"><g:message code="tipoDocumento.entidadEmisora.label" default="Entidad Emisora" /></span>
					
						<span class="property-value" aria-labelledby="entidadEmisora-label"><g:fieldValue bean="${tipoDocumentoInstance}" field="entidadEmisora"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDocumentoInstance?.aclaracion}">
				<li class="fieldcontain">
					<span id="aclaracion-label" class="property-label"><g:message code="tipoDocumento.aclaracion.label" default="Aclaracion" /></span>
					
						<span class="property-value" aria-labelledby="aclaracion-label"><g:fieldValue bean="${tipoDocumentoInstance}" field="aclaracion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDocumentoInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="tipoDocumento.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${tipoDocumentoInstance?.pais?.id}">${tipoDocumentoInstance?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDocumentoInstance?.prioridad}">
				<li class="fieldcontain">
					<span id="prioridad-label" class="property-label"><g:message code="tipoDocumento.prioridad.label" default="Prioridad" /></span>
					
						<span class="property-value" aria-labelledby="prioridad-label"><g:fieldValue bean="${tipoDocumentoInstance}" field="prioridad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDocumentoInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="tipoDocumento.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${tipoDocumentoInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDocumentoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="tipoDocumento.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tipoDocumentoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDocumentoInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="tipoDocumento.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${tipoDocumentoInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoDocumentoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="tipoDocumento.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tipoDocumentoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tipoDocumentoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tipoDocumentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
