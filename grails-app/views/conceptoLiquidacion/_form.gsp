<%@ page import="maternidad.ConceptoProfesional" %>

<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'credito', 'error')} ">
    <label for="credito">
        <g:message code="conceptoLiquidacion.credito.label" default="Crédito" />
    </label>
    <g:radio name="credito" value="true" checked="true" />

    <label for="credito">
        <g:message code="conceptoLiquidacion.credito.label" default="Débito" />
    </label>
    <g:radio name="credito" value="false"  />

</div>



<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'nombre', 'error')} required">
    <label for="nombre">
        <g:message code="conceptoLiquidacion.nombre.label" default="Nombre" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombre" maxlength="120" required="" value="${conceptoLiquidacionInstance?.nombre}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'codigo', 'error')} ">
    <label for="codigo">
        <g:message code="conceptoLiquidacion.codigo.label" default="Codigo" />

    </label>
    <g:textField name="codigo" maxlength="10" value="${conceptoLiquidacionInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="conceptoLiquidacion.observacion.label" default="Observacion" />
		
	</label>
	<g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${conceptoLiquidacionInstance?.observacion}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'esMensual', 'error')} ">
	<label for="esMensual">
		<g:message code="conceptoLiquidacion.esMensual.label" default="Es Mensual" />
	</label>
    <g:checkBox name="esMensual" value="${conceptoLiquidacionInstance?.esMensual}" />
</div>



<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'montoFijo', 'error')} ">
	<label for="montoFijo">
		<g:message code="conceptoLiquidacion.montoFijo.label" default="Monto Fijo" />
		
	</label>
	<g:field name="montoFijo" value="${fieldValue(bean: conceptoLiquidacionInstance, field: 'montoFijo')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'porcentaje', 'error')} ">
	<label for="porcentaje">
		<g:message code="conceptoLiquidacion.porcentaje.label" default="Porcentaje" />
		
	</label>
	<g:field name="porcentaje" value="${fieldValue(bean: conceptoLiquidacionInstance, field: 'porcentaje')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'aplicaSobreBruto', 'error')} ">
	<label for="aplicaSobreBruto">
		<g:message code="conceptoLiquidacion.aplicaSobreBruto.label" default="Aplica Sobre Bruto" />
	</label>
    <g:radio name="aplicaSobreBruto" value="true" checked="true" />
    <label for="aplicaSobreBruto">
        <g:message code="conceptoLiquidacion.aplicaSobreBruto.label" default="Aplica Sobre Neto" />
    </label>
    <g:radio name="aplicaSobreBruto" value="false"  />
</div>

<div class="fieldcontain ${hasErrors(bean: conceptoLiquidacionInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="conceptoLiquidacion.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${conceptoLiquidacionInstance?.activo}" />

</div>

