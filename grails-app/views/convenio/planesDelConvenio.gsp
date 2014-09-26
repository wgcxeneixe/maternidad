
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
        <li><g:link class="create" controller="plan" id="${convenio.id}" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-planConvenio" class="content scaffold-list" role="main">
    <h1><g:message code="convenio.planesconvenio" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <br/>
Convenio
<g:textField name="convenio" readonly="true" value="${convenio?.encodeAsHTML()}"/>
<br/>
    ${message(code: 'convenio.planesasociados')}
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
        <g:each in="${maternidad.PlanConvenio.findAllByActivoAndConvenio(Boolean.TRUE,convenio)}" status="i" var="planConvenio">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: planConvenio?.plan, field: "nombre")}</td>

                <td>${fieldValue(bean: planConvenio?.plan, field: "codigo")}</td>

                <td>${fieldValue(bean: planConvenio?.plan, field: "observacion")}</td>

                <td><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></td>

                <td><g:link class="linkEdit" controller="plan" action="edit" id="${planConvenio?.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                <td><g:link class="linkShow" controller="plan" action="show" id="${planConvenio?.id}">${message(code: 'default.button.show.label')}</g:link></td>

                <td><g:link controller="valorGalenoGasto" action="asignarValorGalenoGasto" id="${planConvenio?.id}">Galenos de Gastos</g:link>
              |  <g:link controller="valorGalenoHonorario" action="asignarValorGalenoHonorario" id="${planConvenio?.id}">Galenos de Honorario</g:link>
                </td>
<td>
<g:link controller="practica" action="verModulos" id="${planConvenio?.id}" >Modulos</g:link>
</td>
<td>
    <g:link controller="practica" action="createModulo" id="${planConvenio?.id}" >Crear Modulo</g:link>
</td>


                <td><g:link class="linkDesasociar" controller="convenio" action="desasociarPlan" id="${planConvenio?.id}">${message(code: 'convenio.desasociarPlan')}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>
<br>
    ${message(code: 'convenio.planesnoasociados')}
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
        <g:each in="${maternidad.PlanConvenio.findByActivoAndConvenio(Boolean.FALSE,convenio)}" status="i" var="planConvenio">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: planConvenio?.plan, field: "nombre")}</td>

                <td>${fieldValue(bean: planConvenio?.plan, field: "codigo")}</td>

                <td>${fieldValue(bean: planConvenio?.plan, field: "observacion")}</td>

                <td><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></td>

                <td><g:link class="linkEdit" controller="plan" action="edit" id="${planConvenio?.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                <td><g:link class="linkShow" controller="plan" action="show" id="${planConvenio?.id}">${message(code: 'default.button.show.label')}</g:link></td>

                <td><g:link class="linkAsociar" controller="convenio" action="asociarPlanAlConvenio" id="${planConvenio?.id}">${message(code: 'convenio.asociarPlan')}</g:link></td>
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