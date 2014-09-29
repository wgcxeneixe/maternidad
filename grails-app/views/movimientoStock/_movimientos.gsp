
<table>
    <thead>
    <tr>

        <th><g:message code="movimientoStock.producto.label" default="Producto" /></th>

        <th><g:message code="movimientoStock.destino.label" default="Destino" /></th>

        <th>Ingreso</th>

        <th>Egreso</th>

        <g:sortableColumn property="descripcion" title="${message(code: 'movimientoStock.descripcion.label', default: 'Descripcion')}" />

        <g:sortableColumn property="fecha" title="${message(code: 'movimientoStock.fecha.label', default: 'Fecha')}" />

    </tr>
    </thead>
    <tbody>
    <g:each in="${movimientoStockInstanceList}" status="i" var="movimientoStockInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${movimientoStockInstance.id}">${fieldValue(bean: movimientoStockInstance, field: "producto")}</g:link></td>

            <td>${fieldValue(bean: movimientoStockInstance, field: "destino")}</td>

            <td><g:if test="${movimientoStockInstance.ingreso}">
                ${movimientoStockInstance.cantidad}
            </g:if></td>

            <td>

                <g:if test="${!movimientoStockInstance.ingreso}">
                    ${movimientoStockInstance.cantidad}
                </g:if>


            </td>

            <td>${fieldValue(bean: movimientoStockInstance, field: "descripcion")}</td>

            <td><g:formatDate date="${movimientoStockInstance.fecha}" /></td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <util:remotePaginate  total="${movimientoStockInstanceCount ?: 0}" update="divstock" action="getSaldoStock" pageSizes="[5: '5 por Página',10:'10 por Página',15:'15 por Página']" params="${[idProducto:idProducto]}"  />
</div>

<div class="fieldcontain">
    ${message(code: 'stock.totalenstock')}=${total}
</div>