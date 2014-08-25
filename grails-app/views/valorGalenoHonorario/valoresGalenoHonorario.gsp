<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'valorGalenoHonorario.label', default: 'ValorGalenoHonorario')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-valorGalenoHonorario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-valorGalenoHonorario" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${valorGalenoHonorarioInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${valorGalenoHonorarioInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:valorGalenoHonorarioInstance, action:'save']" >
        <fieldset class="form">

            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="convenio">Convenio</label>
                    </td>
                    <td valign="top" class="value ">
                        <g:hiddenField   name="planConvenio" value="${planConvenio?.id}" />
                        <g:textField readonly="true" id="convenio" name="convenio" value="${planConvenio?.convenio?.encodeAsHTML()}" />
                    </td>
                </tr>




                </tbody>
            </table>


            <table>
                <thead>
                <tr>
                    <th>  </th>
                    <th>Tipo de Honorario</th>
                    <th> Valor </th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${maternidad.TipoHonorario.list() }" status="i" var="honorario">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                        <td> <g:checkBox name="honorarios"  value="${honorario?.id}"  checked="${honorario?.id in planConvenio?.valoresGalenoHonorario?.tipoHonorario?.id}"   ></g:checkBox></td>

                        <td>${honorario?.sigla+" - "+honorario?.descripcion}
                             </td>

                        <td>
                            <g:textField name="${'valor'+honorario?.id}"    value="${ honorario?.id in planConvenio?.valoresGalenoHonorario?.tipoHonorario?.id ? maternidad.ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio,honorario)?.valor:'0'}" />  </td>
                    </tr>
                </g:each>
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