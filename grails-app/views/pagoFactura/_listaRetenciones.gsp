<div id="list-pagoFactura" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="['Retenciones']" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="monto" title="${message(code: 'retencionPago.monto.label', default: 'Monto')}" />

            <g:sortableColumn property="observaciones" title="${message(code: 'retencionPago.observaciones.label', default: 'Observaciones')}" />

            <th><g:message code="retencionPago.pagoFactura.label" default="Pago Factura" /></th>

            <th><g:message code="retencionPago.tipo.label" default="Tipo" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${retencionPagoInstanceList}" status="i" var="retencionPagoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${retencionPagoInstance.id}">${fieldValue(bean: retencionPagoInstance, field: "monto")}</g:link></td>

                <td>${fieldValue(bean: retencionPagoInstance, field: "observaciones")}</td>

                <td>${fieldValue(bean: retencionPagoInstance, field: "pagoFactura")}</td>

                <td>${fieldValue(bean: retencionPagoInstance, field: "tipo")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    %{--<div class="pagination">--}%
        %{--<g:paginate total="${retencionPagoInstanceCount ?: 0}" />--}%
    %{--</div>--}%
    <div class="nav" role="navigation">
        <ul>
            <li><g:link controller="retencionPago" class="create" action="create" id="${pagoFacturaInstance?.id}"><g:message code="default.new.label" args="['Retención']" /></g:link></li>
        </ul>
    </div>
</div>