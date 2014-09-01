
<%@ page import="maternidad.ConceptoLiquidacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoLiquidacion.label', default: 'ConceptoLiquidacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conceptoLiquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-conceptoLiquidacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					

						<g:sortableColumn property="nombre" title="${message(code: 'conceptoLiquidacion.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'conceptoLiquidacion.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="esMensual" title="${message(code: 'conceptoLiquidacion.esMensual.label', default: 'Es Mensual')}" />
					
						<g:sortableColumn property="credito" title="${message(code: 'conceptoLiquidacion.credito.label', default: 'Credito')}" />
					
						<g:sortableColumn property="montoFijo" title="${message(code: 'conceptoLiquidacion.montoFijo.label', default: 'Monto Fijo')}" />

                        <g:sortableColumn property="porcentaje" title="${message(code: 'conceptoLiquidacion.montoFijo.label', default: 'Porcentaje')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoLiquidacionInstanceList}" status="i" var="conceptoLiquidacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoLiquidacionInstance.id}">${fieldValue(bean: conceptoLiquidacionInstance, field: "nombre")}</g:link></td>

						<td>${fieldValue(bean: conceptoLiquidacionInstance, field: "codigo")}</td>
					
						<td><g:formatBoolean boolean="${conceptoLiquidacionInstance.esMensual}" /></td>
					
						<td><g:formatBoolean boolean="${conceptoLiquidacionInstance.credito}" /></td>
					
						<td>${fieldValue(bean: conceptoLiquidacionInstance, field: "montoFijo")}</td>

                        <td>${fieldValue(bean: conceptoLiquidacionInstance, field: "porcentaje")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoLiquidacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
