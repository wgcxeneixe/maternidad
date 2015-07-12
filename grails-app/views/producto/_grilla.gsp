<table>
    <thead>
    <tr>

        <g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" params="${filters}" />

        <g:sortableColumn property="codigo" title="${message(code: 'producto.codigo.label', default: 'Codigo')}" params="${filters}" />

        <g:sortableColumn property="descripcion" title="${message(code: 'producto.descripcion.label', default: 'Descripcion')}" params="${filters}" />

        <g:sortableColumn property="cantidadMinima" title="${message(code: 'producto.cantidadMinima.label', default: 'Cantidad Minima')}" params="${filters}" />

        <th>${message(code: 'producto.columnaStock')}</th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${productoInstanceList}" status="i" var="productoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: productoInstance, field: "nombre")}</td>

            <td>${fieldValue(bean: productoInstance, field: "codigo")}</td>

            <td>${ (productoInstance?.descripcion?.size()>=40)? productoInstance?.descripcion?.substring(0,40) +' ...':productoInstance?.descripcion}</td>

            <td>${fieldValue(bean: productoInstance, field: "cantidadMinima")}</td>

<td>${productoInstance?.stock()}</td>

            <td><g:link class="linkEdit"  action="edit" id="${productoInstance?.id}">${message(code: 'default.button.edit.label')}</g:link></td>

            <td><g:link class="linkShow"  action="show" id="${productoInstance?.id}">${message(code: 'default.button.show.label')}</g:link></td>

<td><g:link class="linkCrearMovimiento" controller="movimientoStock"  action="create" id="${productoInstance?.id}">${message(code: 'producto.agregarMovimiento')}</g:link></td>


            <td><g:link class="linkDetalleMovimiento" controller="movimientoStock"  action="stock" id="${productoInstance?.id}">${message(code: 'producto.detalleMovimientos')}</g:link></td>

        </tr>



    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${productoInstanceTotal ?: 0}" params="${filters}" />
</div>