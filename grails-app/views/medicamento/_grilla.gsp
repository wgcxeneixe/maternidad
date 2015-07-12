<table>
    <thead>
    <tr>

        <g:sortableColumn property="codigo" title="${message(code: 'medicamento.codigo.label', default: 'Codigo')}" params="${filters}"/>

        <g:sortableColumn property="nombre" title="${message(code: 'medicamento.nombre.label', default: 'Nombre')}" params="${filters}" />

        <g:sortableColumn property="activo" title="${message(code: 'medicamento.activo.label', default: 'Activo')}" params="${filters}"/>

       <th><g:message code="medicamento.marca.label" default="Tipo Medicamento" /></th>

        <th><g:message code="medicamento.marca.label" default="Laboratorio" /></th>

        <g:sortableColumn property="valor" title="${message(code: 'medicamento.valor.label', default: 'Valor')}" params="${filters}" />
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${medicamentoInstanceList}" status="i" var="medicamentoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: medicamentoInstance, field: "codigo")}</td>

            <td>${fieldValue(bean: medicamentoInstance, field: "nombre")}</td>

            <td><g:formatBoolean boolean="${medicamentoInstance.activo}" /></td>

            <td>${medicamentoInstance?.tipoMedicamento}</td>

            <td>${fieldValue(bean: medicamentoInstance, field: "laboratorio")}</td>

            <td>${medicamentoInstance?.valor}</td>

            <td><g:link class="linkEdit" action="edit" id="${medicamentoInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

            <td><g:link class="linkShow" action="show" id="${medicamentoInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${medicamentoInstanceTotal ?: 0}" />
</div>