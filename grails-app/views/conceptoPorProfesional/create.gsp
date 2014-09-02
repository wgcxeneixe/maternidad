<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conceptoPorProfesional.label', default: 'ConceptoPorProfesional')}" />

        <script>
            $(function() {


                $("#profesional").select2({allowClear: true});



                    $("[id^='valor'],[id^='porcentaje']").keydown(function (e) {
                        // Allow: backspace, delete, tab, escape, enter and .
                        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,188]) !== -1 ||
                            // Allow: Ctrl+A
                                (e.keyCode == 65 && e.ctrlKey === true) ||
                            // Allow: home, end, left, right
                                (e.keyCode >= 35 && e.keyCode <= 39)) {
                            // let it happen, don't do anything
                            return;
                        }
                        // Ensure that it is a number and stop the keypress
                        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                            e.preventDefault();
                        }
                    });


            })

        </script>

				<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-conceptoPorProfesional" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-conceptoPorProfesional" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${conceptoPorProfesionalInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${conceptoPorProfesionalInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:conceptoPorProfesionalInstance, action:'save']" >
                <fieldset class="form">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="profesional">Profesional</label>
                            </td>
                            <td valign="top" class="value ">
                                <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" noSelection="['null':'Seleccione un Profesional']"
                                          onchange="${remoteFunction(controller: 'conceptoPorProfesional',
                                                  action: 'getConceptos',
                                                  params: '\'idProfesional=\' + this.value',
                                                  update: 'divconcepto')}" value="${profesional?.id}"
                                />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td></td>
                            <td><div id="divconcepto">
                                <g:render  template="/conceptoPorProfesional/conceptos"
                                           model="[conceptos: conceptos,profesional:profesional]"    />
                            </div>
                            </td>
                        </tr>













                        </tbody>
                    </table>

                </fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
