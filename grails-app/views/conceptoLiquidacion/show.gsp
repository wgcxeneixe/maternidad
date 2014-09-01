
<%@ page import="maternidad.ConceptoLiquidacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoLiquidacion.label', default: 'ConceptoLiquidacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conceptoLiquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conceptoLiquidacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conceptoLiquidacion">
			
				<g:if test="${conceptoLiquidacionInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="conceptoLiquidacion.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${conceptoLiquidacionInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoLiquidacionInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="conceptoLiquidacion.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${conceptoLiquidacionInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoLiquidacionInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="conceptoLiquidacion.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${conceptoLiquidacionInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoLiquidacionInstance?.esMensual}">
				<li class="fieldcontain">
					<span id="esMensual-label" class="property-label"><g:message code="conceptoLiquidacion.esMensual.label" default="Es Mensual" /></span>
					
						<span class="property-value" aria-labelledby="esMensual-label"><g:formatBoolean boolean="${conceptoLiquidacionInstance?.esMensual}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoLiquidacionInstance?.credito}">
				<li class="fieldcontain">
					<span id="credito-label" class="property-label"><g:message code="conceptoLiquidacion.credito.label" default="Credito" /></span>
					
						<span class="property-value" aria-labelledby="credito-label"><g:formatBoolean boolean="${conceptoLiquidacionInstance?.credito}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoLiquidacionInstance?.montoFijo}">
				<li class="fieldcontain">
					<span id="montoFijo-label" class="property-label"><g:message code="conceptoLiquidacion.montoFijo.label" default="Monto Fijo" /></span>
					
						<span class="property-value" aria-labelledby="montoFijo-label"><g:fieldValue bean="${conceptoLiquidacionInstance}" field="montoFijo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoLiquidacionInstance?.porcentaje}">
				<li class="fieldcontain">
					<span id="porcentaje-label" class="property-label"><g:message code="conceptoLiquidacion.porcentaje.label" default="Porcentaje" /></span>
					
						<span class="property-value" aria-labelledby="porcentaje-label"><g:fieldValue bean="${conceptoLiquidacionInstance}" field="porcentaje"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoLiquidacionInstance?.aplicaSobreBruto}">
				<li class="fieldcontain">
					<span id="aplicaSobreBruto-label" class="property-label"><g:message code="conceptoLiquidacion.aplicaSobreBruto.label" default="Aplica Sobre Bruto" /></span>
					
						<span class="property-value" aria-labelledby="aplicaSobreBruto-label"><g:formatBoolean boolean="${conceptoLiquidacionInstance?.aplicaSobreBruto}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoLiquidacionInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="conceptoLiquidacion.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${conceptoLiquidacionInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:conceptoLiquidacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${conceptoLiquidacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
