<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'internacion.label', default: 'Internacion')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-internacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
       <!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li> -->
        <li><g:link class="create" controller="planillaInternacion" action="show" id="${planilla}" ><g:message code="defaul.button.volver.label" /></g:link></li>
    </ul>
</div>
<div id="create-internacion" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${internacionInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${internacionInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:internacionInstance, action:'savePlanilla']" >
        <fieldset class="form">
            <g:render template="formPlanilla"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
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
    })
</script>

</body>
</html>
