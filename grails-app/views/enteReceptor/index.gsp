
<%@ page import="maternidad.EnteReceptor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enteReceptor.label', default: 'EnteReceptor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-enteReceptor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-enteReceptor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'enteReceptor.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'enteReceptor.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="detallePracticasValorizado" title="${message(code: 'enteReceptor.detallePracticasValorizado.label', default: 'Detalle Practicas Valorizado')}" />
					
						<g:sortableColumn property="llevaFactura" title="${message(code: 'enteReceptor.llevaFactura.label', default: 'Lleva Factura')}" />
					
						<g:sortableColumn property="pidePreAprobacion" title="${message(code: 'enteReceptor.pidePreAprobacion.label', default: 'Pide Pre Aprobacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${enteReceptorInstanceList}" status="i" var="enteReceptorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${enteReceptorInstance.id}">${fieldValue(bean: enteReceptorInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: enteReceptorInstance, field: "codigo")}</td>
					
						<td><g:formatBoolean boolean="${enteReceptorInstance.detallePracticasValorizado}" /></td>
					
						<td><g:formatBoolean boolean="${enteReceptorInstance.llevaFactura}" /></td>
					
						<td><g:formatBoolean boolean="${enteReceptorInstance.pidePreAprobacion}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${enteReceptorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
