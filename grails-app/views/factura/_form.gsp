<%@ page import="maternidad.Factura" %>



<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'anulada', 'error')} ">
	<label for="anulada">
		<g:message code="factura.anulada.label" default="Anulada" />
		
	</label>
	<g:checkBox name="anulada" value="${facturaInstance?.anulada}" />

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'detallesFactura', 'error')} ">
	<label for="detallesFactura">
		<g:message code="factura.detallesFactura.label" default="Detalles Factura" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${facturaInstance?.detallesFactura?}" var="d">
    <li><g:link controller="detalleFactura" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleFactura" action="create" params="['factura.id': facturaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFactura.label', default: 'DetalleFactura')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="factura.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${facturaInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'nrofactura', 'error')} required">
	<label for="nrofactura">
		<g:message code="factura.nrofactura.label" default="Nrofactura" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nrofactura" type="number" value="${facturaInstance.nrofactura}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'pagoCompleto', 'error')} ">
	<label for="pagoCompleto">
		<g:message code="factura.pagoCompleto.label" default="Pago Completo" />
		
	</label>
	<g:checkBox name="pagoCompleto" value="${facturaInstance?.pagoCompleto}" />

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'pagosFactura', 'error')} ">
	<label for="pagosFactura">
		<g:message code="factura.pagosFactura.label" default="Pagos Factura" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${facturaInstance?.pagosFactura?}" var="p">
    <li><g:link controller="pagoFactura" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pagoFactura" action="create" params="['factura.id': facturaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagoFactura.label', default: 'PagoFactura')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'periodo', 'error')} required">
	<label for="periodo">
		<g:message code="factura.periodo.label" default="Periodo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="periodo" type="number" value="${facturaInstance.periodo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'plan', 'error')} required">
	<label for="plan">
		<g:message code="factura.plan.label" default="Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${facturaInstance?.plan?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'totalFacturado', 'error')} required">
	<label for="totalFacturado">
		<g:message code="factura.totalFacturado.label" default="Total Facturado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalFacturado" value="${fieldValue(bean: facturaInstance, field: 'totalFacturado')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'totalPagado', 'error')} required">
	<label for="totalPagado">
		<g:message code="factura.totalPagado.label" default="Total Pagado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalPagado" value="${fieldValue(bean: facturaInstance, field: 'totalPagado')}" required=""/>

</div>
