<%@ page import="maternidad.TipoHonorario" %>



<div class="fieldcontain ${hasErrors(bean: tipoHonorarioInstance, field: 'sigla', 'error')} required">
	<label for="sigla">
		<g:message code="tipoHonorario.sigla.label" default="Sigla" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sigla" required="" value="${tipoHonorarioInstance?.sigla}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoHonorarioInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoHonorario.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipoHonorarioInstance?.descripcion}"/>

</div>

