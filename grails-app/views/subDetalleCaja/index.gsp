
<%@ page import="maternidad.SubDetalleCaja" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subDetalleCaja.label', default: 'SubDetalleCaja')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subDetalleCaja" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subDetalleCaja" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="subDetalleCaja.conceptocaja.label" default="Conceptocaja" /></th>
					
						<g:sortableColumn property="credito" title="${message(code: 'subDetalleCaja.credito.label', default: 'Credito')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'subDetalleCaja.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="observaciones" title="${message(code: 'subDetalleCaja.observaciones.label', default: 'Observaciones')}" />
					
						<th><g:message code="subDetalleCaja.usuario.label" default="Usuario" /></th>
					
						<th><g:message code="subDetalleCaja.detalleCaja.label" default="Detalle Caja" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subDetalleCajaInstanceList}" status="i" var="subDetalleCajaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subDetalleCajaInstance.id}">${fieldValue(bean: subDetalleCajaInstance, field: "conceptocaja")}</g:link></td>
					
						<td><g:formatBoolean boolean="${subDetalleCajaInstance.credito}" /></td>
					
						<td>${fieldValue(bean: subDetalleCajaInstance, field: "monto")}</td>
					
						<td>${fieldValue(bean: subDetalleCajaInstance, field: "observaciones")}</td>
					
						<td>${fieldValue(bean: subDetalleCajaInstance, field: "usuario")}</td>
					
						<td>${fieldValue(bean: subDetalleCajaInstance, field: "detalleCaja")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subDetalleCajaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
