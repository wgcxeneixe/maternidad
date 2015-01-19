<%@ page import="maternidad.TipoGasto" %>



<div class="fieldcontain ${hasErrors(bean: tipoGastoInstance, field: 'sigla', 'error')} required">
	<label for="sigla">
		<g:message code="tipoGasto.sigla.label" default="Sigla" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sigla" required="" value="${tipoGastoInstance?.sigla}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoGastoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoGasto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipoGastoInstance?.descripcion}"/>

</div>

