<%@ page import="maternidad.DetalleFactura" %>



<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'profesional', 'error')} required">
	<label for="profesional">
		<g:message code="detalleFactura.profesional.label" default="Profesional" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.profesional?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'plan', 'error')} required">
	<label for="plan">
		<g:message code="detalleFactura.plan.label" default="Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.plan?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'planillaInternacion', 'error')} required">
	<label for="planillaInternacion">
		<g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planillaInternacion" name="planillaInternacion.id" from="${maternidad.PlanillaInternacion.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.planillaInternacion?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'cantidad', 'error')} ">
	<label for="cantidad">
		<g:message code="detalleFactura.cantidad.label" default="Cantidad" />
		
	</label>
	<g:field name="cantidad" value="${fieldValue(bean: detalleFacturaInstance, field: 'cantidad')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'carreraMedica', 'error')} ">
	<label for="carreraMedica">
		<g:message code="detalleFactura.carreraMedica.label" default="Carrera Medica" />
		
	</label>
	<g:field name="carreraMedica" value="${fieldValue(bean: detalleFacturaInstance, field: 'carreraMedica')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'factura', 'error')} ">
	<label for="factura">
		<g:message code="detalleFactura.factura.label" default="Factura" />
		
	</label>
	<g:select id="factura" name="factura.id" from="${maternidad.Factura.list()}" optionKey="id" value="${detalleFacturaInstance?.factura?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'funcion', 'error')} ">
	<label for="funcion">
		<g:message code="detalleFactura.funcion.label" default="Funcion" />
		
	</label>
	<g:field name="funcion" type="number" value="${detalleFacturaInstance.funcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'modulo', 'error')} ">
	<label for="modulo">
		<g:message code="detalleFactura.modulo.label" default="Modulo" />
		
	</label>
	<g:checkBox name="modulo" value="${detalleFacturaInstance?.modulo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="detalleFactura.observacion.label" default="Observacion" />
		
	</label>
	<g:textField name="observacion" value="${detalleFacturaInstance?.observacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'practica', 'error')} ">
	<label for="practica">
		<g:message code="detalleFactura.practica.label" default="Practica" />
		
	</label>
	<g:select id="practica" name="practica.id" from="${maternidad.Practica.list()}" optionKey="id" value="${detalleFacturaInstance?.practica?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorGastos', 'error')} ">
	<label for="valorGastos">
		<g:message code="detalleFactura.valorGastos.label" default="Valor Gastos" />
		
	</label>
	<g:field name="valorGastos" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorGastos')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorHonorarios', 'error')} ">
	<label for="valorHonorarios">
		<g:message code="detalleFactura.valorHonorarios.label" default="Valor Honorarios" />
		
	</label>
	<g:field name="valorHonorarios" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorHonorarios')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorPractica', 'error')} ">
	<label for="valorPractica">
		<g:message code="detalleFactura.valorPractica.label" default="Valor Practica" />
		
	</label>
	<g:field name="valorPractica" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorPractica')}"/>

</div>

