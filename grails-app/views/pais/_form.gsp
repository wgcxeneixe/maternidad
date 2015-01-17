<%@ page import="maternidad.Pais" %>



<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'abreviatura', 'error')} ">
	<label for="abreviatura">
		<g:message code="pais.abreviatura.label" default="Abreviatura" />
		
	</label>
	<g:textField name="abreviatura" value="${paisInstance?.abreviatura}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="pais.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${paisInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'frecuente', 'error')} ">
	<label for="frecuente">
		<g:message code="pais.frecuente.label" default="Frecuente" />
		
	</label>
	<g:checkBox name="frecuente" value="${paisInstance?.frecuente}" />

</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'gentilicio', 'error')} ">
	<label for="gentilicio">
		<g:message code="pais.gentilicio.label" default="Gentilicio" />
		
	</label>
	<g:textField name="gentilicio" value="${paisInstance?.gentilicio}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="pais.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${paisInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'provincias', 'error')} ">
	<label for="provincias">
		<g:message code="pais.provincias.label" default="Provincias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${paisInstance?.provincias?}" var="p">
    <li><g:link controller="provincia" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="provincia" action="create" params="['pais.id': paisInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'provincia.label', default: 'Provincia')])}</g:link>
</li>
</ul>


</div>

