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

    <g:form url="[resource:planillaInternacionInstance, action:'saveAsociacionMedicos']" >
        <fieldset class="form">

            <g:hiddenField name="planillaInternacion.id" value="${planillaInternacionInstance?.id}"/>

            <div class="fieldcontain ">
                <label for="profesional">
                    <g:message code="practicaModulo.practica.label" default="Médico Cabecera" />

                </label>

                <g:select id="medicoCabecera" name="medicoCabecera.id" from="${maternidad.Profesional.findAllByActivo(true)}" value="${planillaInternacionInstance?.medicoCabecera?.id}" optionKey="id"   class="many-to-one" noSelection="['':'-Seleccione un Profesional-']" />

            </div>

            <div class="fieldcontain ">
                <label for="profesional">
                    <g:message code="practicaModulo.practica.label" default="Médico Cirujano" />

                </label>
                <g:select id="medicoCirujano" name="medicoCirujano.id" from="${maternidad.Profesional.findAllByActivo(true)}" value="${planillaInternacionInstance?.medicoCirujano?.id}" optionKey="id"  class="many-to-one" noSelection="['':'-Seleccione un Profesional-']"/>

            </div>

            <div class="fieldcontain  ">
                <label for="profesional">
                    <g:message code="practicaModulo.practica.label" default="Médico Ayudante 1" />

                </label>
                <g:select id="medicoAyudante1" name="medicoAyudante1.id" from="${maternidad.Profesional.findAllByActivo(true)}" optionKey="id" value="${planillaInternacionInstance?.medicoAyudante1?.id}"  class="many-to-one" noSelection="['':'-Seleccione un Profesional-']"/>

            </div>

            <div class="fieldcontain  ">
                <label for="profesional">
                    <g:message code="practicaModulo.practica.label" default="Médico Ayudante 2" />

                </label>
                <g:select id="medicoAyudante2" name="medicoAyudante2.id" from="${maternidad.Profesional.findAllByActivo(true)}" optionKey="id" value="${planillaInternacionInstance?.medicoAyudante2?.id}"  class="many-to-one" noSelection="['':'-Seleccione un Profesional-']"/>

            </div>

            <div class="fieldcontain ">
                <label for="profesional">
                    <g:message code="practicaModulo.practica.label" default="Médico Anestesista" />

                </label>
                <g:select id="medicoAnestesista" name="medicoAnestesista.id" from="${maternidad.Profesional.findAllByActivo(true)}" optionKey="id"  class="many-to-one" value="${planillaInternacionInstance?.medicoAnestesista?.id}" noSelection="['':'-Seleccione un Profesional-']"/>

            </div>

            <div class="fieldcontain ">
                <label for="otro1">
                    <g:message code="practicaModulo.practica.label" default="Otro Médico 1" />

                </label>
                <g:select id="otro1" name="medicoOtro1.id" from="${maternidad.Profesional.findAllByActivo(true)}" optionKey="id"  class="many-to-one" value="${planillaInternacionInstance?.medicoAnestesista?.id}" noSelection="['':'-Seleccione un Profesional-']"/>

            </div>

            <div class="fieldcontain ">
                <label for="otro2">
                    <g:message code="practicaModulo.practica.label" default="Otro Médico 2" />

                </label>
                <g:select id="otro2" name="medicoOtro2.id" from="${maternidad.Profesional.findAllByActivo(true)}" optionKey="id"  class="many-to-one" value="${planillaInternacionInstance?.medicoAnestesista?.id}" noSelection="['':'-Seleccione un Profesional-']"/>

            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>



</div>
<script>
    $(function() {
        jQuery("#medicoCabecera,#medicoCirujano,#medicoAyudante1,#medicoAyudante2,#medicoAnestesista,#otro1,#otro2").select2({allowClear: true});
    })

</script>

</body>
</html>