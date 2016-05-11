<%@ page import="maternidad.MovimientoPlanilla" %>



<div class="fieldcontain ${hasErrors(bean: movimientoPlanillaInstance, field: 'estadoPlanilla', 'error')} ">
	<label for="estadoPlanilla">
		<g:message code="movimientoPlanilla.estadoPlanilla.label" default="Estado Planilla" />
		
	</label>
	<g:select id="estadoPlanilla" name="estadoPlanilla.id" from="${maternidad.EstadoPlanilla.list()}" optionKey="id" value="${movimientoPlanillaInstance?.estadoPlanilla?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoPlanillaInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="movimientoPlanilla.fecha.label" default="Fecha" />
		
	</label>
	<g:datePicker name="fecha" precision="day"  value="${movimientoPlanillaInstance?.fecha}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoPlanillaInstance, field: 'planillaInternacion', 'error')} ">
	<label for="planillaInternacion">
		<g:message code="movimientoPlanilla.planillaInternacion.label" default="Planilla Internacion" />
		
	</label>
	<g:select id="planillaInternacion" name="planillaInternacion.id" from="${maternidad.PlanillaInternacion.list()}" optionKey="id" value="${movimientoPlanillaInstance?.planillaInternacion?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoPlanillaInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="movimientoPlanilla.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${maternidad.Usuario.list()}" optionKey="id" value="${movimientoPlanillaInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

