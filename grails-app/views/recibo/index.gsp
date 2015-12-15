
<%@ page import="maternidad.ReciboMaternidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recibo.label', default: 'Recibo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recibo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recibo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nro" title="${message(code: 'recibo.nro.label', default: 'Nro')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'recibo.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="recibo.profesional.label" default="Profesional" /></th>
					
						<g:sortableColumn property="total" title="${message(code: 'recibo.total.label', default: 'Total')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reciboInstanceList}" status="i" var="reciboInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reciboInstance.id}">${fieldValue(bean: reciboInstance, field: "nro")}</g:link></td>
					
						<td><g:formatDate date="${reciboInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: reciboInstance, field: "profesional")}</td>
					
						<td>${fieldValue(bean: reciboInstance, field: "total")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reciboInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
