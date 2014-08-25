<table>
    <thead>
    <tr>

        <g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" params="${filters}" />

        <g:sortableColumn property="codigo" title="${message(code: 'producto.codigo.label', default: 'Codigo')}" params="${filters}" />

        <g:sortableColumn property="descripcion" title="${message(code: 'producto.descripcion.label', default: 'Descripcion')}" params="${filters}" />

        <g:sortableColumn property="cantidadMinima" title="${message(code: 'producto.cantidadMinima.label', default: 'Cantidad Minima')}" params="${filters}" />

    </tr>
    </thead>
    <tbody>
    <g:each in="${productoInstanceList}" status="i" var="productoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${productoInstance.id}">${fieldValue(bean: productoInstance, field: "nombre")}</g:link></td>

            <td>${fieldValue(bean: productoInstance, field: "codigo")}</td>

            <td>${fieldValue(bean: productoInstance, field: "descripcion")}</td>

            <td>${fieldValue(bean: productoInstance, field: "cantidadMinima")}</td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${productoInstanceCount ?: 0}" params="${filters}" />
</div>