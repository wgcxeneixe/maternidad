
<table>
    <thead>
    <tr>

        <g:sortableColumn property="cuit" title="${message(code: 'proveedor.cuit.label', default: 'Cuit')}" params="${filters}"/>

        <g:sortableColumn property="nombre" title="${message(code: 'proveedor.nombre.label', default: 'Nombre')}" params="${filters}"/>

        <g:sortableColumn property="direccion" title="${message(code: 'proveedor.direccion.label', default: 'Direccion')}" params="${filters}"/>

        <g:sortableColumn property="telefono" title="${message(code: 'proveedor.telefono.label', default: 'Telefono')}" params="${filters}"/>

        <g:sortableColumn property="email" title="${message(code: 'proveedor.email.label', default: 'Email')}" params="${filters}"/>

        <th><g:message code="proveedor.localidad.label" default="Localidad" params="${filters}" /></th>

        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${proveedorInstanceList}" status="i" var="proveedorInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${proveedorInstance?.cuit}</td>

            <td>${fieldValue(bean: proveedorInstance, field: "nombre")}</td>

            <td>${fieldValue(bean: proveedorInstance, field: "direccion")}</td>

            <td>${fieldValue(bean: proveedorInstance, field: "telefono")}</td>

            <td>${fieldValue(bean: proveedorInstance, field: "email")}</td>

            <td>${fieldValue(bean: proveedorInstance, field: "localidad")}</td>

            <td><g:link class="linkEdit" action="edit" id="${proveedorInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

            <td><g:link class="linkShow" action="show" id="${proveedorInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>



        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${proveedorInstanceCount ?: 0}" params="${filters}" />
</div>