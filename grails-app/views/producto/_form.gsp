<%@ page import="maternidad.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="120" required="" value="${productoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="producto.codigo.label" default="Codigo" />

	</label>
	<g:textField name="codigo" maxlength="10"  value="${productoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="producto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${productoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'cantidadMinima', 'error')} required">
	<label for="cantidadMinima">
		<g:message code="producto.cantidadMinima.label" default="Cantidad Minima" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadMinima" type="number" value="${productoInstance.cantidadMinima}" required=""/>

</div>
<!--
<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'movimientosStock', 'error')} ">
	<label for="movimientosStock">
		<g:message code="producto.movimientosStock.label" default="Movimientos Stock" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productoInstance?.movimientosStock?}" var="m">
    <li><g:link controller="movimientoStock" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="movimientoStock" action="create" params="['producto.id': productoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movimientoStock.label', default: 'MovimientoStock')])}</g:link>
</li>
</ul>


</div>
-->
