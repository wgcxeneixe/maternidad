<%@ page import="maternidad.ConceptoPlan" %>



<div class="fieldcontain ${hasErrors(bean: conceptoPlanInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="conceptoPlan.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="10" required="" value="${conceptoPlanInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPlanInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="conceptoPlan.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="35" required="" value="${conceptoPlanInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPlanInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="conceptoPlan.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${conceptoPlanInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPlanInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="conceptoPlan.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${conceptoPlanInstance?.activo}" />

</div>

