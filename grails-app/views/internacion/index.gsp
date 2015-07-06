
<%@ page import="maternidad.Internacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'internacion.label', default: 'Internacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-internacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-internacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'internacion.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="internacion.sector.label" default="Sector" /></th>
					
						<g:sortableColumn property="tipoPension" title="${message(code: 'internacion.tipoPension.label', default: 'Tipo Pension')}" />
					
						<g:sortableColumn property="diasInternacion" title="${message(code: 'internacion.diasInternacion.label', default: 'Dias Internacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${internacionInstanceList}" status="i" var="internacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${internacionInstance.id}">${fieldValue(bean: internacionInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: internacionInstance, field: "sector")}</td>
					
						<td>${fieldValue(bean: internacionInstance, field: "tipoPension")}</td>
					
						<td>${fieldValue(bean: internacionInstance, field: "diasInternacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${internacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
