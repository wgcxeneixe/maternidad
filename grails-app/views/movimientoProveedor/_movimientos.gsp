
<table>
    <thead>
    <tr>


        <th>${message(code: 'movimientoProveedor.fecha.label', default: 'Fecha')}</th>

        <th>Ingreso</th>

        <th>Egreso</th>

        <th><g:message code="movimientoProveedor.banco.label" default="Proveedor" /></th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${movimientoProveedorInstanceList}" status="i" var="movimientoProveedorInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: movimientoProveedorInstance, field: "fecha")}</td>


            <td><g:if test="${movimientoProveedorInstance.credito}">
                ${movimientoProveedorInstance?.monto}
            </g:if></td>

            <td>
                <g:if test="${!movimientoProveedorInstance.credito}">
                    ${movimientoProveedorInstance?.monto}
                </g:if>
            </td>


            <td><g:link action="show" id="${movimientoProveedorInstance.id}">${message(code: 'banco.verMovimiento')}</g:link></td>


        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <util:remotePaginate  total="${movimientoProveedorInstanceCount ?: 0}" update="divproveedor" action="getCuenta" pageSizes="[5: '5 por Página',10:'10 por Página',15:'15 por Página']" params="${[idProveedor:idProveedor]}"  />
</div>

<div class="fieldcontain">
    ${message(code: 'banco.saldo')}=${total}
</div>