
<%@ page import="maternidad.PagoFactura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagoFactura.label', default: 'PagoFactura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pagoFactura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" controller="factura" action="abrirPagarFactura"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pagoFactura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="retencion" title="${message(code: 'pagoFactura.retencion.label', default: 'Retencion')}" />
					
						<g:sortableColumn property="aclaracionComprobante" title="${message(code: 'pagoFactura.aclaracionComprobante.label', default: 'Aclaracion Comprobante')}" />
					
						<th><g:message code="pagoFactura.factura.label" default="Factura" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'pagoFactura.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="pagoFactura.liquidacion.label" default="Liquidacion" /></th>
					
						<g:sortableColumn property="monto" title="${message(code: 'pagoFactura.monto.label', default: 'Monto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagoFacturaInstanceList}" status="i" var="pagoFacturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pagoFacturaInstance.id}">${fieldValue(bean: pagoFacturaInstance, field: "retencion")}</g:link></td>
					
						<td>${fieldValue(bean: pagoFacturaInstance, field: "aclaracionComprobante")}</td>
					
						<td>${fieldValue(bean: pagoFacturaInstance, field: "factura")}</td>
					
						<td><g:formatDate date="${pagoFacturaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: pagoFacturaInstance, field: "liquidacion")}</td>
					
						<td>${fieldValue(bean: pagoFacturaInstance, field: "monto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagoFacturaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
