
<%@ page import="maternidad.PracticaModulo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'practicaModulo.label', default: 'PracticaModulo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-practicaModulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-practicaModulo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="valorGasto" title="${message(code: 'practicaModulo.valorGasto.label', default: 'Valor Gasto')}" />
					
						<g:sortableColumn property="valorAnestecista" title="${message(code: 'practicaModulo.valorAnestecista.label', default: 'Valor Anestecista')}" />
					
						<g:sortableColumn property="valorAyudante" title="${message(code: 'practicaModulo.valorAyudante.label', default: 'Valor Ayudante')}" />
					
						<g:sortableColumn property="valorEspecialista" title="${message(code: 'practicaModulo.valorEspecialista.label', default: 'Valor Especialista')}" />
					
						<th><g:message code="practicaModulo.practica.label" default="Practica" /></th>
					
						<th><g:message code="practicaModulo.modulo.label" default="Modulo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${practicaModuloInstanceList}" status="i" var="practicaModuloInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${practicaModuloInstance.id}">${fieldValue(bean: practicaModuloInstance, field: "valorGasto")}</g:link></td>
					
						<td>${fieldValue(bean: practicaModuloInstance, field: "valorAnestecista")}</td>
					
						<td>${fieldValue(bean: practicaModuloInstance, field: "valorAyudante")}</td>
					
						<td>${fieldValue(bean: practicaModuloInstance, field: "valorEspecialista")}</td>
					
						<td>${fieldValue(bean: practicaModuloInstance, field: "practica")}</td>
					
						<td>${fieldValue(bean: practicaModuloInstance, field: "modulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${practicaModuloInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
