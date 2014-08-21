
<%@ page import="maternidad.ObraSocial" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'obraSocial.label', default: 'ObraSocial')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-obraSocial" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-obraSocial" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list obraSocial">
			
				<g:if test="${obraSocialInstance?.sigla}">
				<li class="fieldcontain">
					<span id="sigla-label" class="property-label"><g:message code="obraSocial.sigla.label" default="Sigla" /></span>
					
						<span class="property-value" aria-labelledby="sigla-label"><g:fieldValue bean="${obraSocialInstance}" field="sigla"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraSocialInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="obraSocial.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${obraSocialInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraSocialInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="obraSocial.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${obraSocialInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraSocialInstance?.cuit}">
				<li class="fieldcontain">
					<span id="cuit-label" class="property-label"><g:message code="obraSocial.cuit.label" default="Cuit" /></span>
					
						<span class="property-value" aria-labelledby="cuit-label"><g:fieldValue bean="${obraSocialInstance}" field="cuit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraSocialInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="obraSocial.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${obraSocialInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraSocialInstance?.activa}">
				<li class="fieldcontain">
					<span id="activa-label" class="property-label"><g:message code="obraSocial.activa.label" default="Activa" /></span>
					
						<span class="property-value" aria-labelledby="activa-label"><g:formatBoolean boolean="${obraSocialInstance?.activa}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraSocialInstance?.convenios}">
				<li class="fieldcontain">
					<span id="convenios-label" class="property-label"><g:message code="obraSocial.convenios.label" default="Convenios" /></span>
					
						<g:each in="${obraSocialInstance.convenios}" var="c">
						<span class="property-value" aria-labelledby="convenios-label"><g:link controller="convenio" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${obraSocialInstance?.planes}">
				<li class="fieldcontain">
					<span id="planes-label" class="property-label"><g:message code="obraSocial.planes.label" default="Planes" /></span>
					
						<g:each in="${obraSocialInstance.planes}" var="p">
						<span class="property-value" aria-labelledby="planes-label"><g:link controller="plan" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${obraSocialInstance?.practicas}">
				<li class="fieldcontain">
					<span id="practicas-label" class="property-label"><g:message code="obraSocial.practicas.label" default="Practicas" /></span>
					
						<g:each in="${obraSocialInstance.practicas}" var="p">
						<span class="property-value" aria-labelledby="practicas-label"><g:link controller="practica" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:obraSocialInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${obraSocialInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
