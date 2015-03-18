
<%@ page import="maternidad.EnteReceptor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enteReceptor.label', default: 'EnteReceptor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-enteReceptor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-enteReceptor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list enteReceptor">
			
				<g:if test="${enteReceptorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="enteReceptor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${enteReceptorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enteReceptorInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="enteReceptor.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${enteReceptorInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enteReceptorInstance?.detallePracticasValorizado}">
				<li class="fieldcontain">
					<span id="detallePracticasValorizado-label" class="property-label"><g:message code="enteReceptor.detallePracticasValorizado.label" default="Detalle Practicas Valorizado" /></span>
					
						<span class="property-value" aria-labelledby="detallePracticasValorizado-label"><g:formatBoolean boolean="${enteReceptorInstance?.detallePracticasValorizado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${enteReceptorInstance?.llevaFactura}">
				<li class="fieldcontain">
					<span id="llevaFactura-label" class="property-label"><g:message code="enteReceptor.llevaFactura.label" default="Lleva Factura" /></span>
					
						<span class="property-value" aria-labelledby="llevaFactura-label"><g:formatBoolean boolean="${enteReceptorInstance?.llevaFactura}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${enteReceptorInstance?.obrasSociales}">
				<li class="fieldcontain">
					<span id="obrasSociales-label" class="property-label"><g:message code="enteReceptor.obrasSociales.label" default="Obras Sociales" /></span>
					
						<g:each in="${enteReceptorInstance.obrasSociales}" var="o">
						<span class="property-value" aria-labelledby="obrasSociales-label"><g:link controller="obraSocial" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${enteReceptorInstance?.pidePreAprobacion}">
				<li class="fieldcontain">
					<span id="pidePreAprobacion-label" class="property-label"><g:message code="enteReceptor.pidePreAprobacion.label" default="Pide Pre Aprobacion" /></span>
					
						<span class="property-value" aria-labelledby="pidePreAprobacion-label"><g:formatBoolean boolean="${enteReceptorInstance?.pidePreAprobacion}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:enteReceptorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${enteReceptorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
