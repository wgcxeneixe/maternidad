<%@ page import="maternidad.ConceptoPorProfesional" %>



<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="conceptoPorProfesional.observacion.label" default="Observacion" />
		
	</label>
	<g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${conceptoPorProfesionalInstance?.observacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'montoFijo', 'error')} ">
	<label for="montoFijo">
		<g:message code="conceptoPorProfesional.montoFijo.label" default="Monto Fijo" />
		
	</label>
	<g:field name="montoFijo" value="${fieldValue(bean: conceptoPorProfesionalInstance, field: 'montoFijo')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'porcentaje', 'error')} ">
	<label for="porcentaje">
		<g:message code="conceptoPorProfesional.porcentaje.label" default="Porcentaje" />
		
	</label>
	<g:field name="porcentaje" value="${fieldValue(bean: conceptoPorProfesionalInstance, field: 'porcentaje')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="conceptoPorProfesional.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${maternidad.Usuario.list()}" optionKey="id" value="${conceptoPorProfesionalInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="conceptoPorProfesional.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${conceptoPorProfesionalInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'conceptoLiquidacion', 'error')} required">
	<label for="conceptoLiquidacion">
		<g:message code="conceptoPorProfesional.conceptoLiquidacion.label" default="Concepto Liquidacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conceptoLiquidacion" name="conceptoLiquidacion.id" from="${maternidad.ConceptoLiquidacion.list()}" optionKey="id" required="" value="${conceptoPorProfesionalInstance?.conceptoLiquidacion?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="conceptoPorProfesional.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${conceptoPorProfesionalInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'porUnicaVez', 'error')} ">
	<label for="porUnicaVez">
		<g:message code="conceptoPorProfesional.porUnicaVez.label" default="Por Unica Vez" />
		
	</label>
	<g:checkBox name="porUnicaVez" value="${conceptoPorProfesionalInstance?.porUnicaVez}" />

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoPorProfesionalInstance, field: 'profesional', 'error')} required">
	<label for="profesional">
		<g:message code="conceptoPorProfesional.profesional.label" default="Profesional" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" required="" value="${conceptoPorProfesionalInstance?.profesional?.id}" class="many-to-one"/>

</div>

