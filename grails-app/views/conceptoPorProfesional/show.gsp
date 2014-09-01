
<%@ page import="maternidad.ConceptoPorProfesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoPorProfesional.label', default: 'ConceptoPorProfesional')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conceptoPorProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conceptoPorProfesional" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conceptoPorProfesional">
			
				<g:if test="${conceptoPorProfesionalInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="conceptoPorProfesional.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${conceptoPorProfesionalInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoPorProfesionalInstance?.montoFijo}">
				<li class="fieldcontain">
					<span id="montoFijo-label" class="property-label"><g:message code="conceptoPorProfesional.montoFijo.label" default="Monto Fijo" /></span>
					
						<span class="property-value" aria-labelledby="montoFijo-label"><g:fieldValue bean="${conceptoPorProfesionalInstance}" field="montoFijo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoPorProfesionalInstance?.porcentaje}">
				<li class="fieldcontain">
					<span id="porcentaje-label" class="property-label"><g:message code="conceptoPorProfesional.porcentaje.label" default="Porcentaje" /></span>
					
						<span class="property-value" aria-labelledby="porcentaje-label"><g:fieldValue bean="${conceptoPorProfesionalInstance}" field="porcentaje"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoPorProfesionalInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="conceptoPorProfesional.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${conceptoPorProfesionalInstance?.usuario?.id}">${conceptoPorProfesionalInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoPorProfesionalInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="conceptoPorProfesional.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${conceptoPorProfesionalInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoPorProfesionalInstance?.conceptoLiquidacion}">
				<li class="fieldcontain">
					<span id="conceptoLiquidacion-label" class="property-label"><g:message code="conceptoPorProfesional.conceptoLiquidacion.label" default="Concepto Liquidacion" /></span>
					
						<span class="property-value" aria-labelledby="conceptoLiquidacion-label"><g:link controller="conceptoLiquidacion" action="show" id="${conceptoPorProfesionalInstance?.conceptoLiquidacion?.id}">${conceptoPorProfesionalInstance?.conceptoLiquidacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoPorProfesionalInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="conceptoPorProfesional.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${conceptoPorProfesionalInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoPorProfesionalInstance?.porUnicaVez}">
				<li class="fieldcontain">
					<span id="porUnicaVez-label" class="property-label"><g:message code="conceptoPorProfesional.porUnicaVez.label" default="Por Unica Vez" /></span>
					
						<span class="property-value" aria-labelledby="porUnicaVez-label"><g:formatBoolean boolean="${conceptoPorProfesionalInstance?.porUnicaVez}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoPorProfesionalInstance?.profesional}">
				<li class="fieldcontain">
					<span id="profesional-label" class="property-label"><g:message code="conceptoPorProfesional.profesional.label" default="Profesional" /></span>
					
						<span class="property-value" aria-labelledby="profesional-label"><g:link controller="profesional" action="show" id="${conceptoPorProfesionalInstance?.profesional?.id}">${conceptoPorProfesionalInstance?.profesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:conceptoPorProfesionalInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${conceptoPorProfesionalInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
