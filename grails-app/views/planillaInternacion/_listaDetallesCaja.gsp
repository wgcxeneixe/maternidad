<div id="list-detalleCaja" class="content scaffold-list" role="main">
    <h1><g:message code="planillainternacion.listatransaccionescaja"  /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="id" title="${message(code: 'detalleCaja.id.labelindex', default: 'Nº')}" />

            <g:sortableColumn property="cajaDiaria.id" title="${message(code: 'cajaDiaria.label', default: 'Caja')}" />

            <g:sortableColumn property="fecha" title="${message(code: 'detalleCaja.fecha.label', default: 'Fecha')}" />

            <th><g:message code="detalleCaja.conceptocaja.label" default="Conceptocaja" /></th>

            <g:sortableColumn property="credito" title="${message(code: 'detalleCaja.credito.label', default: 'Credito')}" />

            <g:sortableColumn property="monto" title="${message(code: 'detalleCaja.monto.label', default: 'Monto')}" />

            <th><g:message code="cajaDiaria.observaciones.label"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${planillaInternacionInstance?.detallesCaja}" status="i" var="detalleCajaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: detalleCajaInstance, field: "id")}</td>

                <td>${fieldValue(bean: detalleCajaInstance, field: "caja")}</td>

                <td>
                    <g:formatDate date="${detalleCajaInstance.fecha}" type="datetime" style="SHORT" timeStyle="SHORT"/>
                </td>

               <!-- <td>${fieldValue(bean: detalleCajaInstance, field: "planillainternacion")}</td>-->

                <td>${fieldValue(bean: detalleCajaInstance, field: "conceptocaja")}</td>

                <td><g:formatBoolean boolean="${detalleCajaInstance.credito}" true="Crédito" false="Débito" /></td>

                <td>$ ${fieldValue(bean: detalleCajaInstance, field: "monto")}</td>

                <td>${ (detalleCajaInstance?.observaciones?.size()>=50)? detalleCajaInstance?.observaciones?.substring(0,50) +' ...':detalleCajaInstance?.observaciones}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <!--<div class="pagination">
        <g:paginate total="${detalleCajaInstanceCount ?: 0}" />
    </div>-->
</div>