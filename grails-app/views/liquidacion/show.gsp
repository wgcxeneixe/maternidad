<%@ page import="maternidad.Liquidacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'liquidacion.label', default: 'Liquidacion')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-liquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-liquidacion" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list liquidacion">

        <g:if test="${liquidacionInstance?.fecha}">
            <li class="fieldcontain">
                <span id="fecha-label" class="property-label"><g:message code="liquidacion.fecha.label"
                                                                         default="Fecha"/></span>

                <span class="property-value" aria-labelledby="fecha-label"><g:formatDate
                        date="${liquidacionInstance?.fecha}" /></span>

            </li>
        </g:if>

        <g:if test="${liquidacionInstance?.montoBruto}">
            <li class="fieldcontain">
                <span id="montoBruto-label" class="property-label"><g:message code="liquidacion.montoBruto.label"
                                                                              default="Monto Bruto"/></span>

                <span class="property-value" aria-labelledby="montoBruto-label"><g:fieldValue
                        bean="${liquidacionInstance}" field="montoBruto"/></span>

            </li>
        </g:if>

            <li class="fieldcontain">
                <span id="montoNeto-label" class="property-label"><g:message code="liquidacion.montoNeto.label"
                                                                             default="Monto Neto"/></span>

                <span class="property-value" aria-labelledby="montoNeto-label"><g:fieldValue
                        bean="${liquidacionInstance}" field="montoNeto"/></span>

            </li>

        <g:if test="${liquidacionInstance?.numeroLiquidacion}">
            <li class="fieldcontain">
                <span id="numeroLiquidacion-label" class="property-label"><g:message
                        code="liquidacion.numeroLiquidacion.label" default="Numero Liquidacion"/></span>

                <span class="property-value" aria-labelledby="numeroLiquidacion-label"><g:fieldValue
                        bean="${liquidacionInstance}" field="numeroLiquidacion"/></span>

            </li>
        </g:if>

        <g:if test="${liquidacionInstance?.numeroRecibo}">
            <li class="fieldcontain">
                <span id="numeroRecibo-label" class="property-label"><g:message code="liquidacion.numeroRecibo.label"
                                                                                default="Numero Recibo"/></span>

                <span class="property-value" aria-labelledby="numeroRecibo-label"><g:fieldValue
                        bean="${liquidacionInstance}" field="numeroRecibo"/></span>

            </li>
        </g:if>

        <g:if test="${liquidacionInstance?.profesional}">
            <li class="fieldcontain">
                <span id="profesional-label" class="property-label"><g:message code="liquidacion.profesional.label"
                                                                               default="Profesional"/></span>

                <span class="property-value" aria-labelledby="profesional-label"><g:link controller="profesional"
                                                                                         action="show"
                                                                                         id="${liquidacionInstance?.profesional?.id}">${liquidacionInstance?.profesional?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>
    </ol>
    <g:if test="${!liquidacionInstance?.numeroLiquidacion}">
        <g:form url="[resource: liquidacionInstance, action: 'liquidar']"
                params="[liquidacion_id: liquidacionInstance?.id,]" method="PUT">
        %{--<fieldset class="form" style="text-align: left">--}%
        %{--<div class="fieldcontain ${hasErrors(bean: liquidacionInstance, field: 'numeroRecibo', 'error')} required">--}%
        %{--<label for="numeroRecibo">--}%
        %{--<g:message code="liquidacion.numeroRecibo.label" default="Numero Recibo" />--}%
        %{--</label>--}%
        %{--<g:field name="numeroRecibo" type="number" value="${liquidacionInstance.numeroRecibo}" required=""/>--}%
        %{--<g:link class="save" controller="liquidacion" action="liquidar"--}%
        %{--params="[liquidacion_id: liquidacionInstance?.id,]"><g:message--}%
        %{--code="default.button.editar.labelss" default="Liquidar"/></g:link>--}%
        %{--</div>--}%
        %{--</fieldset>--}%
            <p><g:submitButton name="liquidar" value="Liquidar" style="color: darkred"
                               onclick="return confirm('¿Está seguro que desea Generar esta Liquidación?')"/></p>
        </g:form>
    </g:if>

    <div id="list-detalleLiquidacion" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="['de Detalles']"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <th><g:message code="detalleLiquidacion.conceptoProfesional.label" default="Concepto Profesional"/></th>

                <g:sortableColumn property="detalle"
                                  title="${message(code: 'detalleLiquidacion.detalle.label', default: 'Detalle')}"/>

                <g:sortableColumn property="debito"
                                  title="${message(code: 'detalleLiquidacion.debito.label', default: 'Debito')}"/>

                <th><g:message code="detalleLiquidacion.detalleFactura.label" default="Monto"/></th>

                <td></td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <g:each in="${liquidacionInstance?.detallesLiquidacion}" status="i" var="detalleLiquidacionInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td>${fieldValue(bean: detalleLiquidacionInstance, field: "conceptoProfesional")}</td>

                    <td>${fieldValue(bean: detalleLiquidacionInstance, field: "detalle")}</td>

                    <td><g:formatBoolean boolean="${detalleLiquidacionInstance.debito}"/></td>

                    <td>${fieldValue(bean: detalleLiquidacionInstance, field: "monto")}</td>

                    <td>
                        <g:if test="${!liquidacionInstance?.numeroLiquidacion}">
                            <g:link controller="detalleLiquidacion" action="edit"
                                    id="${detalleLiquidacionInstance.id}">modificar</g:link>
                        </g:if>
                    </td>
                    <td>
                        <g:if test="${!liquidacionInstance?.numeroLiquidacion}">
                            <g:link controller="detalleLiquidacion" action="edit" params="[borrar:true]"
                                    id="${detalleLiquidacionInstance.id}" onclick="return confirm('¿Está seguro de borrar el detale?')">eliminar</g:link>
                        </g:if>
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${detalleLiquidacionInstanceCount ?: 0}"/>
        </div>
    </div>
    <g:if test="${!liquidacionInstance?.numeroLiquidacion}">
        <g:form url="[resource: liquidacionInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="create" controller="detalleLiquidacion" action="create"
                        params="[liquidacion_id: liquidacionInstance?.id]"><g:message
                        code="default.button.editar.labelss"
                        default="Nuevo Detalle"/></g:link>
                %{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
            </fieldset>
        </g:form>
    </g:if>
</div>
</body>
</html>
