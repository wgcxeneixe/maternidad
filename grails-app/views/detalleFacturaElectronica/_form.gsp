<%@ page import="facturaElectronica.DetalleFacturaElectronica" %>



<div class="fieldcontain ${hasErrors(bean: detalleFacturaElectronicaInstance, field: 'cantidad', 'error')} ">
	<label for="cantidad">
		<g:message code="detalleFacturaElectronica.cantidad.label" default="Cantidad" />
		
	</label>
	<g:field name="cantidad" value="${fieldValue(bean: detalleFacturaElectronicaInstance, field: 'cantidad')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaElectronicaInstance, field: 'concepto', 'error')} ">
	<label for="concepto">
		<g:message code="detalleFacturaElectronica.concepto.label" default="Concepto" />
		
	</label>
	<g:select id="concepto" name="concepto.id" from="${facturaElectronica.ConceptoDetalleFacturaElectronica.list()}" optionKey="id" value="${detalleFacturaElectronicaInstance?.concepto?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaElectronicaInstance, field: 'factura', 'error')} ">
	<label for="factura">
		<g:message code="detalleFacturaElectronica.factura.label" default="Factura" />
		
	</label>
	<g:select id="factura" name="factura.id" from="${facturaElectronica.FacturaElectronica.list()}" optionKey="id" value="${detalleFacturaElectronicaInstance?.factura?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaElectronicaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="detalleFacturaElectronica.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${detalleFacturaElectronicaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaElectronicaInstance, field: 'valor', 'error')} ">
	<label for="valor">
		<g:message code="detalleFacturaElectronica.valor.label" default="Valor" />
		
	</label>
	<g:field name="valor" value="${fieldValue(bean: detalleFacturaElectronicaInstance, field: 'valor')}"/>

</div>

