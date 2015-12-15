<%@ page import="maternidad.RetencionPago" %>



<div class="fieldcontain ${hasErrors(bean: retencionPagoInstance, field: 'monto', 'error')} ">
	<label for="monto">
		<g:message code="retencionPago.monto.label" default="Monto" />
		
	</label>
	<g:field name="monto" value="${fieldValue(bean: retencionPagoInstance, field: 'monto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: retencionPagoInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="retencionPago.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" value="${retencionPagoInstance?.observaciones}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: retencionPagoInstance, field: 'pagoFactura', 'error')} ">
	<label for="pagoFactura">
		<g:message code="retencionPago.pagoFactura.label" default="Pago Factura" />
		
	</label>
	<g:select id="pagoFactura" name="pagoFactura.id" from="${retencionPagoInstance?.pagoFactura}" optionKey="id" value="${retencionPagoInstance?.pagoFactura?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: retencionPagoInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="retencionPago.tipo.label" default="Tipo" />
		
	</label>
	<g:select id="tipo" name="tipo.id" from="${maternidad.TipoRetencionPago.list()}" optionKey="id" value="${retencionPagoInstance?.tipo?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

