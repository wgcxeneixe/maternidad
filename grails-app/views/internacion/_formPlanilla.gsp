<%@ page import="maternidad.Internacion" %>

<g:hiddenField name="planilla" value="${planilla}"></g:hiddenField>

<div class="fieldcontain ${hasErrors(bean: internacionInstance, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="internacion.fecha.label" default="Fecha" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha" precision="minute"  value="${internacionInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: internacionInstance, field: 'sector', 'error')} ">
    <label for="sector">
        <g:message code="internacion.sector.label" default="Sector" />

    </label>
    <g:select id="sector" name="sector.id" from="${maternidad.Sector.list()}" optionKey="id" value="${internacionInstance?.sector?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: internacionInstance, field: 'tipoPension', 'error')} ">
    <label for="tipoPension">
        <g:message code="internacion.tipoPension.label" default="Tipo Pension" />

    </label>
    <g:textField name="tipoPension" value="${internacionInstance?.tipoPension}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: internacionInstance, field: 'diasInternacion', 'error')} ">
    <label for="diasInternacion">
        <g:message code="internacion.diasInternacion.label" default="Dias Internacion" />

    </label>
    <g:field name="diasInternacion" type="number" value="${internacionInstance?.diasInternacion}"/>

</div>