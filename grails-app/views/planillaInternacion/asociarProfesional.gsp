<%@ page import="maternidad.PlanillaInternacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planillaInternacion.label', default: 'PlanillaInternacion')}"/>
    <title><g:message code="planillaInternacion.buscapaciente.label" args="[entityName]"/></title>

</head>

<body>
<a href="#edit-planillaInternacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
        <li><g:link class="list" action="index"><g:message code="planillaInternacion.list.label" args="[entityName]"/></g:link></li>

    </ul>
</div>

<div id="edit-planillaInternacion" class="content scaffold-edit" role="main">
    <h1><g:message code="planillaInternacion.asociarProfesional" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${planillaInternacionInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${planillaInternacionInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form url="[resource:practicaModuloInstance, action:'saveAsociacionProfesional']" >
        <fieldset class="form">

            <g:hiddenField name="planillaInternacion.id" value="${planillaInternacionInstance?.id}"/>

            <div class="fieldcontain  required">
                <label for="profesional">
                    <g:message code="practicaModulo.practica.label" default="Profesional" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.findAllByActivo(true)}" optionKey="id" required=""  class="many-to-one"/>

            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>

    <table class="ajax">
        <thead>
        <tr>

            <th><g:message code="profesional.persona.label" default="Persona"  /></th>

            <g:sortableColumn property="matriculaProvincial" title="${message(code: 'profesional.matriculaProvincial.label', default: 'Matricula Provincial')}"  />

            <th><g:message code="persona.nroDocumento.label" default="Nº Documento"  /></th>

            <th><g:message code="persona.cuit.label" default="Cuit"  /></th>

            <th><g:message code="profesional.banco.label" default="Banco"  /></th>

            <g:sortableColumn property="activo" title="${message(code: 'profesional.activo.label', default: 'Activo')}"  />


        </tr>
        </thead>
        <tbody>
        <g:each in="${planillaInternacionInstance?.profesionales}" status="i" var="profesionalInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: profesionalInstance, field: "persona")}</td>


                <td>${fieldValue(bean: profesionalInstance, field: "matriculaProvincial")}</td>

                <td>${profesionalInstance?.persona?.nroDocumento} </td>

                <td>${profesionalInstance?.persona?.cuit}</td>

                <td>${fieldValue(bean: profesionalInstance, field: "banco")}</td>

                <td><g:formatBoolean boolean="${profesionalInstance.activo}" /></td>

            </tr>
        </g:each>
        </tbody>
    </table>


</div>
<script>
    $(function() {
        jQuery("#profesional").select2({allowClear: true});
    })

</script>

</body>
</html>