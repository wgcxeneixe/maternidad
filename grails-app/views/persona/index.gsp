
<%@ page import="maternidad.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-persona" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cuit" title="${message(code: 'persona.cuit.label', default: 'Cuit')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'persona.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="razonSocial" title="${message(code: 'persona.razonSocial.label', default: 'Razon Social')}" />
					
						<th><g:message code="persona.tipoDocumento.label" default="Tipo Documento" /></th>
					
						<g:sortableColumn property="nroDocumento" title="${message(code: 'persona.nroDocumento.label', default: 'Nro Documento')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personaInstanceList}" status="i" var="personaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personaInstance.id}">${fieldValue(bean: personaInstance, field: "cuit")}</g:link></td>
					
						<td>${fieldValue(bean: personaInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "razonSocial")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "tipoDocumento")}</td>
					
						<td>${fieldValue(bean: personaInstance, field: "nroDocumento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
