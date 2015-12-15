<g:formRemote name="myForm" update="updateMe"
              url="[controller: 'recibo', action: 'saveRecibo']">

    <div class="fieldcontain ${hasErrors(bean: reciboInstance, field: 'nro', 'error')} ">
        <label for="nro">
            <g:message code="recibo.nro.label" default="Nro" />

        </label>
        <g:field name="nro" type="number" value="${reciboInstance.nro}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: reciboInstance, field: 'fecha', 'error')} ">
        <label for="fecha">
            <g:message code="recibo.fecha.label" default="Fecha" />

        </label>
        <g:datePicker name="fecha" precision="day"  value="${reciboInstance?.fecha}" default="none" noSelection="['': '']" />

    </div>

    <div class="fieldcontain ${hasErrors(bean: reciboInstance, field: 'profesional', 'error')} ">
        <label for="profesional">
            <g:message code="recibo.profesional.label" default="Profesional" />

        </label>
        <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" value="${reciboInstance?.profesional?.id}" class="many-to-one" noSelection="['null': '']"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: reciboInstance, field: 'total', 'error')} ">
        <label for="total">
            <g:message code="recibo.total.label" default="Total" />

        </label>
        <g:field name="total" value="${fieldValue(bean: reciboInstance, field: 'total')}"/>

    </div>


    <h1>Detalle</h1>



    <div class="fieldcontain ${hasErrors(bean: detalleReciboInstance, field: 'conceptoProfesional', 'error')} ">
        <label for="conceptoProfesional">
            <g:message code="detalleRecibo.conceptoProfesional.label" default="Concepto Profesional" />

        </label>
        <g:select id="conceptoProfesional" name="conceptoProfesional.id" from="${maternidad.ConceptoProfesional.list()}" optionKey="id" value="${detalleReciboInstance?.conceptoProfesional?.id}" class="many-to-one" noSelection="['null': '']"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: detalleReciboInstance, field: 'valor', 'error')} ">
        <label for="valor">
            <g:message code="detalleRecibo.valor.label" default="Valor" />

        </label>
        <g:field name="valor" value="${fieldValue(bean: detalleReciboInstance, field: 'valor')}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: detalleReciboInstance, field: 'debitoCredito', 'error')} ">
        <label for="debitoCredito">
            <g:message code="detalleRecibo.debitoCredito.label" default="Debito Credito" />

        </label>
        <g:checkBox name="debitoCredito" value="${detalleReciboInstance?.debitoCredito}" />

    </div>



<g:submitButton name="guardar" value="Guardar"/>

</g:formRemote>

<div id="divupdate">
    <table>
        <thead>
        <tr>

            <th>${message(code: 'cheque.numero.label', default: 'Concepto Profesional')}</th>
            <th>${message(code: 'cheque.numero.label', default: 'Valor')}</th>
            <th>${message(code: 'cheque.numero.label', default: 'Débito/Crédito')}</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${detalleReciboInstance}" status="i" var="detalleInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${detalleInstance?.conceptoProfesional}</td>
                <td>${detalleInstance?.valor}</td>
                <td>${(detalleInstance?.debitoCredito)?"Débito":"Crédito"}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${detalleReciboInstance?.count ?: 0}" />
    </div>

</div>