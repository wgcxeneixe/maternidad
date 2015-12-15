
<%@ page import="maternidad.PagoFactura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagoFactura.label', default: 'PagoFactura')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pagoFactura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="show" action="show" controller="factura" id="${pagoFacturaInstance?.factura?.id}"><g:message code="default.list.label1" args="[entityName]" default="Volver a la Factura" /></g:link></li>
			</ul>
		</div>
		<div id="show-pagoFactura" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pagoFactura">
			
				<g:if test="${pagoFacturaInstance?.retencion}">
				<li class="fieldcontain">
					<span id="retencion-label" class="property-label"><g:message code="pagoFactura.retencion.label" default="Retencion" /></span>
					
						<span class="property-value" aria-labelledby="retencion-label"><g:fieldValue bean="${pagoFacturaInstance}" field="retencion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.aclaracionComprobante}">
				<li class="fieldcontain">
					<span id="aclaracionComprobante-label" class="property-label"><g:message code="pagoFactura.aclaracionComprobante.label" default="Aclaracion Comprobante" /></span>
					
						<span class="property-value" aria-labelledby="aclaracionComprobante-label"><g:fieldValue bean="${pagoFacturaInstance}" field="aclaracionComprobante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.factura}">
				<li class="fieldcontain">
					<span id="factura-label" class="property-label"><g:message code="pagoFactura.factura.label" default="Factura" /></span>
					
						<span class="property-value" aria-labelledby="factura-label"><g:link controller="factura" action="show" id="${pagoFacturaInstance?.factura?.id}">${pagoFacturaInstance?.factura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="pagoFactura.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${pagoFacturaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.liquidacion}">
				<li class="fieldcontain">
					<span id="liquidacion-label" class="property-label"><g:message code="pagoFactura.liquidacion.label" default="Liquidacion" /></span>
					
						<span class="property-value" aria-labelledby="liquidacion-label"><g:link controller="liquidacion" action="show" id="${pagoFacturaInstance?.liquidacion?.id}">${pagoFacturaInstance?.liquidacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="pagoFactura.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${pagoFacturaInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.numeroComprobante}">
				<li class="fieldcontain">
					<span id="numeroComprobante-label" class="property-label"><g:message code="pagoFactura.numeroComprobante.label" default="Numero Comprobante" /></span>
					
						<span class="property-value" aria-labelledby="numeroComprobante-label"><g:fieldValue bean="${pagoFacturaInstance}" field="numeroComprobante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.porcentajeALiquidar}">
				<li class="fieldcontain">
					<span id="porcentajeALiquidar-label" class="property-label"><g:message code="pagoFactura.porcentajeALiquidar.label" default="Porcentaje AL iquidar" /></span>
					
						<span class="property-value" aria-labelledby="porcentajeALiquidar-label"><g:fieldValue bean="${pagoFacturaInstance}" field="porcentajeALiquidar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.porcentajeLiquidado}">
				<li class="fieldcontain">
					<span id="porcentajeLiquidado-label" class="property-label"><g:message code="pagoFactura.porcentajeLiquidado.label" default="Porcentaje Liquidado" /></span>
					
						<span class="property-value" aria-labelledby="porcentajeLiquidado-label"><g:fieldValue bean="${pagoFacturaInstance}" field="porcentajeLiquidado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.retencionPagos}">
				<li class="fieldcontain">
					<span id="retencionPagos-label" class="property-label"><g:message code="pagoFactura.retencionPagos.label" default="Retencion Pagos" /></span>
					
						<g:each in="${pagoFacturaInstance.retencionPagos}" var="r">
						<span class="property-value" aria-labelledby="retencionPagos-label"><g:link controller="retencionPago" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${pagoFacturaInstance?.tipoPago}">
				<li class="fieldcontain">
					<span id="tipoPago-label" class="property-label"><g:message code="pagoFactura.tipoPago.label" default="Tipo Pago" /></span>
					
						<span class="property-value" aria-labelledby="tipoPago-label"><g:link controller="tipoPago" action="show" id="${pagoFacturaInstance?.tipoPago?.id}">${pagoFacturaInstance?.tipoPago?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			%{--<g:form url="[resource:pagoFacturaInstance, action:'delete']" method="DELETE">--}%
				%{--<fieldset class="buttons">--}%
					%{--<g:link class="edit" action="edit" resource="${pagoFacturaInstance}"><g:message code="default.button.editar.label" default="Edit" /></g:link>--}%
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				%{--</fieldset>--}%
			%{--</g:form>--}%
		</div>
	<div class="list" id="divListaRetenciones">
		<g:render template="listaRetenciones"
				  model="['retencionPagoInstanceList': pagoFacturaInstance?.retencionPagos, pagoFacturaInstance: pagoFacturaInstance]"/>

	</div>
	</body>
</html>
