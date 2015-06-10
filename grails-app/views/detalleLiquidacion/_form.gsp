<%@ page import="maternidad.DetalleLiquidacion" %>



%{--<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'conceptoPorProfesional', 'error')} ">--}%
	%{--<label for="conceptoPorProfesional">--}%
		%{--<g:message code="detalleLiquidacion.conceptoPorProfesional.label" default="Concepto Por Profesional" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select id="conceptoPorProfesional" name="conceptoPorProfesional.id" from="${maternidad.ConceptoPorProfesional.list()}" optionKey="id" value="${detalleLiquidacionInstance?.conceptoPorProfesional?.id}" class="many-to-one" noSelection="['null': '']"/>--}%

%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'conceptoProfesional', 'error')} ">
	<label for="conceptoProfesional">
		<g:message code="detalleLiquidacion.conceptoProfesional.label" default="Concepto Profesional" />
		
	</label>
	<g:select id="conceptoProfesional" name="conceptoProfesional.id" from="${maternidad.ConceptoProfesional.list()}"  optionKey="id" value="${detalleLiquidacionInstance?.conceptoProfesional?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'debito', 'error')} ">
	<label for="debito">
		<g:message code="detalleLiquidacion.debito.label" default="Debito" />
		
	</label>
	<g:checkBox name="debito" value="${detalleLiquidacionInstance?.debito}" />

</div>

<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'detalle', 'error')} ">
	<label for="detalle">
		<g:message code="detalleLiquidacion.detalle.label" default="Detalle" />
		
	</label>
	<g:textField name="detalle" value="${detalleLiquidacionInstance?.detalle}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'detalleFactura', 'error')} ">
	<label for="detalleFactura">
		<g:message code="detalleLiquidacion.detalleFactura.label" default="Detalle Factura" />
		
	</label>
	<g:select id="detalleFactura" name="detalleFactura.id" from="${maternidad.DetalleFactura.list()}" optionKey="id" value="${detalleLiquidacionInstance?.detalleFactura?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'liquidacion', 'error')} ">--}%
	%{--<label for="liquidacion">--}%
		%{--<g:message code="detalleLiquidacion.liquidacion.label" default="Liquidacion" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select id="liquidacion" name="liquidacion.id" from="${maternidad.Liquidacion.list()}" optionKey="id" value="${detalleLiquidacionInstance?.liquidacion?.id}" class="many-to-one" noSelection="['null': '']"/>--}%

%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'monto', 'error')} ">
	<label for="monto">
		<g:message code="detalleLiquidacion.monto.label" default="Monto" />
		
	</label>
	<g:field name="monto" value="${fieldValue(bean: detalleLiquidacionInstance, field: 'monto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'pagoFactura', 'error')} ">
	<label for="pagoFactura">
		<g:message code="detalleLiquidacion.pagoFactura.label" default="Pago Factura" />
		
	</label>
	<g:select id="pagoFactura" name="pagoFactura.id" from="${maternidad.PagoFactura.findAllById(detalleLiquidacionInstance?.pagoFactura?.id)}" optionKey="id" value="${detalleLiquidacionInstance?.pagoFactura?.id}" class="many-to-one" />

</div>

%{--<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'porcentajePagoFacturaLiquidado', 'error')} ">--}%
	%{--<label for="porcentajePagoFacturaLiquidado">--}%
		%{--<g:message code="detalleLiquidacion.porcentajePagoFacturaLiquidado.label" default="Porcentaje Pago Factura Liquidado" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:field name="porcentajePagoFacturaLiquidado" value="${fieldValue(bean: detalleLiquidacionInstance, field: 'porcentajePagoFacturaLiquidado')}"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleLiquidacionInstance, field: 'retencionPago', 'error')} ">--}%
	%{--<label for="retencionPago">--}%
		%{--<g:message code="detalleLiquidacion.retencionPago.label" default="Retencion Pago" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select id="retencionPago" name="retencionPago.id" from="${maternidad.RetencionPago.list()}" optionKey="id" value="${detalleLiquidacionInstance?.retencionPago?.id}" class="many-to-one" noSelection="['null': '']"/>--}%

%{--</div>--}%

