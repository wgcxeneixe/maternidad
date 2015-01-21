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
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-practica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
      <!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
       <!-- <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li> -->
    </ul>
</div>
<div id="create-practica" class="content scaffold-create" role="main">
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
    <g:form url="[resource:practicaInstance, action:'updateModulo']" >
        <fieldset class="form">



            <div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'obrasocial', 'error')} ">
                <label for="obrasocial">
                    <g:message code="practica.obrasocial.label" default="Obrasocial" />

                </label>

                <g:textField name="nombreOS" readonly="true" value="${practicaInstance?.obrasocial?.toString()}" />

                <g:hiddenField name="obrasocial.id" value="${practicaInstance?.obrasocial?.id}"/>


            </div>

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
                <g:field type="number" step="any" name="valorHonorarioModulo" id="valorHonorario"  value="${valorPracticaInstance?.valorHonorarioModulo}"/>

            </div>

            <div class="fieldcontain ">
                <label for="valorGasto">
                    <g:message code="practica.observacion.label" default="Valor Gasto" />

                </label>
                <g:field type="number" step="any" name="valorGastoModulo" id="valorGastoModulo"  value="${valorPracticaInstance?.valorGastoModulo}"/>

            </div>


            <div class="nav" role="navigation">
                <ul>

                    <li><g:link class="create" controller="practicaModulo" action="create" id="${planConvenioInstance?.id}" params="[valorPractica:valorPracticaInstance?.id,modulo:practicaInstance?.id]" ><g:message code="convenio.asociarpracticamodulo" /></g:link></li>
                </ul>
            </div>
            <table>
                <tr><td>Practica</td>
                    <td>Valor Gasto</td>
                    <td>Valor Anestesista</td>
                    <td>Valor Ayudante</td>
                    <td>Valor Especialista</td>
                <td></td>
                    <td></td>
                </tr>
                <g:each in="${practicaInstance?.practicasModulos}" var="practicaM">
                    <tr>

                        <td>
                       ${practicaM?.practica?.toString()}
                       </td>
                        <td>${practicaM?.valorGasto}
                            </td>
                        <td>${practicaM?.valorAnestecista}
                        </td>
                        <td>${practicaM?.valorAyudante}
                        </td>
                        <td>${practicaM?.valorEspecialista}
                        </td>
                        <td><g:link class="linkEdit"  controller="practicaModulo" action="edit" id="${practicaM?.id}" params="[valorPractica: valorPracticaInstance?.id]" >${message(code: 'default.button.edit.label')}</g:link></td>

                      <!--  <td><g:link class="linkShow" controller="practicaModulo" action="show" id="${practicaM?.id}">${message(code: 'default.button.show.label')}</g:link></td>-->
                    </tr>
                </g:each>
            </table>





            <g:hiddenField name="planConvenio" value="${planConvenioInstance?.id}"/>

            <g:hiddenField name="valorPractica" value="${valorPracticaInstance?.id}"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.edit.label', default: 'Editar')}" />
        </fieldset>
    </g:form>



</div>
</body>
</html>