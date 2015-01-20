<%@ page import="maternidad.Practica" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'practica.label', default: 'Módulo')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-practica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
      <!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="create" controller="practica" action="createModulo" id="${planConvenio?.id}"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
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

            <g:sortableColumn property="observacion" title="${message(code: 'practica.observacion.label', default: 'Observacion')}" />

            <th></th>
            <th></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${maternidad.ValorPractica.createCriteria().list {  planConvenio{eq('id',planConvenio?.id)}
            practica{eq('modulo',true)}}}" status="i" var="valor">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${valor?.practica?.nombre}</td>

                <td>${valor?.practica?.codigo}</td>

                <td> ${ (valor?.practica?.observacion?.size()>=50)? valor?.practica?.observacion?.substring(0,50) +' ...':valor?.practica?.observacion}</td>

                <td><g:link class="linkEdit" controller="practica" action="editModulo" id="${valor?.practica?.id}" params="[valorPractica:valor?.id]">${message(code: 'default.button.edit.label')}</g:link></td>

                <td><g:link class="linkShow" controller="practica" action="showModulo" id="${valor?.id}">${message(code: 'default.button.show.label')}</g:link></td>


            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${maternidad.ValorPractica.createCriteria().list {  planConvenio{eq('id',planConvenio?.id)}
            practica{eq('modulo',true)}}.size() ?: 0}" />
    </div>
</div>
</body>
</html>