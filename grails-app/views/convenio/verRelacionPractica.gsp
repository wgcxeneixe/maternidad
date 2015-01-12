<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">

    <script>
        $(function() {



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

        <fieldset class="form">





            <ol class="property-list valorPractica">


                <div class="fieldcontain  required">
                    <label for="practica">
                        <g:message code="practicaModulo.practica.label" default="Practica" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select disabled="true" id="practica" name="practica.id" from="${maternidad.Practica.findAllByNomenclada(Boolean.TRUE)}" optionKey="id" value="${valorPractica?.practica?.id}"/>

                </div>



                <g:if test="${valorPractica?.valorGasto}">
                    <li class="fieldcontain">
                        <span id="valorGasto-label" class="property-label"><g:message code="valorPractica.valorGasto.label" default="Valor Gasto" /></span>

                        <span class="property-value" aria-labelledby="valorGasto-label"><g:fieldValue bean="${valorPractica}" field="valorGasto"/></span>

                    </li>
                </g:if>

                <g:if test="${valorPractica?.valorHonorario}">
                    <li class="fieldcontain">
                        <span id="valorHonorario-label" class="property-label"><g:message code="valorPractica.valorHonorario.label" default="Valor Honorario" /></span>

                        <span class="property-value" aria-labelledby="valorHonorario-label"><g:fieldValue bean="${valorPractica}" field="valorHonorario"/></span>

                    </li>
                </g:if>

                <g:if test="${valorPractica?.valorAnestecista}">
                    <li class="fieldcontain">
                        <span id="valorAnestecista-label" class="property-label"><g:message code="valorPractica.valorAnestecista.label" default="Valor Anestecista" /></span>

                        <span class="property-value" aria-labelledby="valorAnestecista-label"><g:fieldValue bean="${valorPractica}" field="valorAnestecista"/></span>

                    </li>
                </g:if>

                <g:if test="${valorPractica?.valorAyudante}">
                    <li class="fieldcontain">
                        <span id="valorAyudante-label" class="property-label"><g:message code="valorPractica.valorAyudante.label" default="Valor Ayudante" /></span>

                        <span class="property-value" aria-labelledby="valorAyudante-label"><g:fieldValue bean="${valorPractica}" field="valorAyudante"/></span>

                    </li>
                </g:if>

                <g:if test="${valorPractica?.valorEspecialista}">
                    <li class="fieldcontain">
                        <span id="valorEspecialista-label" class="property-label"><g:message code="valorPractica.valorEspecialista.label" default="Valor Especialista" /></span>

                        <span class="property-value" aria-labelledby="valorEspecialista-label"><g:fieldValue bean="${valorPractica}" field="valorEspecialista"/></span>

                    </li>
                </g:if>

<!--
                <g:if test="${valorPracticaInstance?.plan}">
                    <li class="fieldcontain">
                        <span id="plan-label" class="property-label"><g:message code="valorPractica.plan.label" default="Plan" /></span>

                        <span class="property-value" aria-labelledby="plan-label"><g:link controller="plan" action="show" id="${valorPracticaInstance?.plan?.id}">${valorPracticaInstance?.plan?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>
-->

                <g:if test="${valorPractica?.fechaActualizado}">
                    <li class="fieldcontain">
                        <span id="fechaActualizado-label" class="property-label"><g:message code="valorPractica.fechaActualizado.label" default="Fecha Actualizado" /></span>

                        <span class="property-value" aria-labelledby="fechaActualizado-label"><g:formatDate date="${valorPractica?.fechaActualizado}" /></span>

                    </li>
                </g:if>


            </ol>




        </fieldset>
        <fieldset class="buttons">
         <g:link action="editPlan" id="${valorPractica?.planConvenio?.id}"><g:message code="defaul.button.volver.label"/></g:link>
        </fieldset>

</div>
</body>
</html>