<%@ page import="maternidad.TipoPago" %>



<div class="fieldcontain ${hasErrors(bean: tipoPagoInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="tipoPago.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" required="" value="${tipoPagoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoPagoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipoPago.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${tipoPagoInstance?.descripcion}"/>

</div>

