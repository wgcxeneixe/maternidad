
<%@ page import="contabilidad.Movimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimiento.label', default: 'Movimiento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-movimiento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

                        <th><g:message code="movimiento.asiento.label" default="Asiento" /></th>

                        <g:sortableColumn property="fecha" title="${message(code: 'movimiento.fecha.label', default: 'Fecha')}" />

                        <th><g:message code="movimiento.cuenta.label" default="Cuenta" /></th>

                        <g:sortableColumn property="descripcion" title="${message(code: 'movimiento.descripcion.label', default: 'Descripcion')}" />

                        <g:sortableColumn property="debe" title="${message(code: 'movimiento.debe.label', default: 'Debe')}" />
					
						<g:sortableColumn property="haber" title="${message(code: 'movimiento.haber.label', default: 'Haber')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${movimientoInstanceList}" status="i" var="movimientoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: movimientoInstance, field: "asiento")}</td>

                        <td><g:formatDate date="${movimientoInstance.fecha}" /></td>

                        <td>${fieldValue(bean: movimientoInstance, field: "cuenta")}</td>

                        <td>${fieldValue(bean: movimientoInstance, field: "descripcion")}</td>

                        <td>${fieldValue(bean: movimientoInstance, field: "debe")}</td>

                        <td>${fieldValue(bean: movimientoInstance, field: "haber")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movimientoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
