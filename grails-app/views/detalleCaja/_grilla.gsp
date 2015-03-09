<table>
    <thead>
    <tr>

        <th>${message(code: 'detalleCaja.id.labelindex', default: 'Nº')}</th>


        <th> ${message(code: 'cajaDiaria.label', default: 'Caja')}  </th>

        <th>${message(code: 'detalleCaja.fecha.label', default: 'Fecha')}</th>

        <th><g:message code="detalleCaja.planillainternacion.label" default="Planillainternacion" params="${filters}" /></th>

        <th><g:message code="detalleCaja.conceptocaja.label" default="Conceptocaja" params="${filters}" /></th>

        <th>${message(code: 'detalleCaja.credito.label', default: 'Credito')}</th>

        <th>${message(code: 'detalleCaja.monto.label', default: 'Monto')}</th>


    </tr>
    </thead>
    <tbody>
    <g:each in="${detalleCajaInstanceList}" status="i" var="detalleCajaInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${detalleCajaInstance.id}">${fieldValue(bean: detalleCajaInstance, field: "id")}</g:link></td>

            <td>${fieldValue(bean: detalleCajaInstance, field: "caja")}</td>

            <td>
                <g:formatDate date="${detalleCajaInstance.fecha}" type="datetime" style="SHORT" timeStyle="SHORT"/>
            </td>

            <td>${fieldValue(bean: detalleCajaInstance, field: "planillainternacion")}</td>

            <td>${fieldValue(bean: detalleCajaInstance, field: "conceptocaja")}</td>

            <td><g:formatBoolean boolean="${detalleCajaInstance.credito}" true="Crédito" false="Débito" /></td>

            <td>$ ${fieldValue(bean: detalleCajaInstance, field: "monto")}</td>


        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${detalleCajaInstanceCount ?: 0}" params="${filters}" />
</div>