
<%@ page import="maternidad.DetalleLiquidacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleLiquidacion.label', default: 'DetalleLiquidacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleLiquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleLiquidacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleLiquidacion">
			
				<g:if test="${detalleLiquidacionInstance?.conceptoPorProfesional}">
				<li class="fieldcontain">
					<span id="conceptoPorProfesional-label" class="property-label"><g:message code="detalleLiquidacion.conceptoPorProfesional.label" default="Concepto Por Profesional" /></span>
					
						<span class="property-value" aria-labelledby="conceptoPorProfesional-label"><g:link controller="conceptoPorProfesional" action="show" id="${detalleLiquidacionInstance?.conceptoPorProfesional?.id}">${detalleLiquidacionInstance?.conceptoPorProfesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.conceptoProfesional}">
				<li class="fieldcontain">
					<span id="conceptoProfesional-label" class="property-label"><g:message code="detalleLiquidacion.conceptoProfesional.label" default="Concepto Profesional" /></span>
					
						<span class="property-value" aria-labelledby="conceptoProfesional-label"><g:link controller="conceptoProfesional" action="show" id="${detalleLiquidacionInstance?.conceptoProfesional?.id}">${detalleLiquidacionInstance?.conceptoProfesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.debito}">
				<li class="fieldcontain">
					<span id="debito-label" class="property-label"><g:message code="detalleLiquidacion.debito.label" default="Debito" /></span>
					
						<span class="property-value" aria-labelledby="debito-label"><g:formatBoolean boolean="${detalleLiquidacionInstance?.debito}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.detalle}">
				<li class="fieldcontain">
					<span id="detalle-label" class="property-label"><g:message code="detalleLiquidacion.detalle.label" default="Detalle" /></span>
					
						<span class="property-value" aria-labelledby="detalle-label"><g:fieldValue bean="${detalleLiquidacionInstance}" field="detalle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.detalleFactura}">
				<li class="fieldcontain">
					<span id="detalleFactura-label" class="property-label"><g:message code="detalleLiquidacion.detalleFactura.label" default="Detalle Factura" /></span>
					
						<span class="property-value" aria-labelledby="detalleFactura-label"><g:link controller="detalleFactura" action="show" id="${detalleLiquidacionInstance?.detalleFactura?.id}">${detalleLiquidacionInstance?.detalleFactura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.liquidacion}">
				<li class="fieldcontain">
					<span id="liquidacion-label" class="property-label"><g:message code="detalleLiquidacion.liquidacion.label" default="Liquidacion" /></span>
					
						<span class="property-value" aria-labelledby="liquidacion-label"><g:link controller="liquidacion" action="show" id="${detalleLiquidacionInstance?.liquidacion?.id}">${detalleLiquidacionInstance?.liquidacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="detalleLiquidacion.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${detalleLiquidacionInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.pagoFactura}">
				<li class="fieldcontain">
					<span id="pagoFactura-label" class="property-label"><g:message code="detalleLiquidacion.pagoFactura.label" default="Pago Factura" /></span>
					
						<span class="property-value" aria-labelledby="pagoFactura-label"><g:link controller="pagoFactura" action="show" id="${detalleLiquidacionInstance?.pagoFactura?.id}">${detalleLiquidacionInstance?.pagoFactura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.porcentajePagoFacturaLiquidado}">
				<li class="fieldcontain">
					<span id="porcentajePagoFacturaLiquidado-label" class="property-label"><g:message code="detalleLiquidacion.porcentajePagoFacturaLiquidado.label" default="Porcentaje Pago Factura Liquidado" /></span>
					
						<span class="property-value" aria-labelledby="porcentajePagoFacturaLiquidado-label"><g:fieldValue bean="${detalleLiquidacionInstance}" field="porcentajePagoFacturaLiquidado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleLiquidacionInstance?.retencionPago}">
				<li class="fieldcontain">
					<span id="retencionPago-label" class="property-label"><g:message code="detalleLiquidacion.retencionPago.label" default="Retencion Pago" /></span>
					
						<span class="property-value" aria-labelledby="retencionPago-label"><g:link controller="retencionPago" action="show" id="${detalleLiquidacionInstance?.retencionPago?.id}">${detalleLiquidacionInstance?.retencionPago?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:detalleLiquidacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${detalleLiquidacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
