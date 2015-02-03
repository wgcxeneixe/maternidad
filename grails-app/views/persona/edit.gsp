<%@ page import="maternidad.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />



					<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-persona" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:personaInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${personaInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>

    <script>



        jQuery(function() {


            if(jQuery("#personaFisica").is(':checked')) {

                jQuery("#divnombre").addClass("required").show();
                jQuery("#nombre").attr("required",true);
                jQuery("#divapellido").addClass("required").show();
                jQuery("#apellido").attr("required",true);
                jQuery("#divTipoDocumento").show();
                jQuery("#divnrodoc").addClass("required").show();

                jQuery("#nroDocumento").attr("required",true);
                jQuery("#divestadocivil").show();

                jQuery("#divrazonsocial").removeClass("required").hide();
                jQuery("#razonSocial").attr("required",false);
                jQuery("#divcuit").hide();
                jQuery("#cuit").attr("required",false);

            } else {
                jQuery("#divnombre").removeClass("required").hide();
                jQuery("#nombre").attr("required",false);
                jQuery("#divapellido").removeClass("required").hide();
                jQuery("#apellido").attr("required",false);
                jQuery("#divTipoDocumento").hide();
                jQuery("#divnrodoc").removeClass("required").hide();
                jQuery("#nroDocumento").attr("required",false);
                jQuery("#divestadocivil").hide();

                jQuery("#divrazonsocial").addClass("required").show();
                jQuery("#razonSocial").attr("required",true);

                jQuery("#cuit").attr("required",true);
                jQuery("#divcuit").addClass("required").show();
            }


            jQuery("#personaFisica").click(function() {
                if(jQuery("#personaFisica").is(':checked')) {

                    jQuery("#divnombre").addClass("required").show();
                    jQuery("#nombre").attr("required",true);
                    jQuery("#divapellido").addClass("required").show();
                    jQuery("#apellido").attr("required",true);
                    jQuery("#divTipoDocumento").show();
                    jQuery("#divnrodoc").addClass("required").show();
                    jQuery("#nroDocumento").attr("required",true);
                    jQuery("#divestadocivil").show();

                    jQuery("#divrazonsocial").hide();
                    jQuery("#razonSocial").attr("required",false);
                    jQuery("#divcuit").hide();
                    jQuery("#cuit").attr("required",false);

                } else {
                    jQuery("#divnombre").removeClass("required").hide();
                    jQuery("#nombre").attr("required",false);
                    jQuery("#divapellido").removeClass("required").hide();
                    jQuery("#apellido").attr("required",false);
                    jQuery("#divTipoDocumento").hide();
                    jQuery("#divnrodoc").removeClass("required").hide();
                    jQuery("#nroDocumento").attr("required",false);
                    jQuery("#divestadocivil").hide();

                    jQuery("#divrazonsocial").addClass("required").show();
                    jQuery("#razonSocial").attr("required",true);

                    jQuery("#cuit").attr("required",true);
                    jQuery("#divcuit").addClass("required").show();
                }
            });


            //idioma de los calendar
            jQuery.datepicker.regional[ "es" ];
            updateDatePicker();

            jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                updateDatePicker();
            });

            jQuery("#banco").select2({allowClear: true});
            jQuery("#persona").select2({allowClear: true});


            //jQuery("#personaFisica").attr("disabled",true);

        })




    </script>

	</body>
</html>
