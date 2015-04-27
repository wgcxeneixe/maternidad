<%@ page import="maternidad.DetalleFactura" %>


<g:if test="${detalleFacturaInstance?.planillaInternacion}">
    <li class="fieldcontain">
        <span id="planillaInternacion-label" class="property-label"><g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" /></span>

        <span class="property-value" aria-labelledby="planillaInternacion-label"><g:link controller="planillaInternacion" action="show" id="${detalleFacturaInstance?.planillaInternacion?.id}">${detalleFacturaInstance?.planillaInternacion?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${detalleFacturaInstance.practica}">



<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'profesional', 'error')} required">
    <label for="profesional">
        <g:message code="detalleFactura.profesional.label" default="Profesional" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.profesional?.id}" class="many-to-one"/>

</div>



<g:if test="${detalleFacturaInstance?.plan}">
    <li class="fieldcontain">
        <span id="plan-label" class="property-label"><g:message code="detalleFactura.plan.label" default="Plan" /></span>

        <span class="property-value" aria-labelledby="plan-label"><g:link controller="plan" action="show" id="${detalleFacturaInstance?.plan?.id}">${detalleFacturaInstance?.plan?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>


<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'practica', 'error')} required">
    <label for="practica">
        <g:message code="detalleFactura.practica.label" default="Practica" />

    </label>
    <g:select required="" id="practica" name="practica.id" from="${practicas}" optionKey="id"  value="${detalleFacturaInstance?.practica?.id}" class="many-to-one" />

</div>



    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorGastos', 'error')} ">
        <label for="valorGastos">
            <g:message code="detalleFactura.valorGastos.label" default="Valor Gastos" />

        </label>
        <g:field name="valorGastos" type="number" step="any" value="${detalleFacturaInstance?.valorGastos}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorHonorarios', 'error')} ">
        <label for="valorHonorarios">
            <g:message code="detalleFactura.valorHonorarios.label" default="Valor Honorarios" />

        </label>
        <g:field name="valorHonorarios" type="number" step="any" value="${detalleFacturaInstance?.valorHonorarios}"/>

    </div>



</g:if>


<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'cantidad', 'error')} ">
    <label for="cantidad">
        <g:message code="detalleFactura.cantidad.label" default="Cantidad" />

    </label>
    <g:field name="cantidad" type="number" value="${fieldValue(bean: detalleFacturaInstance, field: 'cantidad')}"/>

</div>

<g:if test="${detalleFacturaInstance?.carreraMedica}">
    <li class="fieldcontain">
        <span id="carreraMedica-label" class="property-label"><g:message code="detalleFactura.carreraMedica.label" default="Carrera Medica" /></span>

        <span class="property-value" aria-labelledby="carreraMedica-label"><g:fieldValue bean="${detalleFacturaInstance}" field="carreraMedica"/></span>

    </li>
</g:if>



<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="movimientoStock.fecha.label" default="Fecha" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha"  precision="minute"  value="${detalleFacturaInstance?.fecha}"  />

</div>



<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'funcion', 'error')} ">
    <label for="funcion">
        <g:message code="detalleFactura.funcion.label" default="Funcion" />

    </label>
    <select required name ="funcion" id="funcion">
        <option value="">Seleccione una Función</option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="60">60</option>
        <option value="70">70</option>
        <option value="91">91</option>
    </select>
</div>

<g:if test="${detalleFacturaInstance?.modulo}">
    <li class="fieldcontain">
        <span id="modulo-label" class="property-label"><g:message code="detalleFactura.modulo.label" default="Modulo" /></span>

        <span class="property-value" aria-labelledby="modulo-label"><g:formatBoolean boolean="${detalleFacturaInstance?.modulo}" /></span>

    </li>
</g:if>

<g:if test="${detalleFacturaInstance?.observacion}">



    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'observacion', 'error')} ">
        <label for="observacion">
            <g:message code="detalleFactura.observacion.label" default="Observacion" />

        </label>
        <g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${detalleFacturaInstance?.observacion}"/>

    </div>

</g:if>


<g:if test="${detalleFacturaInstance?.medicamento}">

    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'medicamento', 'error')} required">
        <label for="medicamento">
            <g:message code="detalleFactura.profesional.label" default="Medicamento" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="medicamento" name="medicamento.id" from="${maternidad.Medicamento.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.medicamento?.id}" class="many-to-one"/>

    </div>


    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorMedicamento', 'error')} ">
        <label for="valorMedicamento">
            <g:message code="detalleFactura.valorMedicamento.label" default="Valor Medicamento" />

        </label>
        <g:field name="valorMedicamento" type="number" step="any" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorMedicamento')}"/>

    </div>
</g:if>



