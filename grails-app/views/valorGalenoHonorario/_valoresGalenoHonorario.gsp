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
   <!-- <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul> -->
</div>
<div id="create-valorGalenoHonorario" class="content scaffold-create" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>


    <g:form url="[resource:valorGalenoHonorarioInstance, action:'saveValorGalenoHonorario']" >
        <fieldset class="form">
            <g:hiddenField   name="planConvenio" value="${planConvenio?.id}" />



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