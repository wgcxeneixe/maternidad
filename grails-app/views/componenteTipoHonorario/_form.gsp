<%@ page import="maternidad.ComponenteTipoHonorario" %>



<div class="fieldcontain ${hasErrors(bean: componenteTipoHonorarioInstance, field: 'componente', 'error')} required">
	<label for="componente">
		<g:message code="componenteTipoHonorario.componente.label" default="Componente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="componente" name="componente.id" from="${maternidad.Componente.list()}" optionKey="id" required="" value="${componenteTipoHonorarioInstance?.componente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: componenteTipoHonorarioInstance, field: 'tipoHonorario', 'error')} required">
	<label for="tipoHonorario">
		<g:message code="componenteTipoHonorario.tipoHonorario.label" default="Tipo Honorario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoHonorario" name="tipoHonorario.id" from="${maternidad.TipoHonorario.list()}" optionKey="id" required="" value="${componenteTipoHonorarioInstance?.tipoHonorario?.id}" class="many-to-one"/>

</div>

