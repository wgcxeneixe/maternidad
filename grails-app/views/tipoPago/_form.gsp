<%@ page import="maternidad.TipoPago" %>



<div class="fieldcontain ${hasErrors(bean: tipoPagoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="tipoPago.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${tipoPagoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoPagoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoPago.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipoPagoInstance?.descripcion}"/>

</div>

