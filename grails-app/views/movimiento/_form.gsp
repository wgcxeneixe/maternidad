<%@ page import="contabilidad.Movimiento" %>



<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'debe', 'error')} required">
	<label for="debe">
		<g:message code="movimiento.debe.label" default="Debe" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="debe" value="${fieldValue(bean: movimientoInstance, field: 'debe')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'haber', 'error')} required">
	<label for="haber">
		<g:message code="movimiento.haber.label" default="Haber" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="haber" value="${fieldValue(bean: movimientoInstance, field: 'haber')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoInstance, field: 'asiento', 'error')} required">
	<label for="asiento">
		<g:message code="movimiento.asiento.label" default="Asiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asiento" name="asiento.id" from="${contabilidad.Asiento.list()}" optionKey="id" required="" value="${movimientoInstance?.asiento?.id}" class="many-to-one"/>

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

