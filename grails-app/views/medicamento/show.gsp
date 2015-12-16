
<%@ page import="maternidad.Medicamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicamento.label', default: 'Medicamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-medicamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-medicamento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list medicamento">
			
				<g:if test="${medicamentoInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="medicamento.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${medicamentoInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="medicamento.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${medicamentoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentoInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="medicamento.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${medicamentoInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="medicamento.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${medicamentoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentoInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="medicamento.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:link controller="marcaMedicamento" action="show" id="${medicamentoInstance?.marca?.id}">${medicamentoInstance?.marca?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentoInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="medicamento.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${medicamentoInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentoInstance?.formaPresentacion}">
				<li class="fieldcontain">
					<span id="formaPresentacion-label" class="property-label"><g:message code="medicamento.formaPresentacion.label" default="Forma Presentacion" /></span>
					
						<span class="property-value" aria-labelledby="formaPresentacion-label"><g:fieldValue bean="${medicamentoInstance}" field="formaPresentacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentoInstance?.tipoMedicamento}">
				<li class="fieldcontain">
					<span id="tipoMedicamento-label" class="property-label"><g:message code="medicamento.tipoMedicamento.label" default="Tipo Medicamento" /></span>
					
						<span class="property-value" aria-labelledby="tipoMedicamento-label"><g:link controller="tipoMedicamento" action="show" id="${medicamentoInstance?.tipoMedicamento?.id}">${medicamentoInstance?.tipoMedicamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicamentoInstance?.laboratorio}">
				<li class="fieldcontain">
					<span id="laboratorio-label" class="property-label"><g:message code="medicamento.laboratorio.label" default="Laboratorio" /></span>
					
						<span class="property-value" aria-labelledby="laboratorio-label"><g:link controller="laboratorio" action="show" id="${medicamentoInstance?.laboratorio?.id}">${medicamentoInstance?.laboratorio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:medicamentoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${medicamentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
