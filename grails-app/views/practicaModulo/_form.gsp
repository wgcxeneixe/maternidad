<%@ page import="maternidad.PracticaModulo" %>



<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'valorGasto', 'error')} ">
	<label for="valorGasto">
		<g:message code="practicaModulo.valorGasto.label" default="Valor Gasto" />
		
	</label>
	<g:field name="valorGasto" value="${fieldValue(bean: practicaModuloInstance, field: 'valorGasto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'valorAnestecista', 'error')} ">
	<label for="valorAnestecista">
		<g:message code="practicaModulo.valorAnestecista.label" default="Valor Anestecista" />
		
	</label>
	<g:field name="valorAnestecista" value="${fieldValue(bean: practicaModuloInstance, field: 'valorAnestecista')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'valorAyudante', 'error')} ">
	<label for="valorAyudante">
		<g:message code="practicaModulo.valorAyudante.label" default="Valor Ayudante" />
		
	</label>
	<g:field name="valorAyudante" value="${fieldValue(bean: practicaModuloInstance, field: 'valorAyudante')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'valorEspecialista', 'error')} ">
	<label for="valorEspecialista">
		<g:message code="practicaModulo.valorEspecialista.label" default="Valor Especialista" />
		
	</label>
	<g:field name="valorEspecialista" value="${fieldValue(bean: practicaModuloInstance, field: 'valorEspecialista')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'practica', 'error')} required">
	<label for="practica">
		<g:message code="practicaModulo.practica.label" default="Practica" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="practica" name="practica.id" from="${maternidad.Practica.list()}" optionKey="id" required="" value="${practicaModuloInstance?.practica?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'modulo', 'error')} required">
	<label for="modulo">
		<g:message code="practicaModulo.modulo.label" default="Modulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modulo" name="modulo.id" from="${maternidad.Practica.list()}" optionKey="id" required="" value="${practicaModuloInstance?.modulo?.id}" class="many-to-one"/>

</div>

