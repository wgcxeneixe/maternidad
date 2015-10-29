<table class="ajax">
    <thead>
    <tr>

        <g:sortableColumn property="nombre" title="${message(code: 'practica.nombre.label', default: 'Nombre')}" params="${filters}" />

        <g:sortableColumn property="codigo" title="${message(code: 'practica.codigo.label', default: 'Codigo')}" params="${filters}" />

        <g:sortableColumn property="observacion" title="${message(code: 'practica.observacion.label', default: 'Observacion')}" params="${filters}" />

        <g:sortableColumn property="multiplicadorHonorario" title="${message(code: 'practica.multiplicadorHonorario.label', default: 'Multiplicador Honorario')}" params="${filters}" />


        <g:sortableColumn property="multiplicadorGasto" title="${message(code: 'practica.multiplicadorHonorario.label', default: 'Multiplicador Gasto')}" params="${filters}" />

        <th></th>
        <th></th>
    </tr>

    </thead>
    <tbody>
    <g:each in="${practicaInstanceList}" status="i" var="practicaInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: practicaInstance, field: "nombre")}</td>

            <td>${fieldValue(bean: practicaInstance, field: "codigo")}</td>

            <td>${fieldValue(bean: practicaInstance, field: "observacion")}</td>


            <td>${fieldValue(bean: practicaInstance, field: "multiplicadorHonorario")}</td>

            <td>${fieldValue(bean: practicaInstance, field: "multiplicadorGasto")}</td>

            <td><g:link class="linkEdit" action="editar" id="${practicaInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

            <td><g:link class="linkShow" action="showNomenclada" id="${practicaInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${practicaInstanceTotal ?: 0}" params="${filters}" />
</div>
