<table>
    <thead>
    <tr>

        <g:sortableColumn property="fecha" title="${message(code: 'movimientoPlan.fecha.label', default: 'Fecha')}" />


        <th><g:message code="movimientoPlan.conceptoPlan.label" default="Concepto Plan" /></th>



        <th>Ingreso</th>

        <th>Egreso</th>

        <g:sortableColumn property="observacion" title="${message(code: 'movimientoPlan.observacion.label', default: 'Observacion')}" />



    </tr>
    </thead>
    <tbody>
    <g:each in="${movimientoPlanInstanceList}" status="i" var="movimientoPlanInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:formatDate date="${movimientoPlanInstance.fecha}" /></td>


            <td>${fieldValue(bean: movimientoPlanInstance, field: "conceptoPlan")}</td>



            <td><g:if test="${movimientoPlanInstance.credito}">
${movimientoPlanInstance.monto}
            </g:if></td>

            <td>

                <g:if test="${!movimientoPlanInstance.credito}">
                    ${movimientoPlanInstance.monto}
                </g:if>

            </td>


            <td>${fieldValue(bean: movimientoPlanInstance, field: "observacion")}</td>





        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${movimientoPlanInstanceCount ?: 0}" />
</div>
<div class="fieldcontain">
    Total=${total}
</div>