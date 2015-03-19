<%@ page import="maternidad.DetalleFactura" %>



%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'practica', 'error')} ">--}%
	%{--<label for="practica">--}%
		%{--<g:message code="detalleFactura.practica.label" default="Practica" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select id="practica" name="practica.id" from="${maternidad.Practica.list()}" optionKey="id" value="${detalleFacturaInstance?.practica?.id}" class="many-to-one" noSelection="['null': '']"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'profesional', 'error')} ">--}%
	%{--<label for="profesional">--}%
		%{--<g:message code="detalleFactura.profesional.label" default="Profesional" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" value="${detalleFacturaInstance?.profesional?.id}" class="many-to-one" noSelection="['null': '']"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'plan', 'error')} required">--}%
	%{--<label for="plan">--}%
		%{--<g:message code="detalleFactura.plan.label" default="Plan" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.plan?.id}" class="many-to-one"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'planillaInternacion', 'error')} required">--}%
	%{--<label for="planillaInternacion">--}%
		%{--<g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="planillaInternacion" name="planillaInternacion.id" from="${maternidad.PlanillaInternacion.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.planillaInternacion?.id}" class="many-to-one"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'medicamento', 'error')} ">--}%
	%{--<label for="medicamento">--}%
		%{--<g:message code="detalleFactura.medicamento.label" default="Medicamento" />--}%

	%{--</label>--}%
	%{--<g:select id="medicamento" name="medicamento.id" from="${maternidad.Medicamento.list()}" optionKey="id" value="${detalleFacturaInstance?.medicamento?.id}" class="many-to-one" noSelection="['null': '']"/>--}%

%{--</div>--}%



%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'carreraMedica', 'error')} ">--}%
	%{--<label for="carreraMedica">--}%
		%{--<g:message code="detalleFactura.carreraMedica.label" default="Carrera Medica" />--}%

	%{--</label>--}%
	%{--<g:field name="carreraMedica" value="${fieldValue(bean: detalleFacturaInstance, field: 'carreraMedica')}"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'factura', 'error')} ">--}%
	%{--<label for="factura">--}%
		%{--<g:message code="detalleFactura.factura.label" default="Factura" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select id="factura" name="factura.id" from="${maternidad.Factura.list()}" optionKey="id" value="${detalleFacturaInstance?.factura?.id}" class="many-to-one" noSelection="['null': '']"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'fecha', 'error')} ">--}%
	%{--<label for="fecha">--}%
		%{--<g:message code="detalleFactura.fecha.label" default="Fecha" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:datePicker name="fecha" precision="day"  value="${detalleFacturaInstance?.fecha}" default="none" noSelection="['': '']" />--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'funcion', 'error')} ">--}%
	%{--<label for="funcion">--}%
		%{--<g:message code="detalleFactura.funcion.label" default="Funcion" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:field name="funcion" type="number" value="${detalleFacturaInstance.funcion}"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'modulo', 'error')} ">--}%
	%{--<label for="modulo">--}%
		%{--<g:message code="detalleFactura.modulo.label" default="Modulo" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:checkBox name="modulo" value="${detalleFacturaInstance?.modulo}" />--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'observacion', 'error')} ">--}%
	%{--<label for="observacion">--}%
		%{--<g:message code="detalleFactura.observacion.label" default="Observacion" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="observacion" value="${detalleFacturaInstance?.observacion}"/>--}%

%{--</div>--}%

