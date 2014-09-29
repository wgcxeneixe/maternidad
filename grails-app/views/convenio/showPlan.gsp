<%@ page import="maternidad.Plan" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-plan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-plan" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list plan">

        <g:if test="${planConvenio?.plan?.nombre}">
            <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="plan.nombre.label" default="Nombre" /></span>

                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${planConvenio?.plan}" field="nombre"/></span>

            </li>
        </g:if>

        <g:if test="${planConvenio?.plan?.codigo}">
            <li class="fieldcontain">
                <span id="codigo-label" class="property-label"><g:message code="plan.codigo.label" default="Codigo" /></span>

                <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${planConvenio?.plan}" field="codigo"/></span>

            </li>
        </g:if>

        <g:if test="${planConvenio?.plan?.observacion}">
            <li class="fieldcontain">
                <span id="observacion-label" class="property-label"><g:message code="plan.observacion.label" default="Observacion" /></span>

                <span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${planConvenio?.plan}" field="observacion"/></span>

            </li>
        </g:if>

        <g:if test="${planConvenio?.plan?.obrasocial}">
            <li class="fieldcontain">
                <span id="obrasocial-label" class="property-label"><g:message code="plan.obrasocial.label" default="Obrasocial" /></span>

                <span class="property-value" aria-labelledby="obrasocial-label"><g:link controller="obraSocial" action="show" id="${planConvenio?.plan?.obrasocial?.id}">${planConvenio?.plan?.obrasocial?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${planConvenio?.plan?.activo}">
            <li class="fieldcontain">
                <span id="activo-label" class="property-label"><g:message code="plan.activo.label" default="Activo" /></span>

                <span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></span>

            </li>
        </g:if>


    </ol>

    <br/>

<g:render  template="/valorGalenoGasto/showValorGalenoGasto" model="[planConvenio: planConvenio]" />

    <br/>

    <g:render  template="/valorGalenoHonorario/showValorGalenoHonorario" model="[planConvenio: planConvenio]" />

    <g:form url="[resource:planConvenio?.plan, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${planInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>