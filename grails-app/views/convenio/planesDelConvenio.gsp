
<%@ page import="maternidad.PlanConvenio" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planConvenio.label', default: 'PlanConvenio')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-planConvenio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-planConvenio" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <br/>
Convenio
<g:textField name="convenio" readonly="true" value="${convenio?.encodeAsHTML()}"/>
<br/>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="nombre" title="${message(code: 'plan.nombre.label', default: 'Nombre')}" />

            <g:sortableColumn property="codigo" title="${message(code: 'plan.codigo.label', default: 'Codigo')}" />

            <g:sortableColumn property="observacion" title="${message(code: 'plan.observacion.label', default: 'Observacion')}" />

            <g:sortableColumn property="activo" title="${message(code: 'plan.activo.label', default: 'Activo')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${convenio?.planConvenio}" status="i" var="planConvenio">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${planConvenio?.plan?.id}">${fieldValue(bean: planConvenio?.plan, field: "nombre")}</g:link></td>

                <td>${fieldValue(bean: planConvenio?.plan, field: "codigo")}</td>

                <td>${fieldValue(bean: planConvenio?.plan, field: "observacion")}</td>

                <td><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${planConvenio?.count() ?: 0}" />
    </div>
</div>
</body>
</html>