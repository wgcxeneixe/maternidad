
<%@ page import="maternidad.DetalleRecibo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleRecibo.label', default: 'DetalleRecibo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleRecibo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleRecibo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="detalleRecibo.conceptoProfesional.label" default="Concepto Profesional" /></th>
					
						<g:sortableColumn property="valor" title="${message(code: 'detalleRecibo.valor.label', default: 'Valor')}" />
					
						<g:sortableColumn property="debitoCredito" title="${message(code: 'detalleRecibo.debitoCredito.label', default: 'Debito Credito')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleReciboInstanceList}" status="i" var="detalleReciboInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleReciboInstance.id}">${fieldValue(bean: detalleReciboInstance, field: "conceptoProfesional")}</g:link></td>
					
						<td>${fieldValue(bean: detalleReciboInstance, field: "valor")}</td>
					
						<td><g:formatBoolean boolean="${detalleReciboInstance.debitoCredito}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleReciboInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
