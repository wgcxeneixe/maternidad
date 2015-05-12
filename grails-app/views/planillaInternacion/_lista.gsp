
<div id="list-planillaInternacion" class="content scaffold-list" role="main">
    <h1><g:message code="planillaInternacion.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table>
        <thead>
        <tr>

            <g:sortableColumn property="id"
                              title="${message(code: 'planillaInternacion.id', default: 'Nº')}" params="${filters}"/>

            <th><g:message code="planillaInternacion.paciente.label" default="Paciente" params="${filters}"/></th>

            <th><g:message code="planillaInternacion.plan.label" default="Plan" params="${filters}"/></th>


            <th><g:message code="planillaInternacion.estado.label" default="Estado" params="${filters}"/></th>



            <g:sortableColumn property="fechaInternacion"
                              title="${message(code: 'planillaInternacion.fechaInternacion.label', default: 'Fecha Internacion')}" params="${filters}"/>


            <g:sortableColumn property="fechaAlta"
                              title="${message(code: 'planillaInternacion.fechaAlta.label', default: 'Fecha Alta')}" params="${filters}"/>

            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>

            <g:if test="${filters?.estado==maternidad.EstadoPlanilla.findByNombre("EN PROCESO")?.id?.toString()}">
                <th></th>
            </g:if>


        </tr>
        </thead>
        <tbody>
        <g:each in="${planillaInternacionInstanceList}" status="i" var="planillaInternacionInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${planillaInternacionInstance?.numeroIngreso}</td>

                <td>${fieldValue(bean: planillaInternacionInstance, field: "paciente")}</td>

                <td>${fieldValue(bean: planillaInternacionInstance, field: "plan")}</td>

                <td> ${ planillaInternacionInstance?.estadoPlanilla } </td>



                <td><g:formatDate type="date" style="MEDIUM"  date="${planillaInternacionInstance.fechaInternacion}"/></td>


                <td><g:formatDate type="date" style="MEDIUM"  date="${planillaInternacionInstance.fechaAlta}"/></td>

                <!-- ACCIONES -->

                <td><g:link class="linkEdit" action="edit" id="${planillaInternacionInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>


                <td><g:link class="linkShow" action="show" id="${planillaInternacionInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>


                <td><g:link controller="detalleFactura"  action="cargaPracticas" id="${planillaInternacionInstance.id}">${message(code: 'facturacion.cargaPracticas')}</g:link></td>

                <td><g:link controller="detalleFactura"  action="cargaMedicamentos" id="${planillaInternacionInstance.id}">${message(code: 'planillainternacion.cargademedicamentos')}</g:link></td>

                <td><g:link controller="planillaInternacion"  action="imprimirOrden" id="${planillaInternacionInstance.id}">${message(code: 'planillaInternacion.imprimirOrden')}</g:link></td>

                <td><g:link controller="planillaInternacion"  action="asociarMedicos" id="${planillaInternacionInstance.id}">${message(code: 'planillaInternacion.asociarProfesional')}</g:link></td>

                <g:if test="${filters.estado == maternidad.EstadoPlanilla.findByCodigo("IMP")?.id?.toString()}">
                    <td><g:checkBox  name="facturar" value="${planillaInternacionInstance.id}"/> </td>
                </g:if>


            </tr>
        </g:each>
        </tbody>
    </table>
${(planillaInternacionInstanceCount<20)?"Total Planillas:"+planillaInternacionInstanceCount:""}
    <div class="pagination">
        <g:paginate total="${planillaInternacionInstanceCount ?: 0}" params="${filters}"/>
    </div>
</div>