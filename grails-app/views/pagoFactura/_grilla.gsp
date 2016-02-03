<table>
    <thead>
    <tr>

        <g:sortableColumn property="retencion" title="${message(code: 'pagoFactura.retencion.label', default: 'Retencion')}" params="${filters}" />

        <g:sortableColumn property="aclaracionComprobante" title="${message(code: 'pagoFactura.aclaracionComprobante.label', default: 'Aclaracion Comprobante')}" params="${filters}" />

        <th><g:message code="pagoFactura.factura.label" default="Factura"  /></th>

        <th><g:message code="pagoFactura.factura.label" default="Fecha"  /></th>

        <th><g:message code="pagoFactura.liquidacion.label" default="Liquidacion"  /></th>

        <g:sortableColumn property="monto" title="${message(code: 'pagoFactura.monto.label', default: 'Monto')}" params="${filters}" />

    </tr>
    </thead>
    <tbody>
    <g:each in="${pagoFacturaInstanceList}" status="i" var="pagoFacturaInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${pagoFacturaInstance?.retencion}</td>

            <td>${fieldValue(bean: pagoFacturaInstance, field: "aclaracionComprobante")}</td>

            <td>${fieldValue(bean: pagoFacturaInstance, field: "factura")}</td>

            <td><g:formatDate format="dd-MM-yyyy" date="${pagoFacturaInstance.fecha}" /></td>

            <td>${fieldValue(bean: pagoFacturaInstance, field: "liquidacion")}</td>

            <td>${fieldValue(bean: pagoFacturaInstance, field: "monto")}</td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${pagoFacturaInstanceCount ?: 0}" params="[fechaDesde:(filters?.fechaDesde)?new java.text.SimpleDateFormat('EEE MMM dd HH:mm:ss z yyyy', Locale.US).parse(filters?.fechaDesde.toString() ):(new Date()),fechaHasta:(filters?.fechaHasta)?new java.text.SimpleDateFormat('EEE MMM dd HH:mm:ss z yyyy', Locale.US).parse(filters?.fechaHasta.toString() ):(new Date()), periodo:filters.periodo,plan:filters?.plan,factura:filters?.factura]" />
</div>