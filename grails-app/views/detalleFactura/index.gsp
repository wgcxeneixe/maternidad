
<%@ page import="maternidad.DetalleFactura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleFactura.label', default: 'DetalleFactura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleFactura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleFactura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="detalleFactura.profesional.label" default="Profesional" /></th>
					
						<th><g:message code="detalleFactura.plan.label" default="Plan" /></th>
					
						<th><g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'detalleFactura.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="carreraMedica" title="${message(code: 'detalleFactura.carreraMedica.label', default: 'Carrera Medica')}" />
					
						<th><g:message code="detalleFactura.factura.label" default="Factura" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleFacturaInstanceList}" status="i" var="detalleFacturaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleFacturaInstance.id}">${fieldValue(bean: detalleFacturaInstance, field: "profesional")}</g:link></td>
					
						<td>${fieldValue(bean: detalleFacturaInstance, field: "plan")}</td>
					
						<td>${fieldValue(bean: detalleFacturaInstance, field: "planillaInternacion")}</td>
					
						<td>${fieldValue(bean: detalleFacturaInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: detalleFacturaInstance, field: "carreraMedica")}</td>
					
						<td>${fieldValue(bean: detalleFacturaInstance, field: "factura")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleFacturaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
