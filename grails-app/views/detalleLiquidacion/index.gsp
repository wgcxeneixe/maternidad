
<%@ page import="maternidad.DetalleLiquidacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleLiquidacion.label', default: 'DetalleLiquidacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleLiquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleLiquidacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="detalleLiquidacion.conceptoPorProfesional.label" default="Concepto Por Profesional" /></th>
					
						<th><g:message code="detalleLiquidacion.conceptoProfesional.label" default="Concepto Profesional" /></th>
					
						<g:sortableColumn property="debito" title="${message(code: 'detalleLiquidacion.debito.label', default: 'Debito')}" />
					
						<g:sortableColumn property="detalle" title="${message(code: 'detalleLiquidacion.detalle.label', default: 'Detalle')}" />
					
						<th><g:message code="detalleLiquidacion.detalleFactura.label" default="Detalle Factura" /></th>
					
						<th><g:message code="detalleLiquidacion.liquidacion.label" default="Liquidacion" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleLiquidacionInstanceList}" status="i" var="detalleLiquidacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleLiquidacionInstance.id}">${fieldValue(bean: detalleLiquidacionInstance, field: "conceptoPorProfesional")}</g:link></td>
					
						<td>${fieldValue(bean: detalleLiquidacionInstance, field: "conceptoProfesional")}</td>
					
						<td><g:formatBoolean boolean="${detalleLiquidacionInstance.debito}" /></td>
					
						<td>${fieldValue(bean: detalleLiquidacionInstance, field: "detalle")}</td>
					
						<td>${fieldValue(bean: detalleLiquidacionInstance, field: "detalleFactura")}</td>
					
						<td>${fieldValue(bean: detalleLiquidacionInstance, field: "liquidacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleLiquidacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
