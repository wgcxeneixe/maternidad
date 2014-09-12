
<%@ page import="maternidad.DetalleCaja" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleCaja.label', default: 'DetalleCaja')}" />
		<title><g:message code="detalleCaja.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleCaja" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="detalleCaja.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleCaja" class="content scaffold-list" role="main">
			<h1><g:message code="detalleCaja.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
            <!--

            <div class="filters">
                <g:form action="index">
                    <table>
                        <tr>
                            <td> <p><label for="caja">Caja</label>
                                <g:textField name="caja" value="${filters?.caja}" /></p></td>
                            <td>
                                <p><label for="id">Nº movimiento</label>
                                    <g:textField name="id" value="${filters?.id}" /></p></td>
                                <p><g:submitButton name="filter" value="Filtrar" /></p></td>
                        </tr>
                    </table>
                </g:form>
            </div>
            FILTROS
            -->

			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="id" title="${message(code: 'detalleCaja.id.labelindex', default: 'Nº')}" />

                        <g:sortableColumn property="cajaDiaria.id" title="${message(code: 'cajaDiaria.label', default: 'Caja')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'detalleCaja.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="detalleCaja.planillainternacion.label" default="Planillainternacion" /></th>
					
						<th><g:message code="detalleCaja.conceptocaja.label" default="Conceptocaja" /></th>
					
						<g:sortableColumn property="credito" title="${message(code: 'detalleCaja.credito.label', default: 'Credito')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'detalleCaja.monto.label', default: 'Monto')}" />
					

					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleCajaInstanceList}" status="i" var="detalleCajaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${detalleCajaInstance.id}">${fieldValue(bean: detalleCajaInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: detalleCajaInstance, field: "caja")}</td>

                        <td>
                            <g:formatDate date="${detalleCajaInstance.fecha}" type="datetime" style="SHORT" timeStyle="SHORT"/>
                        </td>
					
						<td>${fieldValue(bean: detalleCajaInstance, field: "planillainternacion")}</td>
					
						<td>${fieldValue(bean: detalleCajaInstance, field: "conceptocaja")}</td>
					
						<td><g:formatBoolean boolean="${detalleCajaInstance.credito}" true="Crédito" false="Débito" /></td>
					
						<td>$ ${fieldValue(bean: detalleCajaInstance, field: "monto")}</td>
					

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleCajaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
