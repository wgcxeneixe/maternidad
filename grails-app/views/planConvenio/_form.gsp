<%@ page import="maternidad.PlanConvenio" %>



<div class="fieldcontain ${hasErrors(bean: planConvenioInstance, field: 'plan', 'error')} required">
	<label for="plan">
		<g:message code="planConvenio.plan.label" default="Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${planConvenioInstance?.plan?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planConvenioInstance, field: 'convenio', 'error')} required">
	<label for="convenio">
		<g:message code="planConvenio.convenio.label" default="Convenio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="convenio" name="convenio.id" from="${maternidad.Convenio.list()}" optionKey="id" required="" value="${planConvenioInstance?.convenio?.id}" class="many-to-one"/>

</div>

