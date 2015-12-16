<table class="ajax">
    <thead>
    <tr>

        <g:sortableColumn property="nro" title="${message(code: 'recibo.nro.label', default: 'Nro')}" params="${filters}" />

        <g:message code="recibo.profesional.label" default="Fecha" params="${filters}" />

        <th><g:message code="recibo.profesional.label" default="Profesional" params="${filters}" /></th>

        <g:sortableColumn property="total" title="${message(code: 'recibo.total.label', default: 'Total')}" params="${filters}" />
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${reciboInstanceList}" status="i" var="reciboInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${reciboInstance.id}">${fieldValue(bean: reciboInstance, field: "nro")}</g:link></td>

            <td><g:formatDate date="${reciboInstance.fecha}" /></td>

            <td>${fieldValue(bean: reciboInstance, field: "profesional")}</td>

            <td>${fieldValue(bean: reciboInstance, field: "total")}</td>
            <td><g:link class="linkEdit" action="edit" id="${reciboInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${reciboInstanceCount ?: 0}" />
</div>
</div>