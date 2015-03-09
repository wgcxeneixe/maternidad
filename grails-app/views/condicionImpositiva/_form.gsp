<%@ page import="maternidad.CondicionImpositiva" %>



<div class="fieldcontain ${hasErrors(bean: condicionImpositivaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="condicionImpositiva.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="35" required="" value="${condicionImpositivaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: condicionImpositivaInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="condicionImpositiva.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="10" value="${condicionImpositivaInstance?.codigo}"/>

</div>

