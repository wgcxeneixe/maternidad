<%@ page import="maternidad.PlanConvenio" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planConvenio.label', default: 'Plan')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-planConvenio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <!--   <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="create" controller="plan" id="${os?.id}" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-planConvenio" class="content scaffold-list" role="main">
    <h1><g:message code="obraSocial.planesOs" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <br/>
    Obra Social
    <g:textField name="obraSocial" readonly="true" value="${os?.encodeAsHTML()}"/>
    <br/>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="nombre" title="${message(code: 'plan.nombre.label', default: 'Nombre')}" />

            <g:sortableColumn property="codigo" title="${message(code: 'plan.codigo.label', default: 'Codigo')}" />

            <g:sortableColumn property="observacion" title="${message(code: 'plan.observacion.label', default: 'Observacion')}" />

            <g:sortableColumn property="activo" title="${message(code: 'plan.activo.label', default: 'Activo')}" />

            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${os?.planes}" status="i" var="plan">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: plan, field: "nombre")}</td>

                <td>${fieldValue(bean: plan, field: "codigo")}</td>

                <td>${ (plan?.observacion?.size()>=50)? plan?.observacion?.substring(0,50) +' ...':plan?.observacion}</td>

                <td><g:formatBoolean boolean="${plan?.activo}" /></td>

                <td><g:link class="linkEdit" controller="plan" action="edit" id="${plan?.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                <td><g:link class="linkShow" controller="plan" action="show" id="${plan?.id}">${message(code: 'default.button.show.label')}</g:link></td>

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