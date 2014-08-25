<%@ page import="maternidad.ValorGalenoHonorario" %>



<div class="fieldcontain ${hasErrors(bean: valorGalenoHonorarioInstance, field: 'valor', 'error')} ">
	<label for="valor">
		<g:message code="valorGalenoHonorario.valor.label" default="Valor" />
		
	</label>
	<g:field name="valor" value="${fieldValue(bean: valorGalenoHonorarioInstance, field: 'valor')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorGalenoHonorarioInstance, field: 'tipoHonorario', 'error')} ">
	<label for="tipoHonorario">
		<g:message code="valorGalenoHonorario.tipoHonorario.label" default="Tipo Honorario" />
		
	</label>
	<g:select id="tipoHonorario" name="tipoHonorario.id" from="${maternidad.TipoHonorario.list()}" optionKey="id" value="${valorGalenoHonorarioInstance?.tipoHonorario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorGalenoHonorarioInstance, field: 'planConvenio', 'error')} required">
	<label for="planConvenio">
		<g:message code="valorGalenoHonorario.planConvenio.label" default="Plan Convenio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planConvenio" name="planConvenio.id" from="${maternidad.PlanConvenio.list()}" optionKey="id" required="" value="${valorGalenoHonorarioInstance?.planConvenio?.id}" class="many-to-one"/>

</div>

