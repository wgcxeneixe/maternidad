<%@ page import="maternidad.MovimientoStock" %>



<div class="fieldcontain ${hasErrors(bean: movimientoStockInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="movimientoStock.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${maternidad.Producto.list()}" optionKey="id" required="" value="${movimientoStockInstance?.producto?.id}" class="many-to-one"/>

</div>


<div class="fieldcontain ${hasErrors(bean: movimientoStockInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="movimientoStock.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" id="cantidad" type="number" value="${movimientoStockInstance.cantidad}" required=""/>

</div>

<div id="divradio" class="fieldcontain ${hasErrors(bean: movimientoStockInstance, field: 'ingreso', 'error')} ">
	<label for="ingreso">
		<g:message code="movimientoStock.ingreso.label" default="Ingreso" />
	</label>
    <g:radio name="ingreso" value="true" checked="true" />
    <label for="ingreso">
        <g:message code="movimientoStock.ingreso.label" default="Egreso" />
    </label><g:radio name="ingreso" value="false" />
</div>


<div id="divdestino" class="fieldcontain ${hasErrors(bean: movimientoStockInstance, field: 'destino', 'error')} " >
    <label for="destino">
        <g:message code="movimientoStock.destino.label" default="Destino" />

    </label>
    <g:select id="destino" name="destino.id" from="${maternidad.Destino.list()}" optionKey="id" value="${movimientoStockInstance?.destino?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>


<div class="fieldcontain ${hasErrors(bean: movimientoStockInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="movimientoStock.descripcion.label" default="Descripcion" />

	</label>
	<g:textField name="descripcion"  value="${movimientoStockInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoStockInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="movimientoStock.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${movimientoStockInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoStockInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="movimientoStock.usuario.label" default="Usuario" />

	</label>
	<g:select id="usuario" name="usuario.id" from="${maternidad.Usuario.list()}" optionKey="id"  value="${movimientoStockInstance?.usuario?.id}" class="many-to-one"/>

</div>

