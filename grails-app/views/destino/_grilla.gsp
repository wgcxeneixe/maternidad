<table>
    <thead>
    <tr>

        <g:sortableColumn property="nombre" title="${message(code: 'destino.nombre.label', default: 'Nombre')}" params="${filters}"/>

        <g:sortableColumn property="codigo" title="${message(code: 'destino.codigo.label', default: 'Codigo')}" params="${filters}"/>

        <g:sortableColumn property="descripcion" title="${message(code: 'destino.descripcion.label', default: 'Descripcion')}" params="${filters}" />
<th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${destinoInstanceList}" status="i" var="destinoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: destinoInstance, field: "nombre")}</td>

            <td>${fieldValue(bean: destinoInstance, field: "codigo")}</td>

            <td>${fieldValue(bean: destinoInstance, field: "descripcion")}</td>

            <td><g:link class="linkEdit" action="edit" id="${destinoInstance?.id}">${message(code: 'default.button.edit.label')}</g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${destinoInstanceCount ?: 0}" params="${filters}" />
</div>