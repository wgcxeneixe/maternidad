
<%@ page import="maternidad.Plan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
			<!--	<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>  -->
			</ul>
		</div>
		<div id="list-plan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'plan.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'plan.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="observacion" title="${message(code: 'plan.observacion.label', default: 'Observacion')}" />
					
						<th><g:message code="plan.obrasocial.label" default="Obrasocial" /></th>
					
						<g:sortableColumn property="activo" title="${message(code: 'plan.activo.label', default: 'Activo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planInstanceList}" status="i" var="planInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${planInstance.id}">${fieldValue(bean: planInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: planInstance, field: "codigo")}</td>
					
						<td>${ (planInstance?.observacion?.size()>=50)? planInstance?.observacion?.substring(0,50) +' ...':planInstance?.observacion}</td>
					
						<td>${fieldValue(bean: planInstance, field: "obrasocial")}</td>
					
						<td><g:formatBoolean boolean="${planInstance.activo}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
