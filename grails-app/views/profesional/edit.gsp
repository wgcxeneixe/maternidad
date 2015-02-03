<%@ page import="maternidad.Profesional" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesional.label', default: 'Profesional')}" />


        <title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-profesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-profesional" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${profesionalInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profesionalInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:profesionalInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${profesionalInstance?.version}" />
				<fieldset class="form">
                    <g:render template="/persona/form"/>
						<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
<br/>
            ${message(code: 'profesional.listadeconceptos')}
            <div class="nav" role="navigation">
                <ul>
       
                    <li><g:link class="create" controller="conceptoPorProfesional" action="create" id="${profesionalInstance?.id}"  ><g:message code="profesional.nuevoconcepto"  /></g:link></li>
                </ul>
            </div>
            <table>
                <thead>
                <tr>

                    <th><g:message code="profesional.concepto"/> </th>

                    <g:sortableColumn property="observacion" title="${message(code: 'conceptoPorProfesional.observacion.label', default: 'Observacion')}" />

                    <g:sortableColumn property="montoFijo" title="${message(code: 'conceptoPorProfesional.montoFijo.label', default: 'Monto Fijo')}" />

                    <g:sortableColumn property="porcentaje" title="${message(code: 'conceptoPorProfesional.porcentaje.label', default: 'Porcentaje')}" />

                    <th><g:message code="conceptoPorProfesional.usuario.label" default="Usuario" /></th>

                    <g:sortableColumn property="activo" title="${message(code: 'conceptoPorProfesional.activo.label', default: 'Activo')}" />


<th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${profesionalInstance?.listaConceptos}" status="i" var="conceptoPorProfesionalInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td> ${conceptoPorProfesionalInstance?.conceptoProfesional?.nombre}   </td>

                        <td>${ (conceptoPorProfesionalInstance?.observacion?.size()>=40)? conceptoPorProfesionalInstance?.observacion?.substring(0,40) +' ...':conceptoPorProfesionalInstance?.observacion}</td>

                        <td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "montoFijo")}</td>

                        <td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "porcentaje")}</td>

                        <td>${fieldValue(bean: conceptoPorProfesionalInstance, field: "usuario")}</td>

                        <td><g:formatBoolean boolean="${conceptoPorProfesionalInstance.activo}" /></td>


                        <td><g:link class="linkEdit" controller="conceptoPorProfesional" action="create" id="${conceptoPorProfesionalInstance?.profesional?.id}">${message(code: 'default.button.edit.label')}</g:link></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${profesionalInstance?.listaConceptos?.size() ?: 0}" />
            </div>



            <div id="create-movimientoProfesional" class="content scaffold-create" role="main">
                <div class="nav" role="navigation">
                    <ul>
                    <li><g:link class="create" controller="movimientoProfesional" action="create" id="${profesionalInstance?.id}"><g:message code="default.new.label" args="['Movimiento']" /></g:link></li>
                    </ul>
                </div>

                <h1><g:message code="profesional.cuentacorriente"  /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <fieldset class="form">
                    <table>
                        <tbody>

                        <tr id="filaoculta" class="prop">
                            <td valign="top" class="name">
                                <label for="profesional">Profesional</label>
                            </td>
                            <td valign="top" class="value ">
                                <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id"  noSelection="['null':'Seleccione un Profesional']"
                                          onchange="${remoteFunction(controller: 'movimientoProfesional',
                                                  action: 'getmovimientosProfesional',
                                                  params: '\'idProfesional=\' + this.value',
                                                  update: 'divprofesional')}"
                                />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td></td>
                            <td><div id="divprofesional">
                                <g:render  template="/movimientoProfesional/movimientos"
                                           model="[movimientoProfesionalInstanceList: movimientos, movimientoProfesionalInstanceCount: movimientos?.size(), total: total]"    />
                            </div>
                            </td>
                        </tr>



                        </tbody>
                    </table>
                </fieldset>

            </div>




            <script>
                jQuery(function() {

                    jQuery('#profesional').change(function(e){

                        jQuery("#profesional").val('${profesionalInstance?.id}');
                        jQuery("#profesional").prop("disabled", true);
                        jQuery("#filaoculta").hide();
                    });

                    // And now fire change event when the DOM is ready
                    jQuery('#profesional').trigger('change');

                    // jQuery("#obrasocial").attr('readonly',true).select2({allowClear: true});
                   // jQuery("#obrasocial").attr('readonly',true);

                })

            </script>



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

            jQuery("#localidad").select2({allowClear: true});


            jQuery("#personaFisica").attr("disabled",true);

        })

    </script>

	</body>
</html>
