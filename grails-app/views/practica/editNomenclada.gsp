<%@ page import="maternidad.Practica" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'practica.label', default: 'Practica')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<a href="#edit-practica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="edit-practica" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${practicaInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${practicaInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:practicaInstance, action:'updateNomenclada']" method="PUT" >
        <g:hiddenField name="version" value="${practicaInstance?.version}" />
        <fieldset class="form">


            <div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'nombre', 'error')} required">
                <label for="nombre">
                    <g:message code="practica.nombre.label" default="Nombre" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="nombre" maxlength="120" required="" value="${practicaInstance?.nombre}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'codigo', 'error')} required">
                <label for="codigo">
                    <g:message code="practica.codigo.label" default="Codigo" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="codigo" maxlength="10" required="" value="${practicaInstance?.codigo}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'observacion', 'error')} ">
                <label for="observacion">
                    <g:message code="practica.observacion.label" default="Observacion" />

                </label>
                <g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${practicaInstance?.observacion}"/>

            </div>


            <div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'multiplicadorHonorario', 'error')} ">
                <label for="multiplicadorHonorario">
                    <g:message code="practica.multiplicadorHonorario.label" default="Multiplicador Honorario" />

                </label>
                <g:field name="multiplicadorHonorario" value="${fieldValue(bean: practicaInstance, field: 'multiplicadorHonorario')}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'multiplicadorGasto', 'error')} ">
                <label for="multiplicadorGasto">
                    <g:message code="practica.multiplicadorGasto.label" default="Multiplicador Gasto" />

                </label>
                <g:field name="multiplicadorGasto" value="${fieldValue(bean: practicaInstance, field: 'multiplicadorGasto')}"/>

            </div>



        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="updateNomenclada" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
