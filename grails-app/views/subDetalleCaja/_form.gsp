<%@ page import="maternidad.SubDetalleCaja" %>



<div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'conceptocaja', 'error')} ">
	<label for="conceptocaja">
		<g:message code="subDetalleCaja.conceptocaja.label" default="Conceptocaja" />
		
	</label>
	<g:select id="conceptocaja" name="conceptocaja.id" from="${maternidad.ConceptoCaja.list()}" optionKey="id" value="${subDetalleCajaInstance?.conceptocaja?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'credito', 'error')} ">
	<label for="credito">
		<g:message code="subDetalleCaja.credito.label" default="Credito" />
		
	</label>
	<g:checkBox name="credito" value="${subDetalleCajaInstance?.credito}" />

</div>

<div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="subDetalleCaja.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: subDetalleCajaInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="subDetalleCaja.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${subDetalleCajaInstance?.observaciones}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="subDetalleCaja.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${maternidad.Usuario.list()}" optionKey="id" value="${subDetalleCajaInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'detalleCaja', 'error')} ">
	<label for="detalleCaja">
		<g:message code="subDetalleCaja.detalleCaja.label" default="Detalle Caja" />
		
	</label>
	<g:select id="detalleCaja" name="detalleCaja.id" from="${maternidad.DetalleCaja.list()}" optionKey="id" value="${subDetalleCajaInstance?.detalleCaja?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

