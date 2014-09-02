<%@ page import="maternidad.Profesional" %>


<!--
<div class="fieldcontain ${hasErrors(bean: profesionalInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="profesional.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${maternidad.Persona.list()}" optionKey="id" required="" value="${profesionalInstance?.persona?.id}" class="many-to-one"/>

</div>
-->
<div class="fieldcontain ${hasErrors(bean: profesionalInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="profesional.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${profesionalInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: profesionalInstance, field: 'matriculaProvincial', 'error')} ">
	<label for="matriculaProvincial">
		<g:message code="profesional.matriculaProvincial.label" default="Matricula Provincial" />
		
	</label>
	<g:textField name="matriculaProvincial" value="${profesionalInstance?.matriculaProvincial}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesionalInstance, field: 'fechaMatriculacion', 'error')} ">
	<label for="fechaMatriculacion">
		<g:message code="profesional.fechaMatriculacion.label" default="Fecha Matriculacion" />
		
	</label>
	<g:datePicker name="fechaMatriculacion" precision="day"  value="${profesionalInstance?.fechaMatriculacion}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: profesionalInstance, field: 'cbu', 'error')} ">
	<label for="cbu">
		<g:message code="profesional.cbu.label" default="Cbu" />
		
	</label>
	<g:textField name="cbu" value="${profesionalInstance?.cbu}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesionalInstance, field: 'banco', 'error')} ">
	<label for="banco">
		<g:message code="profesional.banco.label" default="Banco" />
		
	</label>
	<g:select id="banco" name="banco.id" from="${maternidad.Banco.list()}" optionKey="id" value="${profesionalInstance?.banco?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>


<!--
<div class="fieldcontain ${hasErrors(bean: profesionalInstance, field: 'listaConceptos', 'error')} ">
	<label for="listaConceptos">
		<g:message code="profesional.listaConceptos.label" default="Lista Conceptos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${profesionalInstance?.listaConceptos?}" var="l">
    <li><g:link controller="conceptoPorProfesional" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conceptoPorProfesional" action="create" params="['profesional.id': profesionalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conceptoPorProfesional.label', default: 'ConceptoPorProfesional')])}</g:link>
</li>
</ul>


</div>
-->
