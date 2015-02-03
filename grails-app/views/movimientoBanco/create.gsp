<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoBanco.label', default: 'MovimientoBanco')}" />



        <title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-movimientoBanco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-movimientoBanco" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${movimientoBancoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${movimientoBancoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:movimientoBancoInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
                <g:if test="${params.id}">

                    <g:hiddenField name="parametro" value="true"/>

                    <script>
                        jQuery(function() {



                           // jQuery("#banco").prop("disabled", true);


                        })
                    </script>

                </g:if>

			</g:form>
		</div>

    <script>
        jQuery(function() {

            //idioma de los calendar
            jQuery.datepicker.regional[ "es" ];
            updateDatePicker();

            jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                updateDatePicker();
            });

            jQuery("#cheque").select2({allowClear: true});
            jQuery("#facturaProveedor").select2({allowClear: true});


            jQuery("#divcheque").hide();
            jQuery("#divcuentatransferencia").hide();
            jQuery("#divnrotransferencia").hide();

            var seleccionado=jQuery('#tipoPago').find("option:selected").text();

            if (seleccionado.toUpperCase()=='cheque'.toUpperCase()){

                jQuery("#divcheque").show();
                jQuery("#divcuentatransferencia").hide();
                jQuery("#divnrotransferencia").hide();
            }

            if (seleccionado.toUpperCase()=='transferencia'.toUpperCase()){
                jQuery("#divcuentatransferencia").show();
                jQuery("#divnrotransferencia").show();
                jQuery("#divcheque").hide();
            }


            if (seleccionado.toUpperCase()=='efectivo'.toUpperCase()){
                jQuery("#divcuentatransferencia").hide();
                jQuery("#divnrotransferencia").hide();
                jQuery("#divcheque").hide();
            }

            jQuery('#tipoPago').on('change', function() {
                var seleccionado=jQuery(this).find("option:selected").text();

                if (seleccionado.toUpperCase()=='cheque'.toUpperCase()){

                    jQuery("#divcheque").show();
                    jQuery("#divcuentatransferencia").hide();
                    jQuery("#divnrotransferencia").hide();
                }

                if (seleccionado.toUpperCase()=='transferencia'.toUpperCase()){
                    jQuery("#divcuentatransferencia").show();
                    jQuery("#divnrotransferencia").show();
                    jQuery("#divcheque").hide();
                }


                if (seleccionado.toUpperCase()=='efectivo'.toUpperCase()){
                    jQuery("#divcuentatransferencia").hide();
                    jQuery("#divnrotransferencia").hide();
                    jQuery("#divcheque").hide();
                }

            });


        })

    </script>

	</body>
</html>
