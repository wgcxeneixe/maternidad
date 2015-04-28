<%@ page import="maternidad.Plan" %>


<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'obrasocial', 'error')} required">
    <label for="obrasocial">
        <g:message code="plan.obrasocial.label" default="Obrasocial" />
        <span class="required-indicator">*</span>
    </label>

    <g:textField name="nombreOS" readonly="true" value="${planInstance?.obrasocial?.encodeAsHTML()}" />

    <g:hiddenField name="obrasocial.id" value="${planInstance?.obrasocial?.id}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="plan.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="35" value="${planInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="plan.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="10" value="${planInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="plan.observacion.label" default="Observacion" />
		
	</label>
	<g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${planInstance?.observacion}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'valorMedicamento', 'error')} ">
    <label for="porcentajeAfiliado">
        <g:message code="detalleFactura.valorMedicamento.label" default="Porcentaje Afiliado" />

    </label>
    <g:field name="porcentajeAfiliado" type="number" step="any" value="${planInstance.porcentajeAfiliado}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="plan.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${planInstance?.activo}" />

</div>