<g:if test="${detalleFacturaInstance?.factura}">
    <li class="fieldcontain">
        <span id="factura-label" class="property-label"><g:message code="detalleFactura.factura.label" default="Factura" /></span>

        <span class="property-value" aria-labelledby="factura-label"><g:link controller="factura" action="show" id="${detalleFacturaInstance?.factura?.id}">${detalleFacturaInstance?.factura?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${detalleFacturaInstance?.planillaInternacion}">
    <li class="fieldcontain">
        <span id="planillaInternacion-label" class="property-label"><g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" /></span>

        <span class="property-value" aria-labelledby="planillaInternacion-label"><g:link controller="planillaInternacion" action="show" id="${detalleFacturaInstance?.planillaInternacion?.id}">${detalleFacturaInstance?.planillaInternacion?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>


<g:if test="${detalleFacturaInstance?.profesional}">
    <li class="fieldcontain">
        <span id="profesional-label" class="property-label"><g:message code="detalleFactura.profesional.label" default="Profesional" /></span>

        <span class="property-value" aria-labelledby="profesional-label"><g:link controller="profesional" action="show" id="${detalleFacturaInstance?.profesional?.id}">${detalleFacturaInstance?.profesional?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>


<g:if test="${detalleFacturaInstance?.plan}">
    <li class="fieldcontain">
        <span id="plan-label" class="property-label"><g:message code="detalleFactura.plan.label" default="Plan" /></span>

        <span class="property-value" aria-labelledby="plan-label"><g:link controller="plan" action="show" id="${detalleFacturaInstance?.plan?.id}">${detalleFacturaInstance?.plan?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${detalleFacturaInstance?.practica}">
    <li class="fieldcontain">
        <span id="practica-label" class="property-label"><g:message code="detalleFactura.practica.label" default="Practica" /></span>

        <span class="property-value" aria-labelledby="practica-label"><g:link controller="practica" action="show" id="${detalleFacturaInstance?.practica?.id}">${detalleFacturaInstance?.practica?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>



%{--<g:if test="${detalleFacturaInstance?.cantidad}">--}%
    %{--<li class="fieldcontain">--}%
        %{--<span id="cantidad-label" class="property-label"><g:message code="detalleFactura.cantidad.label" default="Cantidad" /></span>--}%

        %{--<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${detalleFacturaInstance}" field="cantidad"/></span>--}%

    %{--</li>--}%
%{--</g:if>--}%

<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'cantidad', 'error')} ">
<label for="cantidad">
<g:message code="detalleFactura.cantidad.label" default="Cantidad" />

</label>
<g:field name="cantidad" value="${fieldValue(bean: detalleFacturaInstance, field: 'cantidad')}"/>

</div>

<g:if test="${detalleFacturaInstance?.carreraMedica}">
    <li class="fieldcontain">
        <span id="carreraMedica-label" class="property-label"><g:message code="detalleFactura.carreraMedica.label" default="Carrera Medica" /></span>

        <span class="property-value" aria-labelledby="carreraMedica-label"><g:fieldValue bean="${detalleFacturaInstance}" field="carreraMedica"/></span>

    </li>
</g:if>


%{--<g:if test="${detalleFacturaInstance?.fecha}">--}%
    %{--<li class="fieldcontain">--}%
        %{--<span id="fecha-label" class="property-label"><g:message code="detalleFactura.fecha.label" default="Fecha" /></span>--}%

        %{--<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${detalleFacturaInstance?.fecha}" /></span>--}%

    %{--</li>--}%
%{--</g:if>--}%

<g:if test="${detalleFacturaInstance?.funcion}">
    <li class="fieldcontain">
        <span id="funcion-label" class="property-label"><g:message code="detalleFactura.funcion.label" default="Funcion" /></span>

        <span class="property-value" aria-labelledby="funcion-label"><g:fieldValue bean="${detalleFacturaInstance}" field="funcion"/></span>

    </li>
</g:if>

<g:if test="${detalleFacturaInstance?.modulo}">
    <li class="fieldcontain">
        <span id="modulo-label" class="property-label"><g:message code="detalleFactura.modulo.label" default="Modulo" /></span>

        <span class="property-value" aria-labelledby="modulo-label"><g:formatBoolean boolean="${detalleFacturaInstance?.modulo}" /></span>

    </li>
</g:if>

<g:if test="${detalleFacturaInstance?.observacion}">
    <li class="fieldcontain">
        <span id="observacion-label" class="property-label"><g:message code="detalleFactura.observacion.label" default="Observacion" /></span>

        <span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${detalleFacturaInstance}" field="observacion"/></span>

    </li>
</g:if>

%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorFijo', 'error')} ">--}%
	%{--<label for="valorFijo">--}%
		%{--<g:message code="detalleFactura.valorFijo.label" default="Valor Fijo" />--}%

	%{--</label>--}%
	%{--<g:checkBox name="valorFijo" value="${detalleFacturaInstance?.valorFijo}" />--}%

%{--</div>--}%

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

<g:if test="${detalleFacturaInstance?.medicamento}">
    <li class="fieldcontain">
        <span id="medicamento-label" class="property-label"><g:message code="detalleFactura.medicamento.label" default="Medicamento" /></span>

        <span class="property-value" aria-labelledby="medicamento-label"><g:link controller="medicamento" action="show" id="${detalleFacturaInstance?.medicamento?.id}">${detalleFacturaInstance?.medicamento?.encodeAsHTML()}</g:link></span>

    </li>

    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorMedicamento', 'error')} ">
        <label for="valorMedicamento">
            <g:message code="detalleFactura.valorMedicamento.label" default="Valor Medicamento" />

        </label>
        <g:field name="valorMedicamento" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorMedicamento')}"/>

    </div>
</g:if>



%{--<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorPractica', 'error')} ">--}%
	%{--<label for="valorPractica">--}%
		%{--<g:message code="detalleFactura.valorPractica.label" default="Valor Practica" />--}%

	%{--</label>--}%
	%{--<g:field name="valorPractica" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorPractica')}"/>--}%

%{--</div>--}%

