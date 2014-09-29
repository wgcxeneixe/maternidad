
<%@ page import="maternidad.ConceptoPorProfesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoPorProfesional.label', default: 'ConceptoPorProfesional')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conceptoPorProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conceptoPorProfesional" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="observacion" title="${message(code: 'conceptoPorProfesional.observacion.label', default: 'Observacion')}" />
					
						<g:sortableColumn property="montoFijo" title="${message(code: 'conceptoPorProfesional.montoFijo.label', default: 'Monto Fijo')}" />
					
						<g:sortableColumn property="porcentaje" title="${message(code: 'conceptoPorProfesional.porcentaje.label', default: 'Porcentaje')}" />
					
						<th><g:message code="conceptoPorProfesional.usuario.label" default="Usuario" /></th>
					
						<g:sortableColumn property="activo" title="${message(code: 'conceptoPorProfesional.activo.label', default: 'Activo')}" />
					
					<!--	<th><g:message code="conceptoPorProfesional.conceptoLiquidacion.label" default="Concepto Liquidacion" /></th>-->
                        <th></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoPorProfesionalInstanceList}" status="i" var="conceptoPorProfesionalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoPorProfesionalInstance.id}">${fieldValue(bean: conceptoPorProfesionalInstance, field: "observacion")}</g:link></td>
					
						<td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "montoFijo")}</td>
					
						<td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "porcentaje")}</td>
					
						<td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "usuario")}</td>
					
						<td><g:formatBoolean boolean="${conceptoPorProfesionalInstance.activo}" /></td>
					
						<td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "conceptoLiquidacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoPorProfesionalInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
