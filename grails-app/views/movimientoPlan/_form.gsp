<%@ page import="maternidad.MovimientoPlan" %>


<div class="fieldcontain ${hasErrors(bean: movimientoPlanInstance, field: 'plan', 'error')} required">
    <label for="plan">
        <g:message code="movimientoPlan.plan.label" default="Plan" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${movimientoPlanInstance?.plan?.id}" class="many-to-one"/>
<g:hiddenField name="planConvenio.id" value="${planConvenio?.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoPlanInstance, field: 'conceptoPlan', 'error')} required">
    <label for="conceptoPlan">
        <g:message code="movimientoPlan.conceptoPlan.label" default="Concepto Plan" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="conceptoPlan" name="conceptoPlan.id" from="${maternidad.ConceptoPlan.list()}" optionKey="id" required="" value="${movimientoPlanInstance?.conceptoPlan?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoPlanInstance, field: 'monto', 'error')} ">
	<label for="monto">
		<g:message code="movimientoPlan.monto.label" default="Monto" />
		
	</label>
	<g:field  name="monto" value="${fieldValue(bean: movimientoPlanInstance, field: 'monto')}"/>

</div>


<div id="divradio" class="fieldcontain ${hasErrors(bean: movimientoStockInstance, field: 'ingreso', 'error')} ">
    <label for="ingreso">
        <g:message code="movimientoPlan.credito.label" default="Credito" />
    </label>
    <g:radio name="credito" value="true" checked="true" />
    <label for="ingreso">
        <g:message code="movimientoPlan.credito.label" default="Debito" />
    </label><g:radio name="credito" value="false" />
</div>

<div class="fieldcontain ${hasErrors(bean: movimientoPlanInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="movimientoPlan.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${movimientoPlanInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoPlanInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="movimientoPlan.observacion.label" default="Observacion" />
		
	</label>
	<g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${movimientoPlanInstance?.observacion}"/>

</div>



