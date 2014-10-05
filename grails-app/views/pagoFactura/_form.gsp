<%@ page import="maternidad.PagoFactura" %>



<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'retencion', 'error')} ">
	<label for="retencion">
		<g:message code="pagoFactura.retencion.label" default="Retencion" />
		
	</label>
	<g:field name="retencion" value="${fieldValue(bean: pagoFacturaInstance, field: 'retencion')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'aclaracionComprobante', 'error')} required">
	<label for="aclaracionComprobante">
		<g:message code="pagoFactura.aclaracionComprobante.label" default="Aclaracion Comprobante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="aclaracionComprobante" required="" value="${pagoFacturaInstance?.aclaracionComprobante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'factura', 'error')} required">
	<label for="factura">
		<g:message code="pagoFactura.factura.label" default="Factura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="factura" name="factura.id" from="${maternidad.Factura.list()}" optionKey="id" required="" value="${pagoFacturaInstance?.factura?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="pagoFactura.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${pagoFacturaInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'liquidacion', 'error')} required">
	<label for="liquidacion">
		<g:message code="pagoFactura.liquidacion.label" default="Liquidacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="liquidacion" name="liquidacion.id" from="${maternidad.Liquidacion.list()}" optionKey="id" required="" value="${pagoFacturaInstance?.liquidacion?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="pagoFactura.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: pagoFacturaInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'numeroComprobante', 'error')} required">
	<label for="numeroComprobante">
		<g:message code="pagoFactura.numeroComprobante.label" default="Numero Comprobante" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroComprobante" type="number" value="${pagoFacturaInstance.numeroComprobante}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'porcentajeALiquidar', 'error')} required">
	<label for="porcentajeALiquidar">
		<g:message code="pagoFactura.porcentajeALiquidar.label" default="Porcentaje AL iquidar" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="porcentajeALiquidar" value="${fieldValue(bean: pagoFacturaInstance, field: 'porcentajeALiquidar')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'porcentajeLiquidado', 'error')} required">
	<label for="porcentajeLiquidado">
		<g:message code="pagoFactura.porcentajeLiquidado.label" default="Porcentaje Liquidado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="porcentajeLiquidado" value="${fieldValue(bean: pagoFacturaInstance, field: 'porcentajeLiquidado')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'retencionPagos', 'error')} ">
	<label for="retencionPagos">
		<g:message code="pagoFactura.retencionPagos.label" default="Retencion Pagos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pagoFacturaInstance?.retencionPagos?}" var="r">
    <li><g:link controller="retencionPago" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="retencionPago" action="create" params="['pagoFactura.id': pagoFacturaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'retencionPago.label', default: 'RetencionPago')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: pagoFacturaInstance, field: 'tipoPago', 'error')} required">
	<label for="tipoPago">
		<g:message code="pagoFactura.tipoPago.label" default="Tipo Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoPago" name="tipoPago.id" from="${maternidad.TipoPago.list()}" optionKey="id" required="" value="${pagoFacturaInstance?.tipoPago?.id}" class="many-to-one"/>

</div>

