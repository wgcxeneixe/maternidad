<%@ page import="maternidad.TipoGasto" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'valorGalenoGasto.label', default: 'ValorGalenoGasto')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-valorGalenoGasto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-valorGalenoGasto" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${valorGalenoGastoInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${valorGalenoGastoInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:valorGalenoGastoInstance, action:'save']" >
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
                    <th>Tipo de Gasto</th>
                    <th> Valor </th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${TipoGasto.list() }" status="i" var="gasto">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                        <td> <g:checkBox name="gastos"  value="${gasto?.id}"  checked="${gasto?.id in planConvenio?.valoresGalenoGasto?.tipoGasto?.id}"   ></g:checkBox></td>

                        <td> ${gasto?.sigla+" - "+gasto?.descripcion} </td>

                         <td>
                            <g:textField name="${'valor'+gasto?.id}"    value="${ gasto?.id in planConvenio?.valoresGalenoGasto?.tipoGasto?.id ? maternidad.ValorGalenoGasto.findByPlanConvenioAndTipoGasto(planConvenio,gasto)?.valor:'0'}" />  </td>
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