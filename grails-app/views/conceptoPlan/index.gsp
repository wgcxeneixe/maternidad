
<%@ page import="maternidad.ConceptoPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoPlan.label', default: 'ConceptoPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conceptoPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conceptoPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'conceptoPlan.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'conceptoPlan.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'conceptoPlan.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="activo" title="${message(code: 'conceptoPlan.activo.label', default: 'Activo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoPlanInstanceList}" status="i" var="conceptoPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoPlanInstance.id}">${fieldValue(bean: conceptoPlanInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: conceptoPlanInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: conceptoPlanInstance, field: "descripcion")}</td>
					
						<td><g:formatBoolean boolean="${conceptoPlanInstance.activo}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoPlanInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
