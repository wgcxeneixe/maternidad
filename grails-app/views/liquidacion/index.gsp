
<%@ page import="maternidad.Liquidacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'liquidacion.label', default: 'Liquidacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-liquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-liquidacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
                        <g:sortableColumn property="profesional" title="${message(code: 'liquidacion.profesional.label', default: 'Profesional')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'liquidacion.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="montoBruto" title="${message(code: 'liquidacion.montoBruto.label', default: 'Monto Bruto')}" />
					
						<g:sortableColumn property="montoNeto" title="${message(code: 'liquidacion.montoNeto.label', default: 'Monto Neto')}" />
					
						<g:sortableColumn property="numeroLiquidacion" title="${message(code: 'liquidacion.numeroLiquidacion.label', default: 'Nuemro Liquidacion')}" />
					
						<g:sortableColumn property="numeroRecibo" title="${message(code: 'liquidacion.numeroRecibo.label', default: 'Numero Recibo')}" />

                        <td></td>
					</tr>
				</thead>
				<tbody>
				<g:each in="${liquidacionInstanceList}" status="i" var="liquidacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>
                            <g:link controller="liquidacion" action="show" id="${liquidacionInstance.id}">${liquidacionInstance.profesional}</g:link>
                        </td>
					
						<td>${liquidacionInstance?.fecha?.format('dd/MM/yyyy')}</td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "montoBruto")}</td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "montoNeto")}</td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "numeroLiquidacion")}</td>
					
						<td>${fieldValue(bean: liquidacionInstance, field: "numeroRecibo")}</td>

                        <td>
                            <g:link controller="liquidacion" action="reportLiquidacion" id="${liquidacionInstance.id}">imprimir</g:link>
                        </td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${liquidacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
