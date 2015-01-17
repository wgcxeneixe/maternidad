<%@ page import="maternidad.Provincia" %>



<div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'abreviatura', 'error')} ">
	<label for="abreviatura">
		<g:message code="provincia.abreviatura.label" default="Abreviatura" />
		
	</label>
	<g:textField name="abreviatura" value="${provinciaInstance?.abreviatura}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'localidades', 'error')} ">
	<label for="localidades">
		<g:message code="provincia.localidades.label" default="Localidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${provinciaInstance?.localidades?}" var="l">
    <li><g:link controller="localidad" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="localidad" action="create" params="['provincia.id': provinciaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'localidad.label', default: 'Localidad')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="provincia.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${provinciaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: provinciaInstance, field: 'pais', 'error')} ">
	<label for="pais">
		<g:message code="provincia.pais.label" default="Pais" />
		
	</label>
	<g:select id="pais" name="pais.id" from="${maternidad.Pais.list()}" optionKey="id" value="${provinciaInstance?.pais?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

