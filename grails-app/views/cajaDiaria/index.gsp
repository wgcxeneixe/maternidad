
<%@ page import="maternidad.CajaDiaria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cajaDiaria.label', default: 'CajaDiaria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cajaDiaria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="cajaDiaria.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cajaDiaria" class="content scaffold-list" role="main">
			<h1><g:message code="cajaDiaria.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="id" title="${message(code: 'cajaDiaria.id.label', default: '#')}" />

						<g:sortableColumn property="fechaApertura" title="${message(code: 'cajaDiaria.fechaApertura.label', default: 'Fecha Apertura')}" />
					
						<g:sortableColumn property="fechaCierre" title="${message(code: 'cajaDiaria.fechaCierre.label', default: 'Fecha Cierre')}" />
					
						<g:sortableColumn property="saldoInicial" title="${message(code: 'cajaDiaria.saldoInicial.label', default: 'Saldo Inicial')}" />
					
						<g:sortableColumn property="saldoFinal" title="${message(code: 'cajaDiaria.saldoFinal.label', default: 'Saldo Final')}" />



					</tr>
				</thead>
				<tbody>
				<g:each in="${cajaDiariaInstanceList}" status="i" var="cajaDiariaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td> <g:link action="show" id="${cajaDiariaInstance.id}">${fieldValue(bean: cajaDiariaInstance, field: "id")}</g:link></td>

						<td>
                            <g:formatDate date="${cajaDiariaInstance.fechaApertura}" type="datetime" style="SHORT" timeStyle="SHORT"/>
                        </td>
					
						<td>
                            <g:formatDate date="${cajaDiariaInstance.fechaCierre}" type="datetime" style="SHORT" timeStyle="SHORT"/>
                        </td>
					
						<td>${fieldValue(bean: cajaDiariaInstance, field: "saldoInicial")}</td>
					
						<td>${fieldValue(bean: cajaDiariaInstance, field: "saldoFinal")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cajaDiariaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
