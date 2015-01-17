
<%@ page import="maternidad.ComponenteTipoHonorario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'componenteTipoHonorario.label', default: 'ComponenteTipoHonorario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-componenteTipoHonorario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-componenteTipoHonorario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="componenteTipoHonorario.componente.label" default="Componente" /></th>
					
						<th><g:message code="componenteTipoHonorario.tipoHonorario.label" default="Tipo Honorario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${componenteTipoHonorarioInstanceList}" status="i" var="componenteTipoHonorarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${componenteTipoHonorarioInstance.id}">${fieldValue(bean: componenteTipoHonorarioInstance, field: "componente")}</g:link></td>
					
						<td>${fieldValue(bean: componenteTipoHonorarioInstance, field: "tipoHonorario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${componenteTipoHonorarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
