<%@ page import="maternidad.Plan" %>


<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'obrasocial', 'error')} required">
    <label for="obrasocial">
        <g:message code="plan.obrasocial.label" default="Obrasocial" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="obrasocial" name="obrasocial.id" from="${maternidad.ObraSocial.list()}" optionKey="id" required="" value="${planInstance?.obrasocial?.id}" class="many-to-one"/>

</div>


<div class="fieldcontain ">
    <label for="convenio">
        <g:message code="plan.obrasocial.label" default="Convenio" />
    </label>
    <g:textField name="nombreConvenio" readonly="true" value="${convenio?.encodeAsHTML()}" />

    <g:hiddenField name="convenio" value="${convenio?.id}"/>
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


<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="plan.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${planInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'movimientosPlan', 'error')} ">
	<label for="movimientosPlan">
		<g:message code="plan.movimientosPlan.label" default="Movimientos Plan" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${planInstance?.movimientosPlan?}" var="m">
    <li><g:link controller="movimientoPlan" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="movimientoPlan" action="create" params="['plan.id': planInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movimientoPlan.label', default: 'MovimientoPlan')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: planInstance, field: 'planConvenios', 'error')} ">
	<label for="planConvenios">
		<g:message code="plan.planConvenios.label" default="Plan Convenios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${planInstance?.planConvenios?}" var="p">
    <li><g:link controller="planConvenio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="planConvenio" action="create" params="['plan.id': planInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'planConvenio.label', default: 'PlanConvenio')])}</g:link>
</li>
</ul>


</div>

