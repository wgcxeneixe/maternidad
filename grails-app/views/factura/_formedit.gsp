<%@ page import="maternidad.Factura" %>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'anulada', 'error')} ">
    <label for="anulada">
        <g:message code="factura.anulada.label" default="Anulada" />

    </label>
    <g:checkBox name="anulada" value="${facturaInstance?.anulada}" />

</div>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="factura.fecha.label" default="Fecha" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker disabled="true" name="fecha" precision="day"   value="${facturaInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'nrofactura', 'error')} required">
    <label for="nrofactura">
        <g:message code="factura.nrofactura.label" default="Nrofactura" />
        <span class="required-indicator">*</span>
    </label>
    <g:field disabled="true" name="nrofactura" type="number" value="${facturaInstance.nrofactura}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'pagoCompleto', 'error')} ">
    <label for="pagoCompleto">
        <g:message code="factura.pagoCompleto.label" default="Pago Completo" />

    </label>
    <g:checkBox disabled="true" name="pagoCompleto" value="${facturaInstance?.pagoCompleto}" />

</div>


<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'periodo', 'error')} required">
    <label for="periodo">
        <g:message code="factura.periodo.label" default="Periodo" />
        <span class="required-indicator">*</span>
    </label>
    <g:field disabled="true" name="periodo" type="number" value="${facturaInstance.periodo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'plan', 'error')} required">
    <label for="plan">
        <g:message code="factura.plan.label" default="Plan" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="plan"  disabled="true" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${facturaInstance?.plan?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'totalFacturado', 'error')} required">
    <label for="totalFacturado">
        <g:message code="factura.totalFacturado.label" default="Total Facturado" />
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" step="any" name="totalFacturado" disabled="true" value="${facturaInstance?.totalFacturado}" />

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'totalPagado', 'error')} required">
    <label for="totalPagado">
        <g:message code="factura.totalPagado.label" default="Total Pagado" />
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" step="any" disabled="true" name="totalPagado" value="${facturaInstance?.totalPagado}" />

</div>