<%@ page import="maternidad.Banco" %>



<div class="fieldcontain ${hasErrors(bean: bancoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="banco.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${bancoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bancoInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="banco.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${bancoInstance?.activo}" />

</div>

