<%@ page import="maternidad.PlanillaInternacion" %>


<g:if test="${planillaInternacionInstance?.paciente?.id != null}">
<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'paciente', 'error')} ">
    <label for="paciente">
        <g:message code="planillaInternacion.paciente.label" default="Paciente"/>

    </label>

    <g:link controller="persona" action="edit" id="${planillaInternacionInstance?.paciente?.id}" params="[planilla:planillaInternacionInstance?.id]">
        <g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="apellido"/>,
        <g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="nombre"/>
    </g:link>


    <g:hiddenField name="paciente" value="${planillaInternacionInstance?.paciente?.id}"></g:hiddenField>

    <g:hiddenField name="planOriginal" value="${planillaInternacionInstance?.plan?.id}"></g:hiddenField>
    <!--
    <g:select id="paciente" name="paciente.id" from="${maternidad.Persona.list()}" optionKey="id"
              value="${planillaInternacionInstance?.paciente?.id}" class="many-to-one" noSelection="['null': '']"/>
    -->
</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'plan', 'error')} required">
    <label for="plan">
        <g:message code="planillaInternacion.plan.label" default="Plan"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required=""
              value="${planillaInternacionInstance?.plan?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'fechaInternacion', 'error')} required">
    <label for="fechaInternacion">
        <g:message code="planillaInternacion.fechaInternacion.label" default="Fecha Internacion"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fechaInternacion" precision="minute" value="${planillaInternacionInstance?.fechaInternacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'nombreFamiliarResponsable', 'error')} required">
    <label for="nombreFamiliarResponsable">
        <g:message code="planillaInternacion.nombreFamiliarResponsable.label" default="Nombre Familiar Responsable"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombreFamiliarResponsable" required=""
                 value="${planillaInternacionInstance?.nombreFamiliarResponsable}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'dniFamiliarResponsable', 'error')} ">
    <label for="dniFamiliarResponsable">
        <g:message code="planillaInternacion.dniFamiliarResponsable.label"
                   default="Nro Documento Familiar Responsable"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="dniFamiliarResponsable" required=""
                 value="${planillaInternacionInstance?.dniFamiliarResponsable}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'domicilioFamiliarResponsable', 'error')} ">
    <label for="domicilioFamiliarResponsable">
        <g:message code="planillaInternacion.domicilioFamiliarResponsable.label" default="Domicilio Familiar Responsable"/>

    </label>
    <g:textField name="domicilioFamiliarResponsable"
                 value="${planillaInternacionInstance?.domicilioFamiliarResponsable}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'fechaNacimiento', 'error')} ">
    <label for="fechaNacimiento">
        <g:message code="planillaInternacion.fechaNacimiento.label" default="Fecha Nacimiento"/>

    </label>
    <g:datePicker default="none" noSelection="['':'']" name="fechaNacimiento" precision="day" value="${planillaInternacionInstance?.fechaNacimiento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'fechaAlta', 'error')} required">
    <label for="fechaAlta">
        <g:message code="planillaInternacion.fechaAlta.label" default="Fecha Alta"/>

    </label>
    <g:datePicker default="none" noSelection="['':'']" name="fechaAlta" precision="minute" value="${planillaInternacionInstance?.fechaAlta}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'numeroIngreso', 'error')} ">
    <label for="numeroIngreso">
        <g:message code="planillaInternacion.numeroIngreso.label" default="Número Ingreso"/>

    </label>
    <g:field type="number" name="numeroIngreso" cols="40" rows="5" maxlength="5000" value="${planillaInternacionInstance?.numeroIngreso}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'numeroAfiliado', 'error')} ">
    <label for="numeroAfiliado">
        <g:message code="planillaInternacion.numeroAfiliado.label" default="Número Afiliado"/>

    </label>
    <g:textField  name="numeroAfiliado"  value="${planillaInternacionInstance?.numeroAfiliado}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'tipoSocio', 'error')} ">
    <label for="tipoSocio">
        <g:message code="planilla.tipoSocio" default="Tipo Socio" />

    </label>
    <g:select name="tipoSocio" from="${planillaInternacionInstance.constraints.tipoSocio.inList}"  value="${planillaInternacionInstance?.tipoSocio}" />

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'ocupacion', 'error')} ">
    <label for="ocupacion">
        <g:message code="planillaInternacion.ocupacion.label" default="Ocupación"/>

    </label>
    <g:textField name="ocupacion"
                 value="${planillaInternacionInstance?.ocupacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'diagnostico', 'error')} ">
    <label for="diagnostico">
        <g:message code="planillaInternacion.diagnostico.label" default="Diagnóstico"/>

    </label>
    <g:textArea name="diagnostico" cols="40" rows="5" maxlength="5000" value="${planillaInternacionInstance?.diagnostico}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'tratamiento', 'error')} ">
    <label for="tratamiento">
        <g:message code="planillaInternacion.tratamiento.label" default="Tratamiento"/>

    </label>
    <g:textArea name="tratamiento" cols="40" rows="5" maxlength="5000" value="${planillaInternacionInstance?.tratamiento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'observaciones', 'error')} ">
    <label for="observaciones">
        <g:message code="planillaInternacion.observaciones.label" default="Observaciones"/>

    </label>
    <g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${planillaInternacionInstance?.observaciones}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'ocupacion', 'error')} ">
    <label for="ficha">
        <g:message code="planillaInternacion.ficha.label" default="Ficha Unica"/>

    </label>
    <g:textField name="fichaAcler"
                 value="${planillaInternacionInstance?.fichaAcler}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planillaInternacionInstance, field: 'activo', 'error')} ">
    <label for="activo">
        <g:message code="planillaInternacion.ficha.label" default="Activo"/>

    </label>
    <g:checkBox name="activo"
                 value="${planillaInternacionInstance?.activo}"/>

</div>

