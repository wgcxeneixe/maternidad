<table>
    <thead>
    <tr>

        <th>${message(code: 'practica.nombre.label', default: 'Nombre')}</th>


        <th>${message(code: 'practica.codigo.label', default: 'Codigo')}</th>


        <th><g:message code="convenio.valorAnestesista" params="${filters}"/></th>

        <th><g:message code="convenio.valorAyudante" params="${filters}"/></th>

        <th><g:message code="convenio.valorEspecialista" params="${filters}"/></th>

        <th><g:message code="convenio.valorGasto" params="${filters}"/></th>


        <th></th>


    </tr>
    </thead>
    <tbody>
    <g:each in="${valores}" status="i" var="valor">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${valor?.practica?.nombre}</td>

            <td>${valor?.practica?.codigo}</td>

            <td>${valor?.valorAnestecista}</td>

            <td>${valor?.valorAyudante}</td>

            <td>${valor?.valorEspecialista}</td>

            <td>${valor?.valorGasto}</td>


            <g:if test="${valor?.valorHonorario}">

                <td><g:link class="linkEdit" controller="convenio" action="editAsociarPractica" id="${valor?.id}" >${message(code: 'default.button.edit.label')}</g:link></td>

            </g:if>
            <g:else>

                <td><g:link class="linkEdit" controller="convenio" action="verRelacionPractica" id="${valor?.id}" >${message(code: 'default.button.show.label')}</g:link></td>

            </g:else>


        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${valoresTotal ?: 0}" params="${filters}" />
</div>