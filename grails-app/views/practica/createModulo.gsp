<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">

    <script>

var loop=0;

        $(function() {

            $("#agregar").on("click", function(e) {
               loop=loop+1;
                e.preventDefault();
                $.get("/maternidad/practica/renderizar", { loop: loop }, function(html) {
                    $("#myTable>tbody").append(html);
                });
            });

            $("#obrasocial").select2({allowClear: true});


        })

    </script>

    <g:set var="entityName" value="${message(code: 'practica.label', default: 'Módulo')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-practica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
       <!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-practica" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
    <g:form url="[resource:practicaInstance, action:'saveModulo']" >
        <fieldset class="form">



                <g:hiddenField name="obrasocial.id" value="${planConvenioInstance?.plan?.obrasocial?.id}"/>


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


            <div class="fieldcontain ">
                <label for="valorHonorario">
                    <g:message code="practica.observacion.label" default="Valor Honorario" />

                </label>
                <g:textField name="valorHonorarioModulo" id="valorHonorario"  value="${valorPracticaInstance?.valorHonorarioModulo}"/>

            </div>

            <div class="fieldcontain ">
                <label for="valorGasto">
                    <g:message code="practica.observacion.label" default="Valor Gasto" />

                </label>
                <g:textField name="valorGastoModulo" id="valorGastoModulo"  value="${valorPracticaInstance?.valorGastoModulo}"/>

            </div>



<g:hiddenField name="planConvenio" value="${planConvenioInstance?.id}"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>