
<%@ page import="maternidad.Practica" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'practica.label', default: 'Practica')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-practica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>

        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-practica" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list practica">

        <g:if test="${practicaInstance?.nombre}">
            <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="practica.nombre.label" default="Nombre" /></span>

                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${practicaInstance}" field="nombre"/></span>

            </li>
        </g:if>

        <g:if test="${practicaInstance?.codigo}">
            <li class="fieldcontain">
                <span id="codigo-label" class="property-label"><g:message code="practica.codigo.label" default="Codigo" /></span>

                <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${practicaInstance}" field="codigo"/></span>

            </li>
        </g:if>

        <g:if test="${practicaInstance?.observacion}">
            <li class="fieldcontain">
                <span id="observacion-label" class="property-label"><g:message code="practica.observacion.label" default="Observacion" /></span>

                <span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${practicaInstance}" field="observacion"/></span>

            </li>
        </g:if>


        <g:if test="${practicaInstance?.multiplicadorHonorario}">
            <li class="fieldcontain">
                <span id="multiplicadorHonorario-label" class="property-label"><g:message code="practica.multiplicadorHonorario.label" default="Multiplicador Honorario" /></span>

                <span class="property-value" aria-labelledby="multiplicadorHonorario-label"><g:fieldValue bean="${practicaInstance}" field="multiplicadorHonorario"/></span>

            </li>
        </g:if>

        <g:if test="${practicaInstance?.multiplicadorGasto}">
            <li class="fieldcontain">
                <span id="multiplicadorGasto-label" class="property-label"><g:message code="practica.multiplicadorGasto.label" default="Multiplicador Gasto" /></span>

                <span class="property-value" aria-labelledby="multiplicadorGasto-label"><g:fieldValue bean="${practicaInstance}" field="multiplicadorGasto"/></span>

            </li>
        </g:if>

    </ol>


    <g:message code="nomenclador.gastos"/>

    <table>
        <tr>
            <td>Unidad</td>
            <td>Tipo</td>
        </tr>

        <g:each in="${maternidad.ValorUnidadGasto.findAllByPractica(practicaInstance)}" var="valorUnidad">

            <tr>
                <td>${valorUnidad?.valor}</td>
                <td>${valorUnidad?.tipoGasto?.sigla +' - '+ valorUnidad?.tipoGasto?.descripcion  }</td>

            </tr>

        </g:each>

    </table>

<br>

    <g:message code="nomenclador.honorarios"/>

    <table>

    <tr>

        <td>Tipo</td>
    </tr>

    <tr>

        <td>${practicaInstance?.tipoHonorario?.sigla +' - '+ practicaInstance?.tipoHonorario?.descripcion}</td>
    </tr>

    </table>

    <table>
        <tr>
            <td>Componente</td>
            <td>Valor</td>
        </tr>

        <g:each in="${maternidad.ValorUnidadHonorario.findAllByPractica(practicaInstance)}" var="valorUnidad">

            <tr>
                <td>${valorUnidad?.componente?.nombre}</td>
                <td>${valorUnidad?.valor  }</td>

            </tr>

        </g:each>

    </table>



    <g:form url="[resource:practicaInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="editNomenclada" resource="${practicaInstance}"><g:message code="default.button.editar.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>