<%@ page import="maternidad.DetalleRecibo" %>



<div class="fieldcontain ${hasErrors(bean: detalleReciboInstance, field: 'conceptoProfesional', 'error')} ">
	<label for="conceptoProfesional">
		<g:message code="detalleRecibo.conceptoProfesional.label" default="Concepto Profesional" />
		
	</label>
	<g:select id="conceptoProfesional" name="conceptoProfesional.id" from="${maternidad.ConceptoProfesional.list()}" optionKey="id" value="${detalleReciboInstance?.conceptoProfesional?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleReciboInstance, field: 'valor', 'error')} ">
	<label for="valor">
		<g:message code="detalleRecibo.valor.label" default="Valor" />
		
	</label>
	<g:field type="number" step="any" name="valor" value="${detalleReciboInstance?.valor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleReciboInstance, field: 'debitoCredito', 'error')} ">
	<label for="debitoCredito">
		<g:message code="detalleRecibo.debitoCredito.label" default="Debito Credito" />
		
	</label>
	<g:checkBox name="debitoCredito" value="${detalleReciboInstance?.debitoCredito}" />

</div>
<g:if test="${params.idRecibo}">
	<g:hiddenField name="idRecibo" value="${params.idRecibo}"/>

</g:if>
