<%@ page import="maternidad.Persona" %>


<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'personaFisica', 'error')} ">
    <label for="personaFisica">
        <g:message code="persona.personaFisica.label" default="Persona Fisica" />

    </label>
    <g:checkBox id="personaFisica" name="personaFisica" value="${personaInstance?.personaFisica}" />

</div>

<div id="divnombre" class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ">
    <label for="nombre">
        <g:message code="persona.nombre.label" default="Nombre" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombre" maxlength="30" id="nombre" value="${personaInstance?.nombre}"/>

</div>

<div id="divapellido" class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="persona.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" maxlength="30" id="apellido" value="${personaInstance?.apellido}"/>

</div>


<div id="divTipoDocumento" class="fieldcontain ${hasErrors(bean: personaInstance, field: 'tipoDocumento', 'error')} ">
    <label for="tipoDocumento">
        <g:message code="persona.tipoDocumento.label" default="Tipo Documento" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="tipoDocumento" name="tipoDocumento.id" from="${maternidad.TipoDocumento.list()}" optionKey="id" required="" value="${personaInstance?.tipoDocumento?.id}" class="many-to-one"/>

</div>

<div id="divnrodoc" class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nroDocumento', 'error')} ">
    <label for="nroDocumento">
        <g:message code="persona.nroDocumento.label" default="Nro Documento" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nroDocumento" id="nroDocumento" value="${personaInstance.nroDocumento}" />

</div>


<div id="divestadocivil" class="fieldcontain ${hasErrors(bean: personaInstance, field: 'estadoCivil', 'error')} ">
    <label for="estadoCivil">
        <g:message code="persona.estadoCivil.label" default="Estado Civil" />

    </label>
    <g:select id="estadoCivil" name="estadoCivil.id" from="${maternidad.EstadoCivil.list()}" optionKey="id" value="${personaInstance?.estadoCivil?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>



<div id="divrazonsocial" class="fieldcontain ${hasErrors(bean: personaInstance, field: 'razonSocial', 'error')} ">
	<label for="razonSocial">
		<g:message code="persona.razonSocial.label" default="Razon Social" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="razonSocial" id="razonSocial" maxlength="150"  value="${personaInstance?.razonSocial}"/>

</div>


<div id="divcuit" class="fieldcontain ${hasErrors(bean: personaInstance, field: 'cuit', 'error')} ">
    <label for="cuit">
        <g:message code="persona.cuit.label" default="Cuit" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="cuit" id="cuit" value="${personaInstance.cuit}" />

</div>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nacionalidad', 'error')} ">
	<label for="nacionalidad">
		<g:message code="persona.nacionalidad.label" default="Nacionalidad" />
		
	</label>
	<g:select id="nacionalidad" name="nacionalidad.id" from="${maternidad.Pais.list()}" optionKey="id" value="${personaInstance?.nacionalidad?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="persona.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${personaInstance?.calle}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'numero', 'error')} ">
    <label for="numero">
        <g:message code="persona.numero.label" default="Numero" />

    </label>
    <g:textField name="numero"  value="${personaInstance?.numero}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'piso', 'error')} ">
	<label for="piso">
		<g:message code="persona.piso.label" default="Piso" />
		
	</label>
	<g:textField name="piso" value="${personaInstance?.piso}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'departamento', 'error')} ">
	<label for="departamento">
		<g:message code="persona.departamento.label" default="Departamento" />
		
	</label>
	<g:textField name="departamento" value="${personaInstance?.departamento}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'localidad', 'error')} ">
    <label for="localidad">
        <g:message code="persona.localidad.label" default="Localidad" />

    </label>
    <g:select id="localidad" name="localidad.id" from="${maternidad.Localidad.list()}" optionKey="id" value="${personaInstance?.localidad?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="persona.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" value="${personaInstance?.codigoPostal}"/>

</div>





