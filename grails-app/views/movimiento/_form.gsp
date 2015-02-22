<%@ page import="contabilidad.Movimiento" %>



<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="movimiento.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: movimientoInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'asiento', 'error')} required">
	<label for="asiento">
		<g:message code="movimiento.asiento.label" default="Asiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asiento" name="asiento.id" from="${contabilidad.Asiento.list()}" optionKey="id" required="" value="${movimientoInstance?.asiento?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'columnaDebe', 'error')} ">
	<label for="columnaDebe">
		<g:message code="movimiento.columnaDebe.label" default="Columna Debe" />
		
	</label>
	<g:checkBox name="columnaDebe" value="${movimientoInstance?.columnaDebe}" />

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'cuenta', 'error')} required">
	<label for="cuenta">
		<g:message code="movimiento.cuenta.label" default="Cuenta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cuenta" name="cuenta.id" from="${contabilidad.Cuenta.list()}" optionKey="id" required="" value="${movimientoInstance?.cuenta?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="movimiento.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${movimientoInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="movimiento.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${movimientoInstance?.descripcion}"/>

</div>

