<table>
    <thead>
    <tr>


        <th>
            <g:message code="factura.fecha.label" default="Fecha"/>
        </th>

        <th>
            <g:message code="factura.fecha.label" default="Nro Factura"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Total"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Pago Completo"/>
        </th>
        <th>
            <g:message code="factura.fecha.label" default="Periodo"/>
        </th>


        <th>
            <g:message code="factura.fecha.label" default="Plan"/>
        </th>




        <th>
            <g:message code="factura.fecha.label" default="Anulada"/>
        </th>


        <!--
        <g:sortableColumn property="fecha" title="${message(code: 'factura.fecha.label', default: 'Fecha')}" params="${filters}" />

        <g:sortableColumn property="nrofactura" title="${message(code: 'factura.nrofactura.label', default: 'Nrofactura')}" params="${filters}" />


        <g:sortableColumn property="totalFacturado" title="${message(code: 'factura.periodo.label', default: 'Total')}" params="${filters}" />

        <g:sortableColumn property="pagoCompleto" title="${message(code: 'factura.pagoCompleto.label', default: 'Pago Completo')}" params="${filters}" />

        <g:sortableColumn property="periodo" title="${message(code: 'factura.periodo.label', default: 'Periodo')}" params="${filters}" />

        <th><g:message code="factura.plan.label" default="Plan" params="${filters}" /></th>

        <g:sortableColumn property="anulada" title="${message(code: 'factura.anulada.label', default: 'Anulada')}" params="${filters}" />


        <th></th>

        -->

        <th></th>

        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${facturaInstanceList}" status="i" var="facturaInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:formatDate format="dd-MM-yyyy" date="${facturaInstance.fecha}" /></td>

            <td>${fieldValue(bean: facturaInstance, field: "nrofactura")}</td>

            <td>${ Math.round(facturaInstance?.totalFacturado * 100) / 100}</td>

            <td><g:formatBoolean boolean="${facturaInstance.pagoCompleto}" /></td>

            <td>${fieldValue(bean: facturaInstance, field: "periodo")}</td>

            <td>${facturaInstance?.planillaInternacion?.plan}</td>

            <td><g:formatBoolean boolean="${facturaInstance?.anulada}"/></td>

              <td><g:link class="linkEdit" action="edit" id="${facturaInstance?.id}">${message(code: 'default.button.edit.label')}</g:link></td>
            <td><g:link class="linkShow" action="show" id="${facturaInstance?.id}">${message(code: 'default.button.show.label')}</g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${facturaInstanceTotal ?: 0}"/>
</div>