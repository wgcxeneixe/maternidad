<%@ page import="maternidad.PracticaModulo" %>


<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'modulo', 'error')} required">
    <label for="modulo">
        <g:message code="practicaModulo.modulo.label" default="Modulo" />
        <span class="required-indicator">*</span>
    </label>

    <g:textField name="nombreM" readonly="true" value="${practicaModuloInstance?.modulo?.toString()}" />

    <g:hiddenField name="modulo.id" value="${practicaModuloInstance?.modulo?.id}"/>

<g:hiddenField name="planConvenio.id" value="${planConvenio?.id}"/>


    <g:hiddenField name="valorPractica.id" value="${valorPractica?.id}"/>


</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'practica', 'error')} required">
    <label for="practica">
        <g:message code="practicaModulo.practica.label" default="Practica" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="practica" name="practica.id" from="${maternidad.Practica.findAllByNomenclada(Boolean.TRUE)}" optionKey="id" required="" value="${practicaModuloInstance?.practica?.id}" class="many-to-one"/>

</div>



<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'valorGasto', 'error')} ">
	<label for="valorGasto">
		<g:message code="practicaModulo.valorGasto.label" default="Valor Gasto" />
		
	</label>
    <g:field type="number" step="any" name="valorGasto" value="${practicaModuloInstance?.valorGasto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'valorAnestecista', 'error')} ">
	<label for="valorAnestecista">
		<g:message code="practicaModulo.valorAnestecista.label" default="Valor Anestecista" />
		
	</label>
    <g:field type="number" step="any" name="valorAnestecista" value="${practicaModuloInstance?.valorAnestecista}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'valorAyudante', 'error')} ">
	<label for="valorAyudante">
		<g:message code="practicaModulo.valorAyudante.label" default="Valor Ayudante" />
		
	</label>
    <g:field type="number" step="any" name="valorAyudante" value="${practicaModuloInstance?.valorAyudante}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaModuloInstance, field: 'valorEspecialista', 'error')} ">
	<label for="valorEspecialista">
		<g:message code="practicaModulo.valorEspecialista.label" default="Valor Especialista" />
		
	</label>
    <g:field type="number" step="any" name="valorEspecialista" value="${practicaModuloInstance?.valorEspecialista}"/>

</div>

