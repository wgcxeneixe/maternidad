
<%@ page import="facturaElectronica.FacturaElectronica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'facturaElectronica.label', default: 'FacturaElectronica')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-facturaElectronica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-facturaElectronica" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cae" title="${message(code: 'facturaElectronica.cae.label', default: 'Cae')}" />
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'facturaElectronica.codigoPostal.label', default: 'Codigo Postal')}" />
					
						<g:sortableColumn property="cuit" title="${message(code: 'facturaElectronica.cuit.label', default: 'Cuit')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'facturaElectronica.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'facturaElectronica.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="localidad" title="${message(code: 'facturaElectronica.localidad.label', default: 'Localidad')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${facturaElectronicaInstanceList}" status="i" var="facturaElectronicaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${facturaElectronicaInstance.id}">${fieldValue(bean: facturaElectronicaInstance, field: "cae")}</g:link></td>
					
						<td>${fieldValue(bean: facturaElectronicaInstance, field: "codigoPostal")}</td>
					
						<td>${fieldValue(bean: facturaElectronicaInstance, field: "cuit")}</td>
					
						<td>${fieldValue(bean: facturaElectronicaInstance, field: "direccion")}</td>
					
						<td><g:formatDate date="${facturaElectronicaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: facturaElectronicaInstance, field: "localidad")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${facturaElectronicaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
