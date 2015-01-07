<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">

    <script>
        $(function() {


            $("#practica").select2({allowClear: true});
            //$("#obrasocial").attr('readonly',true);

        })

    </script>

    <g:set var="entityName" value="${message(code: 'practicaModulo.label', default: 'Practica')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-practicaModulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-practicaModulo" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${practicaModuloInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${practicaModuloInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:practicaModuloInstance, action:'saveAsociacionPractica']" >
        <fieldset class="form">




                <g:hiddenField name="planConvenio.id" value="${planConvenio?.id}"/>




            <div class="fieldcontain  required">
                <label for="practica">
                    <g:message code="practicaModulo.practica.label" default="Practica" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="practica" name="practica.id" from="${maternidad.Practica.findAllByNomenclada(Boolean.TRUE)}" optionKey="id" required=""  class="many-to-one"/>

            </div>



            <div class="fieldcontain required ">
                <label for="valor">
                    <g:message code="practicaModulo.valorGasto.label" default="Valor" />

                </label>
                <g:textField name="valor" required="" />

            </div>



            <div class="fieldcontain required ">
                <label for="pisar">
                    <g:message code="convenio.actualizarautom" default="Actualizar Automaticamente" />

                </label>
                <g:checkBox checked="true" name="pisar" />

            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>