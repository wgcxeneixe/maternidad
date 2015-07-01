
<%@ page import="facturaElectronica.DetalleFacturaElectronica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleFacturaElectronica.label', default: 'DetalleFacturaElectronica')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleFacturaElectronica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleFacturaElectronica" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'detalleFacturaElectronica.cantidad.label', default: 'Cantidad')}" />
					
						<th><g:message code="detalleFacturaElectronica.concepto.label" default="Concepto" /></th>
					
						<th><g:message code="detalleFacturaElectronica.factura.label" default="Factura" /></th>
					
						<g:sortableColumn property="nombre" title="${message(code: 'detalleFacturaElectronica.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'detalleFacturaElectronica.valor.label', default: 'Valor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleFacturaElectronicaInstanceList}" status="i" var="detalleFacturaElectronicaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleFacturaElectronicaInstance.id}">${fieldValue(bean: detalleFacturaElectronicaInstance, field: "cantidad")}</g:link></td>
					
						<td>${fieldValue(bean: detalleFacturaElectronicaInstance, field: "concepto")}</td>
					
						<td>${fieldValue(bean: detalleFacturaElectronicaInstance, field: "factura")}</td>
					
						<td>${fieldValue(bean: detalleFacturaElectronicaInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: detalleFacturaElectronicaInstance, field: "valor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleFacturaElectronicaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
