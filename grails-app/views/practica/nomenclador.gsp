
<%@ page import="maternidad.Practica" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'practica.label', default: 'Practica')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-practica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="crear"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-practica" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="filters">
        <g:form action="nomenclador">

            <table >
                <tr>

                    <td>
                        <p><label for="codigo">Código</label>
                            <g:textField name="codigo" value="${filters?.codigo}" /></p></td>

                    <td>
                        <p><label for="nombre">Nombre</label>
                            <g:textField id="nombre" name="nombre" value="${filters?.nombre}" /></p></td>

                    <td>
                        <p><label for="nomenclada">Nomenclada</label>
                            <g:checkBox  id="nomenclada" name="nomenclada" value="${filters?.nomenclada}" /></p></td>

                    <td>
                        <p><g:submitButton name="filter" value="Filtrar" /></p></td>
                </tr>
            </table>




        </g:form>
    </div>

    <br />
    <div id="grid">
        <g:render template="grilla" model="model" />
    </div>
    <br />



</div>
</body>
</html>
