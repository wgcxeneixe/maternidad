<%@ page import="maternidad.ValorPractica" %>



<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'valorGasto', 'error')} ">
	<label for="valorGasto">
		<g:message code="valorPractica.valorGasto.label" default="Valor Gasto" />
		
	</label>
	<g:field name="valorGasto" value="${fieldValue(bean: valorPracticaInstance, field: 'valorGasto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'valorHonorario', 'error')} ">
	<label for="valorHonorario">
		<g:message code="valorPractica.valorHonorario.label" default="Valor Honorario" />
		
	</label>
	<g:field name="valorHonorario" value="${fieldValue(bean: valorPracticaInstance, field: 'valorHonorario')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'valorAnestecista', 'error')} ">
	<label for="valorAnestecista">
		<g:message code="valorPractica.valorAnestecista.label" default="Valor Anestecista" />
		
	</label>
	<g:field name="valorAnestecista" value="${fieldValue(bean: valorPracticaInstance, field: 'valorAnestecista')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'valorAyudante', 'error')} ">
	<label for="valorAyudante">
		<g:message code="valorPractica.valorAyudante.label" default="Valor Ayudante" />
		
	</label>
	<g:field name="valorAyudante" value="${fieldValue(bean: valorPracticaInstance, field: 'valorAyudante')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'valorEspecialista', 'error')} ">
	<label for="valorEspecialista">
		<g:message code="valorPractica.valorEspecialista.label" default="Valor Especialista" />
		
	</label>
	<g:field name="valorEspecialista" value="${fieldValue(bean: valorPracticaInstance, field: 'valorEspecialista')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'practica', 'error')} required">
	<label for="practica">
		<g:message code="valorPractica.practica.label" default="Practica" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="practica" name="practica.id" from="${maternidad.Practica.list()}" optionKey="id" required="" value="${valorPracticaInstance?.practica?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'plan', 'error')} required">
	<label for="plan">
		<g:message code="valorPractica.plan.label" default="Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${valorPracticaInstance?.plan?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'planConvenio', 'error')} required">
	<label for="planConvenio">
		<g:message code="valorPractica.planConvenio.label" default="Plan Convenio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planConvenio" name="planConvenio.id" from="${maternidad.PlanConvenio.list()}" optionKey="id" required="" value="${valorPracticaInstance?.planConvenio?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'fechaActualizado', 'error')} required">
	<label for="fechaActualizado">
		<g:message code="valorPractica.fechaActualizado.label" default="Fecha Actualizado" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaActualizado" precision="day"  value="${valorPracticaInstance?.fechaActualizado}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'valorGastoModulo', 'error')} ">
	<label for="valorGastoModulo">
		<g:message code="valorPractica.valorGastoModulo.label" default="Valor Gasto Modulo" />
		
	</label>
	<g:field name="valorGastoModulo" value="${fieldValue(bean: valorPracticaInstance, field: 'valorGastoModulo')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: valorPracticaInstance, field: 'valorHonorarioModulo', 'error')} ">
	<label for="valorHonorarioModulo">
		<g:message code="valorPractica.valorHonorarioModulo.label" default="Valor Honorario Modulo" />
		
	</label>
	<g:field name="valorHonorarioModulo" value="${fieldValue(bean: valorPracticaInstance, field: 'valorHonorarioModulo')}"/>

</div>

