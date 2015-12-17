<table>
    <thead>
    <tr>
        <th>
            <g:message code="factura.fecha.label" default="Planilla"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Periodo"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Plan"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Paciente"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Total"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Honorarios"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Gastos"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Medicamentos"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Pago Completo"/>
        </th>

        <th>
            <g:message code="factura.fecha.label" default="Liquidada"/>
        </th>

        <!--
        <g:sortableColumn property="periodo" title="${message(code: 'factura.periodo.label', default: 'Periodo')}"
                          params="${filters}"/>

        <g:sortableColumn property="plan" title="${message(code: 'factura.plan.label', default: 'Fecha')}"
                          params="${filters}"/>

        <g:sortableColumn property="nrofactura"
                          title="${message(code: 'factura.nrofactura.label', default: 'Nrofactura')}"
                          params="${filters}"/>


        <g:sortableColumn property="totalFacturado" title="${message(code: 'factura.periodo.label', default: 'Total')}"
                          params="${filters}"/>

        <g:sortableColumn property="pagoCompleto"
                          title="${message(code: 'factura.pagoCompleto.label', default: 'Pago Completo')}"
                          params="${filters}"/>


        <th><g:message code="factura.plan.label" default="Plan" params="${filters}"/></th>

        <g:sortableColumn property="anulada" title="${message(code: 'factura.anulada.label', default: 'Anulada')}"
                          params="${filters}"/>


        <th></th>

        -->


        <th>
            <g:message code="factura.fecha.label" default="Detalle"/>
        </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${facturaInstanceList}" status="i" var="facturaInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${facturaInstance?.planillaInternacion?.numeroIngreso}</td>

            <td>${fieldValue(bean: facturaInstance, field: "periodo")}</td>

            <td>${facturaInstance?.planillaInternacion?.plan}</td>

            <td>${facturaInstance?.planillaInternacion?.paciente}</td>

            <td>${Math.round(facturaInstance?.totalFacturado * 100) / 100}</td>

            <td>${Math.round(facturaInstance?.totalHonorario * 100) / 100}</td>

            <td>${Math.round(facturaInstance?.totalGasto * 100) / 100}</td>

            <td>${Math.round(facturaInstance?.totalMedicamento * 100) / 100}</td>

            <td><g:formatBoolean boolean="${facturaInstance.pagoCompleto}"/></td>

            <td><g:formatBoolean boolean="${facturaInstance.liquidada}"/></td>

            <td><g:link class="linkShow" action="show"
                        id="${facturaInstance?.id}">${message(code: 'default.button.show.label')}</g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${facturaInstanceTotal ?: 0}" />
</div>