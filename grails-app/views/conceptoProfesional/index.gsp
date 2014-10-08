
<%@ page import="maternidad.ConceptoProfesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoProfesional.label', default: 'ConceptoProfesional')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conceptoProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conceptoProfesional" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="observacion" title="${message(code: 'conceptoProfesional.observacion.label', default: 'Observacion')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'conceptoProfesional.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'conceptoProfesional.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="esMensual" title="${message(code: 'conceptoProfesional.esMensual.label', default: 'Es Mensual')}" />
					
						<g:sortableColumn property="credito" title="${message(code: 'conceptoProfesional.credito.label', default: 'Credito')}" />
					
						<g:sortableColumn property="montoFijo" title="${message(code: 'conceptoProfesional.montoFijo.label', default: 'Monto Fijo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoProfesionalInstanceList}" status="i" var="conceptoProfesionalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoProfesionalInstance.id}">${fieldValue(bean: conceptoProfesionalInstance, field: "observacion")}</g:link></td>
					
						<td>${fieldValue(bean: conceptoProfesionalInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: conceptoProfesionalInstance, field: "codigo")}</td>
					
						<td><g:formatBoolean boolean="${conceptoProfesionalInstance.esMensual}" /></td>
					
						<td><g:formatBoolean boolean="${conceptoProfesionalInstance.credito}" /></td>
					
						<td>${fieldValue(bean: conceptoProfesionalInstance, field: "montoFijo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoProfesionalInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
