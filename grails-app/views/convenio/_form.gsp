<%@ page import="maternidad.Convenio" %>




<div class="fieldcontain ${hasErrors(bean: convenioInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="convenio.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="10" value="${convenioInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: convenioInstance, field: 'obrasocial', 'error')} required">
	<label for="obrasocial">
		<g:message code="convenio.obrasocial.label" default="Obrasocial" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="obrasocial" name="obrasocial.id" from="${maternidad.ObraSocial.list()}" optionKey="id" required="" value="${convenioInstance?.obrasocial?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: convenioInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="convenio.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${convenioInstance?.fechaInicio}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: convenioInstance, field: 'fechaFin', 'error')} required">
	<label for="fechaFin">
		<g:message code="convenio.fechaFin.label" default="Fecha Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaFin" precision="day"  value="${convenioInstance?.fechaFin}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: convenioInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="convenio.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${convenioInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: convenioInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="convenio.observacion.label" default="Observacion" />
		
	</label>
	<g:textField name="observacion" value="${convenioInstance?.observacion}"/>

</div>

