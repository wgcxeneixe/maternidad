<%@ page import="maternidad.Localidad" %>



<div class="fieldcontain ${hasErrors(bean: localidadInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="localidad.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="40" required="" value="${localidadInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: localidadInstance, field: 'abreviatura', 'error')} ">
	<label for="abreviatura">
		<g:message code="localidad.abreviatura.label" default="Abreviatura" />
		
	</label>
	<g:textField name="abreviatura" maxlength="10" value="${localidadInstance?.abreviatura}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: localidadInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="localidad.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" value="${localidadInstance?.codigoPostal}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: localidadInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="localidad.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${localidadInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: localidadInstance, field: 'provincia', 'error')} ">
	<label for="provincia">
		<g:message code="localidad.provincia.label" default="Provincia" />
		
	</label>
	<g:select id="provincia" name="provincia.id" from="${maternidad.Provincia.list()}" optionKey="id" value="${localidadInstance?.provincia?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

