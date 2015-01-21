
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
      <!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
       <!-- <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li> -->

        <li><g:link class="create" controller="convenio" action="editPlan" id="${valorPracticaInstance?.planConvenio?.id}" ><g:message code="defaul.button.volver.label" /></g:link></li>

    </ul>
</div>
<div id="show-practica" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list practica">



        <g:if test="${practicaInstance?.obrasocial}">
            <li class="fieldcontain">
                <span id="obrasocial-label" class="property-label"><g:message code="practica.obrasocial.label" default="Obrasocial" /></span>

                <span class="property-value" aria-labelledby="obrasocial-label"><g:link controller="obraSocial" action="show" id="${practicaInstance?.obrasocial?.id}">${practicaInstance?.obrasocial?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

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

        <li class="fieldcontain">
            <span id="vh-label" class="property-label"><g:message code="practica.observacion.label" default="Valor Honorario" /></span>

            <span class="property-value" aria-labelledby="vh-label">${valorPracticaInstance?.valorHonorarioModulo}</span>

        </li>

        <li class="fieldcontain">
            <span id="vg-label" class="property-label"><g:message code="practica.observacion.label" default="Valor Gasto" /></span>

            <span class="property-value" aria-labelledby="vg-label">${valorPracticaInstance?.valorGastoModulo}</span>

        </li>


    </ol>

    <table>
   <tr><td>Practica</td>
       <td>Valor Gasto</td>
       <td>Valor Anestesista</td>
       <td>Valor Ayudante</td>
       <td>Valor Especialista</td>
   </tr>
        <g:each in="${practicaInstance.practicasModulos}" var="practicaM">
            <tr><td>${practicaM?.practica?.toString()}</td>
                <td>${practicaM?.valorGasto}</td>
                <td>${practicaM?.valorAnestecista}</td>
                <td>${practicaM?.valorAyudante}</td>
                <td>${practicaM?.valorEspecialista}</td>
            </tr>
   </g:each>
    </table>

    <g:form url="[resource:practicaInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="editModulo" id="${practicaInstance.id}" resource="${practicaInstance}" params="[valorPractica:valorPracticaInstance?.id]"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>