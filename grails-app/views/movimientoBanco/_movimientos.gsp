
<table>
    <thead>
    <tr>


        <th>${message(code: 'movimientoBanco.fecha.label', default: 'Fecha')}</th>

        <th>Ingreso</th>

        <th>Egreso</th>

        <th><g:message code="movimientoBanco.banco.label" default="Banco" /></th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${movimientoBancoInstanceList}" status="i" var="movimientoBancoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: movimientoBancoInstance, field: "fecha")}</td>


            <td><g:if test="${movimientoBancoInstance.credito}">
                ${movimientoBancoInstance?.monto}
            </g:if></td>

            <td>
                <g:if test="${!movimientoBancoInstance.credito}">
                    ${movimientoBancoInstance?.monto}
                </g:if>
            </td>


            <td><g:link action="show" id="${movimientoBancoInstance.id}">${message(code: 'banco.verMovimiento')}</g:link></td>


        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <util:remotePaginate  total="${movimientoBancoInstanceCount ?: 0}" update="divbanco" action="getCuenta" max="20" pageSizes="[5: '5 por Página',10:'10 por Página',15:'15 por Página']" params="${[idBanco:idBanco]}"  />
</div>

<div class="fieldcontain">
    ${message(code: 'banco.saldo')}=${total}
</div>