<%@ page import="maternidad.Componente" %>



<div class="fieldcontain ${hasErrors(bean: componenteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="componente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="35" pattern="${componenteInstance.constraints.nombre.matches}" required="" value="${componenteInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: componenteInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="componente.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${componenteInstance?.activo}" />

</div>

