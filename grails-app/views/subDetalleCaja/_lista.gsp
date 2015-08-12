<div id="list-subDetalleCaja" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="['Detalle Movimiento']" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="subDetalleCaja.conceptocaja.label" default="Conceptocaja" /></th>

            <g:sortableColumn property="credito" title="${message(code: 'subDetalleCaja.credito.label', default: 'Credito')}" />

            <g:sortableColumn property="monto" title="${message(code: 'subDetalleCaja.monto.label', default: 'Monto')}" />

            <g:sortableColumn property="observaciones" title="${message(code: 'subDetalleCaja.observaciones.label', default: 'Observaciones')}" />

            <th><g:message code="subDetalleCaja.usuario.label" default="Usuario" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${subDetalleCajaInstanceList}" status="i" var="subDetalleCajaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${subDetalleCajaInstance.id}">${fieldValue(bean: subDetalleCajaInstance, field: "conceptocaja")}</g:link></td>

                <td><g:formatBoolean boolean="${subDetalleCajaInstance.credito}" /></td>

                <td>${fieldValue(bean: subDetalleCajaInstance, field: "monto")}</td>

                <td>${fieldValue(bean: subDetalleCajaInstance, field: "observaciones")}</td>

                <td>${fieldValue(bean: subDetalleCajaInstance, field: "usuario")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${subDetalleCajaInstanceCount ?: 0}" />
    </div>
</div>