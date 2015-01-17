
<%@ page import="maternidad.ValorPractica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valorPractica.label', default: 'ValorPractica')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-valorPractica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-valorPractica" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="valorGasto" title="${message(code: 'valorPractica.valorGasto.label', default: 'Valor Gasto')}" />
					
						<g:sortableColumn property="valorHonorario" title="${message(code: 'valorPractica.valorHonorario.label', default: 'Valor Honorario')}" />
					
						<g:sortableColumn property="valorAnestecista" title="${message(code: 'valorPractica.valorAnestecista.label', default: 'Valor Anestecista')}" />
					
						<g:sortableColumn property="valorAyudante" title="${message(code: 'valorPractica.valorAyudante.label', default: 'Valor Ayudante')}" />
					
						<g:sortableColumn property="valorEspecialista" title="${message(code: 'valorPractica.valorEspecialista.label', default: 'Valor Especialista')}" />
					
						<th><g:message code="valorPractica.practica.label" default="Practica" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${valorPracticaInstanceList}" status="i" var="valorPracticaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${valorPracticaInstance.id}">${fieldValue(bean: valorPracticaInstance, field: "valorGasto")}</g:link></td>
					
						<td>${fieldValue(bean: valorPracticaInstance, field: "valorHonorario")}</td>
					
						<td>${fieldValue(bean: valorPracticaInstance, field: "valorAnestecista")}</td>
					
						<td>${fieldValue(bean: valorPracticaInstance, field: "valorAyudante")}</td>
					
						<td>${fieldValue(bean: valorPracticaInstance, field: "valorEspecialista")}</td>
					
						<td>${fieldValue(bean: valorPracticaInstance, field: "practica")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${valorPracticaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
