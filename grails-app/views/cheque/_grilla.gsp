<table>
    <thead>
    <tr>

        <th>${message(code: 'cheque.numero.label', default: 'Numero')}</th>

        <th>${message(code: 'cheque.monto.label', default: 'Monto')}</th>

        <th>${message(code: 'cheque.fechaEmision.label', default: 'Fecha Emision')}</th>

        <th>${message(code: 'cheque.fechaVencimientoCobro.label', default: 'Fecha Vencimiento Cobro')}</th>

        <th>${message(code: 'cheque.fechaRealCobro.label', default: 'Fecha Real Cobro')}</th>

        <th>${message(code: 'cheque.descripcion.label', default: 'Descripcion')}</th>



      <th></th>
        <th></th>


    </tr>
    </thead>
    <tbody>
    <g:each in="${chequeInstanceList}" status="i" var="chequeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${chequeInstance?.numero}</td>

            <td>${chequeInstance?.monto}</td>

            <td><g:formatDate date="${chequeInstance.fechaEmision}" format="dd-MM-yyyy" /></td>

            <td><g:formatDate date="${chequeInstance.fechaVencimientoCobro}" format="dd-MM-yyyy" /></td>

            <td><g:formatDate date="${chequeInstance.fechaRealCobro}" format="dd-MM-yyyy" /></td>

            <td>${ (chequeInstance?.descripcion?.size()>=40)? chequeInstance?.descripcion?.substring(0,40) +' ...':chequeInstance?.descripcion}</td>

            <td><g:link class="linkEdit" action="edit" id="${chequeInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

            <td><g:link class="linkShow" action="show" id="${chequeInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>


        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${chequeInstanceCount ?: 0}" params="${filters}"/>
</div>