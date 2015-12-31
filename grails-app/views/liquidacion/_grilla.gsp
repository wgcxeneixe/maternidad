<table>
    <thead>
    <tr>
        <g:sortableColumn property="profesional"
                          title="${message(code: 'liquidacion.profesional.label', default: 'Profesional')}" params="${filters}"/>

        <g:sortableColumn property="fecha" title="${message(code: 'liquidacion.fecha.label', default: 'Fecha')}" params="${filters}"/>

        <g:sortableColumn property="montoBruto"
                          title="${message(code: 'liquidacion.montoBruto.label', default: 'Monto Bruto')}" params="${filters}"/>

        <g:sortableColumn property="montoNeto"
                          title="${message(code: 'liquidacion.montoNeto.label', default: 'Monto Neto')}" params="${filters}"/>

        <g:sortableColumn property="numeroLiquidacion"
                          title="${message(code: 'liquidacion.numeroLiquidacion.label', default: 'Nuemro Liquidacion')}" params="${filters}"/>

        <g:sortableColumn property="numeroRecibo"
                          title="${message(code: 'liquidacion.numeroRecibo.label', default: 'Numero Recibo')}" params="${filters}"/>

        <td></td>
    </tr>
    </thead>
    <tbody>
    <g:each in="${liquidacionInstanceList}" status="i" var="liquidacionInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>
                <g:link controller="liquidacion" action="show"
                        id="${liquidacionInstance.id}">${liquidacionInstance.profesional}</g:link>
            </td>

            <td>${liquidacionInstance?.fecha?.format('dd/MM/yyyy')}</td>

            <td>${fieldValue(bean: liquidacionInstance, field: "montoBruto")}</td>

            <td>${fieldValue(bean: liquidacionInstance, field: "montoNeto")}</td>

            <td>${fieldValue(bean: liquidacionInstance, field: "numeroLiquidacion")}</td>

            <td>${fieldValue(bean: liquidacionInstance, field: "numeroRecibo")}</td>

            <td>
                <g:if test="${liquidacionInstance.numeroLiquidacion}">
                    <g:link controller="liquidacion" action="reportLiquidacion"
                            id="${liquidacionInstance.id}">imprimir</g:link>
                </g:if>
            </td>

        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${liquidacionInstanceCount ?: 0}" params="${filters}"/>
</div>