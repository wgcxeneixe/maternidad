
<div id="list-planillaInternacion" class="content scaffold-list" role="main">
    <h1><g:message code="planillaInternacion.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="id"
                              title="${message(code: 'planillaInternacion.id', default: '#')}"/>

            <th><g:message code="planillaInternacion.paciente.label" default="Paciente"/></th>

            <th><g:message code="planillaInternacion.plan.label" default="Plan"/></th>

            <g:sortableColumn property="fechaInternacion"
                              title="${message(code: 'planillaInternacion.fechaInternacion.label', default: 'Fecha Internacion')}"/>

            <g:sortableColumn property="nombreFamiliarResponsable"
                              title="${message(code: 'planillaInternacion.nombreFamiliarResponsable.label', default: 'Nombre Familiar Responsable')}"/>

            <g:sortableColumn property="telefonoFamiliarResponsable"
                              title="${message(code: 'planillaInternacion.telefonoFamiliarResponsable.label', default: 'Telefono Familiar Responsable')}"/>

            <g:sortableColumn property="fechaAlta"
                              title="${message(code: 'planillaInternacion.fechaAlta.label', default: 'Fecha Alta')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${planillaInternacionInstanceList}" status="i" var="planillaInternacionInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
                    <g:link action="show" id="${planillaInternacionInstance.id}">
                        ${fieldValue(bean: planillaInternacionInstance, field: "id")}
                    </g:link>
                </td>

                <td>${fieldValue(bean: planillaInternacionInstance, field: "paciente")}</td>

                <td>${fieldValue(bean: planillaInternacionInstance, field: "plan")}</td>

                <td><g:formatDate type="date" style="MEDIUM"  date="${planillaInternacionInstance.fechaInternacion}"/></td>

                <td>${fieldValue(bean: planillaInternacionInstance, field: "nombreFamiliarResponsable")}</td>

                <td>${fieldValue(bean: planillaInternacionInstance, field: "telefonoFamiliarResponsable")}</td>

                <td><g:formatDate type="date" style="MEDIUM"  date="${planillaInternacionInstance.fechaAlta}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${planillaInternacionInstanceCount ?: 0}"/>
    </div>
</div>