
<%@ page import="maternidad.ValorGalenoHonorario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valorGalenoHonorario.label', default: 'ValorGalenoHonorario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-valorGalenoHonorario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-valorGalenoHonorario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="valor" title="${message(code: 'valorGalenoHonorario.valor.label', default: 'Valor')}" />
					
						<th><g:message code="valorGalenoHonorario.tipoHonorario.label" default="Tipo Honorario" /></th>
					
						<th><g:message code="valorGalenoHonorario.planConvenio.label" default="Plan Convenio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${valorGalenoHonorarioInstanceList}" status="i" var="valorGalenoHonorarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${valorGalenoHonorarioInstance.id}">${fieldValue(bean: valorGalenoHonorarioInstance, field: "valor")}</g:link></td>
					
						<td>${fieldValue(bean: valorGalenoHonorarioInstance, field: "tipoHonorario")}</td>
					
						<td>${fieldValue(bean: valorGalenoHonorarioInstance, field: "planConvenio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${valorGalenoHonorarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
