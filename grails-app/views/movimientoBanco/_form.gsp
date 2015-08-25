<%@ page import="maternidad.MovimientoBanco" %>

<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'banco', 'error')} ">
    <label for="banco">
        <g:message code="movimientoBanco.banco.label" default="Banco" />

    </label>
    <g:select id="banco" name="banco.id" from="${maternidad.Banco.list()}" optionKey="id" value="${movimientoBancoInstance?.banco?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>



<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'tipoPago', 'error')} required">
    <label for="tipoPago">
        <g:message code="movimientoBanco.tipoPago.label" default="Tipo Pago" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="tipoPago" name="tipoPago.id" required="" from="${maternidad.TipoPago.list()}" optionKey="id" required="" noSelection="['':'Seleccione un tipo de Pago']" value="${movimientoBancoInstance?.tipoPago?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'monto', 'error')} ">
	<label for="monto">
		<g:message code="movimientoBanco.monto.label" default="Monto" />
		
	</label>
	<g:field type="number" step="any" required="" name="monto" value="${movimientoBancoInstance?.monto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="movimientoBanco.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="minute"  required="" value="${movimientoBancoInstance?.fecha}" default="none" noSelection="['': '']" />

</div>


<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'credito', 'error')} ">

    <label for="credito">
        <g:message code="movimientoBanco.credito.label" default="Credito" />
    </label>
    <g:radio name="credito" value="true" checked="true" />
    <label for="credito">
        <g:message code="movimientoBanco.credito.label" default="Debito" />
    </label><g:radio name="credito" value="false" />

</div>
<div id="divcheque">
<div  class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'numeroCheque', 'error')} ">
	<label for="cheque">
		<g:message code="movimientoBanco.cheque.label" default="Número Cheque" />
		
	</label>
	<g:textField name="numeroCheque" value="${movimientoBancoInstance?.numeroCheque}"/>

</div>

	<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'fechaEmision', 'error')} ">
		<label for="fecha">
			<g:message code="movimientoBanco.fecha.label" default="Fecha Emisión Cheque" />

		</label>
		<g:datePicker name="fechaEmision" precision="day"  required="" value="${movimientoBancoInstance?.fechaEmision}" default="none" noSelection="['': '']" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'fechaVencimientoCobro', 'error')} ">
		<label for="fecha">
			<g:message code="movimientoBanco.fecha.label" default="Fecha Vencimiento Cheque" />

		</label>
		<g:datePicker name="fechaVencimientoCobro" precision="day"  required="" value="${movimientoBancoInstance?.fechaVencimientoCobro}" default="none" noSelection="['': '']" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'bancoCheque', 'error')} ">
		<label for="banco">
			<g:message code="movimientoBanco.banco.label" default="Banco Cheque" />

		</label>
		<g:select  name="bancoCheque.id" from="${maternidad.Banco.list()}" optionKey="id" value="${movimientoBancoInstance?.bancoCheque?.id}" class="many-to-one" noSelection="['null': '']"/>

	</div>

</div>
<div id="divnrotransferencia" class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'numeroTransferencia', 'error')} ">
	<label for="numeroTransferencia">
		<g:message code="movimientoBanco.numeroTransferencia.label" default="Numero Transferencia" />
		
	</label>
	<g:textField name="numeroTransferencia" value="${movimientoBancoInstance?.numeroTransferencia}"/>

</div>

<div id="divcuentatransferencia" class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'cuentaTransferencia', 'error')} ">
	<label for="cuentaTransferencia">
		<g:message code="movimientoBanco.cuentaTransferencia.label" default="Cuenta Transferencia" />
		
	</label>
	<g:textField name="cuentaTransferencia" value="${movimientoBancoInstance?.cuentaTransferencia}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'facturaProveedor', 'error')} ">
	<label for="facturaProveedor">
		<g:message code="movimientoBanco.facturaProveedor.label" default="Factura Proveedor" />
		
	</label>
	<g:select id="facturaProveedor" name="facturaProveedor.id" from="${maternidad.FacturaProveedor.list()}" optionKey="id" value="${movimientoBancoInstance?.facturaProveedor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>



<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'conceptoBanco', 'error')} required">
	<label for="conceptoBanco">
		<g:message code="movimientoBanco.conceptoBanco.label" default="Concepto Banco" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conceptoBanco" name="conceptoBanco.id" from="${maternidad.ConceptoBanco.list()}" optionKey="id" required="" value="${movimientoBancoInstance?.conceptoBanco?.id}" class="many-to-one"/>

</div>



<div class="fieldcontain ${hasErrors(bean: movimientoBancoInstance, field: 'observacion', 'error')} ">
    <label for="observacion">
        <g:message code="movimientoBanco.observacion.label" default="Observacion" />

    </label>
    <g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${movimientoBancoInstance?.observacion}"/>

</div>

