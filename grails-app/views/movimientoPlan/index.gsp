
<%@ page import="maternidad.MovimientoPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoPlan.label', default: 'MovimientoPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movimientoPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="saldo">Saldo</g:link></li>
            </ul>
		</div>
		<div id="list-movimientoPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="monto" title="${message(code: 'movimientoPlan.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'movimientoPlan.fecha.label', default: 'Fecha')}" />
					

						<th><g:message code="movimientoPlan.plan.label" default="Plan" /></th>
					
						<th><g:message code="movimientoPlan.conceptoPlan.label" default="Concepto Plan" /></th>
					
						<g:sortableColumn property="credito" title="${message(code: 'movimientoPlan.credito.label', default: 'Credito')}" />



                    </tr>
				</thead>
				<tbody>
				<g:each in="${movimientoPlanInstanceList}" status="i" var="movimientoPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${movimientoPlanInstance.id}">${fieldValue(bean: movimientoPlanInstance, field: "monto")}</g:link></td>
					
						<td><g:formatDate date="${movimientoPlanInstance.fecha}" /></td>
					

						<td>${fieldValue(bean: movimientoPlanInstance, field: "plan")}</td>
					
						<td>${fieldValue(bean: movimientoPlanInstance, field: "conceptoPlan")}</td>
					
						<td><g:formatBoolean boolean="${movimientoPlanInstance.credito}" /></td>


                    </tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movimientoPlanInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
