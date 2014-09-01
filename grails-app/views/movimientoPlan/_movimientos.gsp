<table>
    <thead>
    <tr>

        <g:sortableColumn property="fecha" title="${message(code: 'movimientoPlan.fecha.label', default: 'Fecha')}" />


        <th><g:message code="movimientoPlan.conceptoPlan.label" default="Concepto Plan" /></th>



        <th>Ingreso</th>

        <th>Egreso</th>
<!--
        <g:sortableColumn property="observacion" title="${message(code: 'movimientoPlan.observacion.label', default: 'Observacion')}" />

-->

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

<!--
            <td>${fieldValue(bean: movimientoPlanInstance, field: "observacion")}</td>
-->




        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <util:remotePaginate  total="${movimientoPlanInstanceCount ?: 0}" update="divplan" action="getmovimientosPlan" pageSizes="[5: '5 por Página',10:'10 por Página',15:'15 por Página']" params="${[idPlan:idPlan]}"  />
</div>
<div class="fieldcontain">
  Saldo Total=${total}
</div>