<%@ page import="maternidad.Recibo" %>



<div class="fieldcontain ${hasErrors(bean: reciboInstance, field: 'nro', 'error')} ">
	<label for="nro">
		<g:message code="recibo.nro.label" default="Nro" />
		
	</label>
	<g:field name="nro" type="number" value="${reciboInstance?.nro}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reciboInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="recibo.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="day"  value="${reciboInstance?.fecha}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: reciboInstance, field: 'profesional', 'error')} ">
	<label for="profesional">
		<g:message code="recibo.profesional.label" default="Profesional" />
		
	</label>
	<g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" value="${reciboInstance?.profesional?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reciboInstance, field: 'total', 'error')} ">
	<label for="total">
		<g:message code="recibo.total.label" default="Total" />
		
	</label>
	<g:field name="total" value="${fieldValue(bean: reciboInstance, field: 'total')}"/>

</div>
%{--<g:if test="${reciboInstance?.id}">
<g:link name="agregar"  id="agregar" >Agregar Detalle </g:link>
</g:if>--}%
