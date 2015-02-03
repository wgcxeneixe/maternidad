<%@ page import="maternidad.DetalleCaja" %>
<!DOCTYPE html>
<html>
	<head>

		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleCaja.label', default: 'DetalleCaja')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-detalleCaja" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="detalleCaja.list.label" args="[entityName]" /></g:link></li>

			</ul>
		</div>
		<div id="edit-detalleCaja" class="content scaffold-edit" role="main">
			<h1><g:message code="detalleCaja.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${detalleCajaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${detalleCajaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:detalleCajaInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${detalleCajaInstance?.version}" />
				<fieldset class="form">
					<g:render template="formedit"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>

    <script>
        $(function() {
            //idioma de los calendar
            jQuery.datepicker.regional[ "es" ];
            updateDatePicker();
            jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                updateDatePicker();
            });
            //Selector para planilla de internacion
            jQuery("#planillainternacion").select2({allowClear: true});
            //Selector para Concepto
            jQuery("#conceptocaja").select2({allowClear: true});
        })
    </script>

	</body>
</html>
