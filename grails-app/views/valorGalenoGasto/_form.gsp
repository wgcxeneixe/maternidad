<%@ page import="maternidad.ValorGalenoGasto" %>



<div class="fieldcontain ${hasErrors(bean: valorGalenoGastoInstance, field: 'valor', 'error')} ">
	<label for="valor">
		<g:message code="valorGalenoGasto.valor.label" default="Valor" />
		
	</label>
	<g:field name="valor" value="${fieldValue(bean: valorGalenoGastoInstance, field: 'valor')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorGalenoGastoInstance, field: 'tipoGasto', 'error')} ">
	<label for="tipoGasto">
		<g:message code="valorGalenoGasto.tipoGasto.label" default="Tipo Gasto" />
		
	</label>
	<g:select id="tipoGasto" name="tipoGasto.id" from="${maternidad.TipoGasto.list()}" optionKey="id" value="${valorGalenoGastoInstance?.tipoGasto?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorGalenoGastoInstance, field: 'planConvenio', 'error')} required">
	<label for="planConvenio">
		<g:message code="valorGalenoGasto.planConvenio.label" default="Plan Convenio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planConvenio" name="planConvenio.id" from="${maternidad.PlanConvenio.list()}" optionKey="id" required="" value="${valorGalenoGastoInstance?.planConvenio?.id}" class="many-to-one"/>

</div>

