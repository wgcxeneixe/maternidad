<%@ page import="maternidad.EnteReceptor" %>



<div class="fieldcontain ${hasErrors(bean: enteReceptorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="enteReceptor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="35" required="" value="${enteReceptorInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: enteReceptorInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="enteReceptor.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="10" required="" value="${enteReceptorInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: enteReceptorInstance, field: 'detallePracticasValorizado', 'error')} ">
	<label for="detallePracticasValorizado">
		<g:message code="enteReceptor.detallePracticasValorizado.label" default="Detalle Practicas Valorizado" />
		
	</label>
	<g:checkBox name="detallePracticasValorizado" value="${enteReceptorInstance?.detallePracticasValorizado}" />

</div>

<div class="fieldcontain ${hasErrors(bean: enteReceptorInstance, field: 'llevaFactura', 'error')} ">
	<label for="llevaFactura">
		<g:message code="enteReceptor.llevaFactura.label" default="Lleva Factura" />
		
	</label>
	<g:checkBox name="llevaFactura" value="${enteReceptorInstance?.llevaFactura}" />

</div>

<div class="fieldcontain ${hasErrors(bean: enteReceptorInstance, field: 'obrasSociales', 'error')} ">
	<label for="obrasSociales">
		<g:message code="enteReceptor.obrasSociales.label" default="Obras Sociales" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${enteReceptorInstance?.obrasSociales?}" var="o">
    <li><g:link controller="obraSocial" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="obraSocial" action="create" params="['enteReceptor.id': enteReceptorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'obraSocial.label', default: 'ObraSocial')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: enteReceptorInstance, field: 'pidePreAprobacion', 'error')} ">
	<label for="pidePreAprobacion">
		<g:message code="enteReceptor.pidePreAprobacion.label" default="Pide Pre Aprobacion" />
		
	</label>
	<g:checkBox name="pidePreAprobacion" value="${enteReceptorInstance?.pidePreAprobacion}" />

</div>

