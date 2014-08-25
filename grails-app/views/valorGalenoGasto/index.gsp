
<%@ page import="maternidad.ValorGalenoGasto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valorGalenoGasto.label', default: 'ValorGalenoGasto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-valorGalenoGasto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-valorGalenoGasto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="valor" title="${message(code: 'valorGalenoGasto.valor.label', default: 'Valor')}" />
					
						<th><g:message code="valorGalenoGasto.tipoGasto.label" default="Tipo Gasto" /></th>
					
						<th><g:message code="valorGalenoGasto.planConvenio.label" default="Plan Convenio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${valorGalenoGastoInstanceList}" status="i" var="valorGalenoGastoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${valorGalenoGastoInstance.id}">${fieldValue(bean: valorGalenoGastoInstance, field: "valor")}</g:link></td>
					
						<td>${fieldValue(bean: valorGalenoGastoInstance, field: "tipoGasto")}</td>
					
						<td>${fieldValue(bean: valorGalenoGastoInstance, field: "planConvenio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${valorGalenoGastoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
