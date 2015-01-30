<table>
    <thead>
    <tr>

        <th>${message(code: 'movimientoBanco.banco.label', default: 'Banco')}</th>

<th>${message(code: 'movimientoBanco.monto.label', default: 'Monto')}</th>

<th>${message(code: 'movimientoBanco.fecha.label', default: 'Fecha')}</th>


        <th><g:message code="movimientoBanco.cheque.label" default="Cheque" /></th>

<th>${message(code: 'movimientoBanco.numeroTransferencia.label', default: 'Numero Transferencia')}</th>

        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${movimientoBancoInstanceList}" status="i" var="movimientoBancoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${movimientoBancoInstance?.banco}</td>

            <td>${movimientoBancoInstance?.monto}</td>

            <td><g:formatDate date="${movimientoBancoInstance?.fecha}" /></td>



            <td>${fieldValue(bean: movimientoBancoInstance, field: "cheque")}</td>

            <td>${fieldValue(bean: movimientoBancoInstance, field: "numeroTransferencia")}</td>

            <td><g:link class="linkEdit" action="edit" id="${movimientoBancoInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

            <td><g:link class="linkShow" action="show" id="${movimientoBancoInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>




        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${movimientoBancoInstanceCount ?: 0}" params="${filters}" />
</div>