<%@ page import="maternidad.Practica" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'practica.label', default: 'Práctica')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-practica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="create" controller="convenio" action="asociarPractica" id="${planConvenio?.id}"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-practica" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="nombre" title="${message(code: 'practica.nombre.label', default: 'Nombre')}" />

            <g:sortableColumn property="codigo" title="${message(code: 'practica.codigo.label', default: 'Codigo')}" />

            <th></th>

            <th></th>


        </tr>
        </thead>
        <tbody>
        <g:each in="${maternidad.ValorPractica.createCriteria().list {
            isNotNull("valorHonorario")
            planConvenio{eq('id',planConvenio?.id)}
            practica{eq('nomenclada',Boolean.TRUE)}  }}" status="i" var="valor">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${valor?.practica?.nombre}</td>

                <td>${valor?.practica?.codigo}</td>

                <td>${valor?.valorHonorario}</td>

                <td><g:link class="linkEdit" controller="convenio" action="editAsociarPractica" id="${valor?.id}" >${message(code: 'default.button.edit.label')}</g:link></td>



            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${maternidad.ValorPractica.createCriteria().list {
            isNotNull("valorHonorario")
            planConvenio{eq('id',planConvenio?.id)}
            practica{eq('nomenclada',Boolean.TRUE)}  }.size() ?: 0}" />
    </div>
</div>
</body>
</html>