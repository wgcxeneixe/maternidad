<%@ page import="maternidad.Practica" %>



<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="practica.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="120" required="" value="${practicaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="practica.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="10" required="" value="${practicaInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="practica.observacion.label" default="Observacion" />
		
	</label>
	<g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${practicaInstance?.observacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'nomenclada', 'error')} ">
	<label for="nomenclada">
		<g:message code="practica.nomenclada.label" default="Nomenclada" />
		
	</label>
	<g:checkBox name="nomenclada" value="${practicaInstance?.nomenclada}" />

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'modulo', 'error')} ">
	<label for="modulo">
		<g:message code="practica.modulo.label" default="Modulo" />
		
	</label>
	<g:checkBox name="modulo" value="${practicaInstance?.modulo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'multiplicadorHonorario', 'error')} ">
	<label for="multiplicadorHonorario">
		<g:message code="practica.multiplicadorHonorario.label" default="Multiplicador Honorario" />
		
	</label>
	<g:field name="multiplicadorHonorario" value="${fieldValue(bean: practicaInstance, field: 'multiplicadorHonorario')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'multiplicadorGasto', 'error')} ">
	<label for="multiplicadorGasto">
		<g:message code="practica.multiplicadorGasto.label" default="Multiplicador Gasto" />
		
	</label>
	<g:field name="multiplicadorGasto" value="${fieldValue(bean: practicaInstance, field: 'multiplicadorGasto')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'obrasocial', 'error')} ">
	<label for="obrasocial">
		<g:message code="practica.obrasocial.label" default="Obrasocial" />
		
	</label>
	<g:select id="obrasocial" name="obrasocial.id" from="${maternidad.ObraSocial.list()}" optionKey="id" value="${practicaInstance?.obrasocial?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

