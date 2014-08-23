<%@ page import="maternidad.Destino" %>



<div class="fieldcontain ${hasErrors(bean: destinoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="destino.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="120" required="" value="${destinoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: destinoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="destino.codigo.label" default="Codigo" />

	</label>
	<g:textField name="codigo" maxlength="10"  value="${destinoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: destinoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="destino.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${destinoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: destinoInstance, field: 'movimientosStock', 'error')} ">
	<label for="movimientosStock">
		<g:message code="destino.movimientosStock.label" default="Movimientos Stock" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${destinoInstance?.movimientosStock?}" var="m">
    <li><g:link controller="movimientoStock" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="movimientoStock" action="create" params="['destino.id': destinoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movimientoStock.label', default: 'MovimientoStock')])}</g:link>
</li>
</ul>


</div>

