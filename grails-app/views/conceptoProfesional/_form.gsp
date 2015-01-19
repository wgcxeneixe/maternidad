<%@ page import="maternidad.ConceptoProfesional" %>



<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="conceptoProfesional.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="120" required="" value="${conceptoProfesionalInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="conceptoProfesional.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="10" value="${conceptoProfesionalInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'esMensual', 'error')} ">
	<label for="esMensual">
		<g:message code="conceptoProfesional.esMensual.label" default="Es Mensual" />
		
	</label>
	<g:checkBox name="esMensual" value="${conceptoProfesionalInstance?.esMensual}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'credito', 'error')} ">
	<label for="credito">
		<g:message code="conceptoProfesional.credito.label" default="Credito" />
		
	</label>
	<g:checkBox name="credito" value="${conceptoProfesionalInstance?.credito}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'montoFijo', 'error')} ">
	<label for="montoFijo">
		<g:message code="conceptoProfesional.montoFijo.label" default="Monto Fijo" />
		
	</label>
	<g:field name="montoFijo" value="${fieldValue(bean: conceptoProfesionalInstance, field: 'montoFijo')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'porcentaje', 'error')} ">
	<label for="porcentaje">
		<g:message code="conceptoProfesional.porcentaje.label" default="Porcentaje" />
		
	</label>
	<g:field name="porcentaje" value="${fieldValue(bean: conceptoProfesionalInstance, field: 'porcentaje')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'aplicaSobreBruto', 'error')} ">
	<label for="aplicaSobreBruto">
		<g:message code="conceptoProfesional.aplicaSobreBruto.label" default="Aplica Sobre Bruto" />
		
	</label>
	<g:checkBox name="aplicaSobreBruto" value="${conceptoProfesionalInstance?.aplicaSobreBruto}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="conceptoProfesional.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${conceptoProfesionalInstance?.activo}" />

</div>


<div class="fieldcontain ${hasErrors(bean: conceptoProfesionalInstance, field: 'observacion', 'error')} ">
    <label for="observacion">
        <g:message code="conceptoProfesional.observacion.label" default="Observacion" />

    </label>
    <g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${conceptoProfesionalInstance?.observacion}"/>

</div>
