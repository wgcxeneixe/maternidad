
<%@ page import="maternidad.Banco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'banco.label', default: 'Banco')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-banco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-banco" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'banco.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="activo" title="${message(code: 'banco.activo.label', default: 'Activo')}" />

                       <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${bancoInstanceList}" status="i" var="bancoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: bancoInstance, field: "nombre")}</td>
					
						<td><g:formatBoolean boolean="${bancoInstance.activo}" /></td>

                        <td><g:link class="linkEdit" action="edit" id="${bancoInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                        <td><g:link class="linkShow" action="show" id="${bancoInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>

                        <td><g:link controller="movimientoBanco" action="create" id="${bancoInstance.id}">${message(code: 'banco.agregarMovimiento')}</g:link></td>

                        <td><g:link controller="movimientoBanco" action="cuentaCorriente" id="${bancoInstance.id}">${message(code: 'banco.cuentacorriente')}</g:link></td>

						</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bancoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
