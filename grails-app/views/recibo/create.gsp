<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recibo.label', default: 'Recibo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-recibo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-recibo" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${reciboInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${reciboInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:reciboInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<g:if test="${!reciboInstance?.id}">
				<fieldset class="buttons">


					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

						</fieldset>
				</g:if>
				</g:form>
		</div>
	<div id="list-detalleRecibo" class="content scaffold-list" role="main">
		<h1>Lista de Detalles</h1>
		<table>
			<thead>
			<tr>

				<th><g:message code="detalleRecibo.conceptoProfesional.label" default="Concepto Profesional" /></th>

				<g:sortableColumn property="valor" title="${message(code: 'detalleRecibo.valor.label', default: 'Valor')}" />

				<g:sortableColumn property="debitoCredito" title="${message(code: 'detalleRecibo.debitoCredito.label', default: 'Debito Credito')}" />

			</tr>
			</thead>
			<tbody>
			<g:each in="${reciboInstance?.detalle}" status="i" var="detalleReciboInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					<td><g:link action="show" id="${detalleReciboInstance.id}">${fieldValue(bean: detalleReciboInstance, field: "conceptoProfesional")}</g:link></td>

					<td>${fieldValue(bean: detalleReciboInstance, field: "valor")}</td>

					<td><g:formatBoolean boolean="${detalleReciboInstance.debitoCredito}" /></td>

				</tr>
			</g:each>
			</tbody>
		</table>

	</div>
	<script>
		jQuery(function() {

			//idioma de los calendar
			jQuery.datepicker.regional[ "es" ];
			updateDatePicker();

			jQuery("#spinner").ajaxComplete(function (event, request, settings) {
				updateDatePicker();
			});

			jQuery("#profesional").select2({allowClear: true});


		})

	</script>


	</body>
</html>
