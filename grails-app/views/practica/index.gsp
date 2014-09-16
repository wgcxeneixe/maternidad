
<%@ page import="maternidad.Practica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'practica.label', default: 'Practica')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-practica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-practica" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'practica.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'practica.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="observacion" title="${message(code: 'practica.observacion.label', default: 'Observacion')}" />
					
						<g:sortableColumn property="nomenclada" title="${message(code: 'practica.nomenclada.label', default: 'Nomenclada')}" />
					
						<g:sortableColumn property="modulo" title="${message(code: 'practica.modulo.label', default: 'Modulo')}" />
					
						<g:sortableColumn property="multiplicadorHonorario" title="${message(code: 'practica.multiplicadorHonorario.label', default: 'Multiplicador Honorario')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${practicaInstanceList}" status="i" var="practicaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${practicaInstance.id}">${fieldValue(bean: practicaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: practicaInstance, field: "codigo")}</td>
					
						<td>${fieldValue(bean: practicaInstance, field: "observacion")}</td>
					
						<td><g:formatBoolean boolean="${practicaInstance.nomenclada}" /></td>
					
						<td><g:formatBoolean boolean="${practicaInstance.modulo}" /></td>
					
						<td>${fieldValue(bean: practicaInstance, field: "multiplicadorHonorario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${practicaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
