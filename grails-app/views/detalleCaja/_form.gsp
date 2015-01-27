<%@ page import="maternidad.DetalleCaja" %>

<div class="fieldcontain ${hasErrors(bean: detalleCajaInstance, field: 'caja', 'error')} required">
    <label for="caja" >
		<g:message code="detalleCaja.caja.label" default="Caja" />
	</label>
    <g:fieldValue bean="${detalleCajaInstance}" field="caja"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleCajaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="detalleCaja.fecha.label" default="Fecha" />

	</label>
    <g:formatDate type="datetime"  style="LONG" timeStyle="SHORT"  precision="minute"  date="${detalleCajaInstance?.fecha}"  />

</div>
<div class="fieldcontain ${hasErrors(bean: detalleCajaInstance, field: 'usuario', 'error')} required">
    <label for="usuario">
        <g:message code="detalleCaja.usuario.label" default="Usuario" />
    </label>
    <g:fieldValue bean="${detalleCajaInstance}" field="usuario"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleCajaInstance, field: 'planillainternacion', 'error')} ">
	<label for="planillainternacion">
		<g:message code="detalleCaja.planillainternacion.label" default="Planillainternacion" />
		
	</label>
	<g:select id="planillainternacion" name="planillainternacion.id" from="${maternidad.PlanillaInternacion.list()}" optionKey="id" value="${detalleCajaInstance?.planillainternacion?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleCajaInstance, field: 'conceptocaja', 'error')} ">
	<label for="conceptocaja">
		<g:message code="detalleCaja.conceptocaja.label" default="Conceptocaja" />
		
	</label>
	<g:select id="conceptocaja" name="conceptocaja.id" from="${maternidad.ConceptoCaja.list()}" optionKey="id" value="${detalleCajaInstance?.conceptocaja?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleCajaInstance, field: 'credito', 'error')} ">

<!--	<g:checkBox name="credito" value="${detalleCajaInstance?.credito}" />
-->

    <label for="ingreso">
        <g:message code="detalleCaja.tipo.label" default="Credito" />
    </label>
    <g:radio name="credito" value="true" checked="true" />
    <label for="ingreso">
        <g:message code="detalleCaja.tipo.credito.label" default="Debito" />
    </label><g:radio name="credito" value="false" />




</div>

<div class="fieldcontain ${hasErrors(bean: detalleCajaInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="detalleCaja.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" step="any" name="monto" value="${fieldValue(bean: detalleCajaInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleCajaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="detalleCaja.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${detalleCajaInstance?.observaciones}"/>

</div>

