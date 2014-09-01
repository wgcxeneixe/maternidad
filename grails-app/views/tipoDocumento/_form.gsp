<%@ page import="maternidad.TipoDocumento" %>



<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'entidadEmisora', 'error')} ">
	<label for="entidadEmisora">
		<g:message code="tipoDocumento.entidadEmisora.label" default="Entidad Emisora" />
		
	</label>
	<g:textField name="entidadEmisora" value="${tipoDocumentoInstance?.entidadEmisora}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'aclaracion', 'error')} ">
	<label for="aclaracion">
		<g:message code="tipoDocumento.aclaracion.label" default="Aclaracion" />
		
	</label>
	<g:textField name="aclaracion" value="${tipoDocumentoInstance?.aclaracion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'pais', 'error')} ">
	<label for="pais">
		<g:message code="tipoDocumento.pais.label" default="Pais" />
		
	</label>
	<g:select id="pais" name="pais.id" from="${maternidad.Pais.list()}" optionKey="id" value="${tipoDocumentoInstance?.pais?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'prioridad', 'error')} ">
	<label for="prioridad">
		<g:message code="tipoDocumento.prioridad.label" default="Prioridad" />
		
	</label>
	<g:field name="prioridad" type="number" value="${tipoDocumentoInstance.prioridad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="tipoDocumento.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="10" value="${tipoDocumentoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoDocumento.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="120" value="${tipoDocumentoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="tipoDocumento.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${tipoDocumentoInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="tipoDocumento.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${tipoDocumentoInstance?.nombre}"/>

</div>

