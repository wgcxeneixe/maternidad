
<div>
<g:if test="${listaLiquidaciones}">
    <g:form>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="nombre" title="Nombre" />

            <g:sortableColumn property="codigo" title="Codigo" />

            <g:sortableColumn property="observacion" title="Observacion" />

            <g:sortableColumn property="esMensual" title="Es Mensual" />

            <g:sortableColumn property="credito" title="Es Credito" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${listaConceptoProfesional}" status="i" var="conceptoProfesionalInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: conceptoProfesionalInstance, field: "nombre")}</td>

                <td>${fieldValue(bean: conceptoProfesionalInstance, field: "codigo")}</td>

                <td>${fieldValue(bean: conceptoProfesionalInstance, field: "observacion")}</td>

                <td><g:formatBoolean boolean="${conceptoProfesionalInstance.esMensual}" /></td>

                <td><g:formatBoolean boolean="${conceptoProfesionalInstance.credito}" /></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <table>
        <thead>
        <tr>

            <g:sortableColumn property="fecha" title="Fecha" />

            <th>Factura</th>

            <g:sortableColumn property="retencion" title="Retencion" />

            <g:sortableColumn property="aclaracionComprobante" title="Aclaracion Comprobante" />

            <g:sortableColumn property="monto" title="Monto" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${listaPagoFactura}" status="i" var="pagoFacturaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:formatDate date="${pagoFacturaInstance.fecha}" /></td>

                <td>${fieldValue(bean: pagoFacturaInstance, field: "factura")}</td>

                <td><g:link action="show" id="${pagoFacturaInstance.id}">${fieldValue(bean: pagoFacturaInstance, field: "retencion")}</g:link></td>

                <td>${fieldValue(bean: pagoFacturaInstance, field: "aclaracionComprobante")}</td>

                <td>${fieldValue(bean: pagoFacturaInstance, field: "monto")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <table>
        <thead>
        <tr>

            <g:sortableColumn property="profesional" title="Profesional" />

            <g:sortableColumn property="montoBruto" title="Monto Bruto" />

            <g:sortableColumn property="montoNeto" title="Monto Neto" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${listaLiquidaciones}" status="i" var="liquidacionInstance">
            <tr>

                <td>${fieldValue(bean: liquidacionInstance, field: "profesional")}</td>

                <td>${fieldValue(bean: liquidacionInstance, field: "montoBruto")}</td>

                <td>${fieldValue(bean: liquidacionInstance, field: "montoNeto")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

        <fieldset class="buttons">
            <g:actionSubmit class="save" action="liquidarAction" value="Liquidar" onclick="return confirm('¿Está seguro de Liquidar?');" />
        </fieldset>
    </g:form>
</g:if>
</div>
