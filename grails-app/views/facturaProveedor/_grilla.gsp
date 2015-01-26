<table>
    <thead>
    <tr>

        <th>${message(code: 'facturaProveedor.proveedor.label', default: 'Proveedor')}</th>

        <th>${message(code: 'facturaProveedor.numero.label', default: 'Numero')}</th>

        <th>${message(code: 'facturaProveedor.monto.label', default: 'Monto')}</th>

        <th>${message(code: 'facturaProveedor.fechaEmision.label', default: 'Fecha Emision')}</th>

        <th>${message(code: 'facturaProveedor.fechaVencimientoPago.label', default: 'Fecha Vencimiento Pago')}</th>

        <th>${message(code: 'facturaProveedor.fechaRealPago.label', default: 'Fecha Real Pago')}</th>

        <th>${message(code: 'facturaProveedor.descripcion.label', default: 'Descripcion')}</th>

<th></th>

        <th></th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${facturaProveedorInstanceList}" status="i" var="facturaProveedorInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

<td>${facturaProveedorInstance?.proveedor}</td>

            <td>${fieldValue(bean: facturaProveedorInstance, field: "numero")}</td>

            <td>${facturaProveedorInstance?.monto}</td>

            <td><g:formatDate date="${facturaProveedorInstance.fechaEmision}" format="dd-MM-yyyy" /></td>

            <td><g:formatDate date="${facturaProveedorInstance.fechaVencimientoPago}" format="dd-MM-yyyy" /></td>

            <td><g:formatDate date="${facturaProveedorInstance.fechaRealPago}" format="dd-MM-yyyy" /></td>

            <td>${ (facturaProveedorInstance?.descripcion?.size()>=40)? facturaProveedorInstance?.descripcion?.substring(0,40) +' ...':facturaProveedorInstance?.descripcion}</td>

            <td><g:link class="linkEdit" action="edit" id="${facturaProveedorInstance?.id}">${message(code: 'default.button.edit.label')}</g:link></td>
            <td><g:link class="linkShow" action="show" id="${facturaProveedorInstance?.id}">${message(code: 'default.button.show.label')}</g:link></td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${facturaProveedorInstanceCount ?: 0}" params="${filters}" />
</div>