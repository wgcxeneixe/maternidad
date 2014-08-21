<%@ page import="maternidad.ObraSocial" %>



<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'sigla', 'error')} required">
	<label for="sigla">
		<g:message code="obraSocial.sigla.label" default="Sigla" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sigla" maxlength="15" required="" value="${obraSocialInstance?.sigla}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="obraSocial.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="35" value="${obraSocialInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="obraSocial.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="10" value="${obraSocialInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'cuit', 'error')} ">
	<label for="cuit">
		<g:message code="obraSocial.cuit.label" default="Cuit" />
		
	</label>
	<g:textField name="cuit"  value="${obraSocialInstance.cuit}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'observacion', 'error')} ">
	<label for="observacion">
		<g:message code="obraSocial.observacion.label" default="Observacion" />
		
	</label>
	<g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${obraSocialInstance?.observacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'activa', 'error')} ">
	<label for="activa">
		<g:message code="obraSocial.activa.label" default="Activa" />
		
	</label>
	<g:checkBox name="activa" value="${obraSocialInstance?.activa}" />

</div>

<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'convenios', 'error')} ">
	<label for="convenios">
		<g:message code="obraSocial.convenios.label" default="Convenios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${obraSocialInstance?.convenios?}" var="c">
    <li><g:link controller="convenio" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="convenio" action="create" params="['obraSocial.id': obraSocialInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'convenio.label', default: 'Convenio')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'planes', 'error')} ">
	<label for="planes">
		<g:message code="obraSocial.planes.label" default="Planes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${obraSocialInstance?.planes?}" var="p">
    <li><g:link controller="plan" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="plan" action="create" params="['obraSocial.id': obraSocialInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'plan.label', default: 'Plan')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: obraSocialInstance, field: 'practicas', 'error')} ">
	<label for="practicas">
		<g:message code="obraSocial.practicas.label" default="Practicas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${obraSocialInstance?.practicas?}" var="p">
    <li><g:link controller="practica" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="practica" action="create" params="['obraSocial.id': obraSocialInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'practica.label', default: 'Practica')])}</g:link>
</li>
</ul>


</div>

