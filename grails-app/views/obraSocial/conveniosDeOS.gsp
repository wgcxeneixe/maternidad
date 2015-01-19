
<%@ page import="maternidad.Convenio" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'convenio.label', default: 'Convenio')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-convenio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="create" controller="convenio" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>

    </ul>
</div>
<div id="list-convenio" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>



    <br />
    <div id="grid">

        <table >
            <thead>
            <tr>

                <g:sortableColumn property="codigo" title="${message(code: 'convenio.codigo.label', default: 'Codigo')}"  />

                <th><g:message code="convenio.obrasocial.label" default="Obrasocial"  /></th>

                <g:sortableColumn property="fechaInicio" title="${message(code: 'convenio.fechaInicio.label', default: 'Fecha Inicio')}" />

                <g:sortableColumn property="fechaFin" title="${message(code: 'convenio.fechaFin.label', default: 'Fecha Fin')}"  />

                <g:sortableColumn property="activo" title="${message(code: 'convenio.activo.label', default: 'Activo')}"  />

                <g:sortableColumn property="observacion" title="${message(code: 'convenio.observacion.label', default: 'Observacion')}"  />

            </tr>
            </thead>
            <tbody>
            <g:each in="${convenioInstanceList}" status="i" var="convenioInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td>${fieldValue(bean: convenioInstance, field: "codigo")}</td>

                    <td>${fieldValue(bean: convenioInstance, field: "obrasocial")}</td>

                    <td><g:formatDate date="${convenioInstance.fechaInicio}" /></td>

                    <td><g:formatDate date="${convenioInstance.fechaFin}" /></td>

                    <td><g:formatBoolean boolean="${convenioInstance.activo}" /></td>

                    <td>${fieldValue(bean: convenioInstance, field: "observacion")}</td>


                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${convenioInstanceCount ?: 0}"  />
        </div>

    </div>
    <br />


</div>
</body>
</html>
