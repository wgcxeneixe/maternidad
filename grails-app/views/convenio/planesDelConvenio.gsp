
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
            <li><g:link class="list" action="index"><g:message code="convenio.list.label" args="[entityName]" /></g:link></li>
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

            <th>${message(code: 'plan.observacion.label', default: 'Observacion')}</th>

            <g:sortableColumn property="activo" title="${message(code: 'plan.activo.label', default: 'Activo')}" />

            <th></th>
            <th></th>
            <!--<th></th> PARA EL CASO DE LOS GALENOS DESCOMENTAR -->
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${maternidad.PlanConvenio.findAllByActivoAndConvenio(Boolean.TRUE,convenio)}" status="i" var="planConvenio">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: planConvenio?.plan, field: "nombre")}</td>

                <td>${fieldValue(bean: planConvenio?.plan, field: "codigo")}</td>

                <td>${ (planConvenio?.plan?.observacion?.size()>=50)? planConvenio?.plan?.observacion?.substring(0,50) +' ...':planConvenio?.plan?.observacion}</td>

                <td><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></td>

                <td><g:link class="linkEdit" controller="convenio" action="editPlan" id="${planConvenio?.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                <td><g:link class="linkShow" controller="convenio" action="showPlan" id="${planConvenio?.id}">${message(code: 'default.button.show.label')}</g:link></td>

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
            <th></th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${maternidad.PlanConvenio.findByActivoAndConvenio(Boolean.FALSE,convenio)}" status="i" var="planConvenio">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: planConvenio?.plan, field: "nombre")}</td>

                <td>${fieldValue(bean: planConvenio?.plan, field: "codigo")}</td>

                <td>${ (planConvenio?.plan?.observacion?.size()>=50)? planConvenio?.plan?.observacion?.substring(0,50) +' ...':planConvenio?.plan?.observacion}</td>

                <td><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></td>

                <td><g:link class="linkEdit" controller="convenio" action="editPlan" id="${planConvenio?.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                <td><g:link class="linkShow" controller="convenio" action="showPlan" id="${planConvenio?.id}">${message(code: 'default.button.show.label')}</g:link></td>

                <td><g:link class="linkAsociar" controller="convenio" action="asociarPlanAlConvenio" id="${planConvenio?.id}">${message(code: 'convenio.asociarPlan')}</g:link></td>
            </tr>
        </g:each>


        <g:each in="${maternidad.PlanConvenio.executeQuery(" select p from Plan p where p.obrasocial=:os  and p.id not in (select pc.plan.id from PlanConvenio pc where pc.convenio.obrasocial=:os and pc.convenio.activo=true)",[os:convenio.obrasocial])}" status="i" var="plan">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: plan, field: "nombre")}</td>

                <td>${fieldValue(bean: plan, field: "codigo")}</td>

                <td>${ (plan?.observacion?.size()>=50)? plan?.observacion?.substring(0,50) +' ...':plan?.observacion}</td>

                <td><g:formatBoolean boolean="${plan?.activo}" /></td>

                <td><g:link class="linkEdit" controller="convenio" action="editPlan" id="${plan?.id}">${message(code: 'default.button.edit.label')}</g:link></td>

                <td><g:link class="linkShow" controller="convenio" action="showPlan" id="${plan?.id}">${message(code: 'default.button.show.label')}</g:link></td>

                <td><g:link class="linkAsociar" controller="convenio" action="asociarPlan" id="${plan?.id}" params="[convenio:convenio.id]">${message(code: 'convenio.asociarPlan')}</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

<!--
    <div class="pagination">
        <g:paginate total="${planConvenio?.count() ?: 0}" />
    </div>
    -->
</div>
</body>
</html>