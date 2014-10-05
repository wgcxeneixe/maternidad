<span class="label_input">
    <label>Facturas adeudadas de ${obrasocialNombre}</label>
</span>

<table>
    <thead>
    <tr>
        <th>Numero/Periodo</th>
        <th>Plan</th>
        <th>Total Facturado</th>

        <th>Total Pagado</th>
        <th>Saldo</th>
        <th>Fecha de Cobro</th>
        <th>Pagar FACTURA</th>

    </tr>
    </thead>

    <tbody>
    <g:each in="${listaFacturasSinPagar}" status="i" var="item">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td>${item?.nrofactura} - ${item?.periodo}</td>
            <td>${item?.plan}</td>
            <td>${item?.totalFacturado}</td>

            <td>${item?.totalPagado}</td>
            <td>${item?.totalFacturado - item?.totalPagado}</td>
            <td>${item?.fecha?.format('dd/MM/yyyy')}</td>
            <td><g:link action="verPagos" controller="factura" id="${item?.id}"
                        name="Ver Pagos"
                        onclick="${remoteFunction(action: 'verPagos',
                                params: '\'idPago=\' + this.value',
                                update: 'remotoDivListaPagos')};">Ver Pagos</g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>


<div class="buttons">
    <span class="button"><g:submitButton action="" name="volver atras"
                                         value="Volver atras"/></span>
</div>