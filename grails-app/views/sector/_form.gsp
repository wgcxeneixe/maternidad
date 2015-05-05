<%@ page import="maternidad.Sector" %>



<div class="fieldcontain ${hasErrors(bean: sectorInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="sector.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" required="" value="${sectorInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sectorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="sector.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${sectorInstance?.nombre}"/>

</div>

