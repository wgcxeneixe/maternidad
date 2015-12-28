<%@ page import="maternidad.Medicamento" %>



<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="medicamento.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" maxlength="30" value="${medicamentoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="medicamento.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="35" value="${medicamentoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="medicamento.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${medicamentoInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="medicamento.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${medicamentoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="medicamento.marca.label" default="Marca" />
		
	</label>
	<g:select id="marca" name="marca.id" from="${maternidad.MarcaMedicamento.list()}" optionKey="id" value="${medicamentoInstance?.marca?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'valor', 'error')} ">
	<label for="valor">
		<g:message code="medicamento.valor.label" default="Valor" />
		
	</label>
	<g:field  type="number" name="valor" step="any" value="${medicamentoInstance?.valor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'formaPresentacion', 'error')} ">
	<label for="formaPresentacion">
		<g:message code="medicamento.formaPresentacion.label" default="Forma Presentacion" />
		
	</label>
	<g:textField name="formaPresentacion" value="${medicamentoInstance?.formaPresentacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'tipoMedicamento', 'error')} ">
	<label for="tipoMedicamento">
		<g:message code="medicamento.tipoMedicamento.label" default="Tipo Medicamento" />
		
	</label>
	<g:select id="tipoMedicamento" name="tipoMedicamento.id" from="${maternidad.TipoMedicamento.list()}" optionKey="id" value="${medicamentoInstance?.tipoMedicamento?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicamentoInstance, field: 'laboratorio', 'error')} ">
	<label for="laboratorio">
		<g:message code="medicamento.laboratorio.label" default="Laboratorio" />
		
	</label>
	<g:select id="laboratorio" name="laboratorio.id" from="${maternidad.Laboratorio.list()}" optionKey="id" value="${medicamentoInstance?.laboratorio?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

