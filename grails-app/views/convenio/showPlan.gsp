<%@ page import="maternidad.Plan" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-plan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
    <!--    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>  -->
    </ul>
</div>
<div id="show-plan" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list plan">

        <g:if test="${planConvenio?.plan?.nombre}">
            <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="plan.nombre.label" default="Nombre" /></span>

                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${planConvenio?.plan}" field="nombre"/></span>

            </li>
        </g:if>

        <g:if test="${planConvenio?.plan?.codigo}">
            <li class="fieldcontain">
                <span id="codigo-label" class="property-label"><g:message code="plan.codigo.label" default="Codigo" /></span>

                <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${planConvenio?.plan}" field="codigo"/></span>

            </li>
        </g:if>

        <g:if test="${planConvenio?.plan?.observacion}">
            <li class="fieldcontain">
                <span id="observacion-label" class="property-label"><g:message code="plan.observacion.label" default="Observacion" /></span>

                <span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${planConvenio?.plan}" field="observacion"/></span>

            </li>
        </g:if>

        <g:if test="${planConvenio?.plan?.obrasocial}">
            <li class="fieldcontain">
                <span id="obrasocial-label" class="property-label"><g:message code="plan.obrasocial.label" default="Obrasocial" /></span>

                <span class="property-value" aria-labelledby="obrasocial-label"><g:link controller="obraSocial" action="show" id="${planConvenio?.plan?.obrasocial?.id}">${planConvenio?.plan?.obrasocial?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${planConvenio?.plan?.activo}">
            <li class="fieldcontain">
                <span id="activo-label" class="property-label"><g:message code="plan.activo.label" default="Activo" /></span>

                <span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></span>

            </li>
        </g:if>


    </ol>

    <br/>

<g:render  template="/valorGalenoGasto/showValorGalenoGasto" model="[planConvenio: planConvenio]" />

    <br/>

    <g:render  template="/valorGalenoHonorario/showValorGalenoHonorario" model="[planConvenio: planConvenio]" />
<br/>
${message(code: 'convenio.modulosdelplan')}
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="nombre" title="${message(code: 'practica.nombre.label', default: 'Nombre')}" />

            <g:sortableColumn property="codigo" title="${message(code: 'practica.codigo.label', default: 'Codigo')}" />

            <g:sortableColumn property="observacion" title="${message(code: 'practica.observacion.label', default: 'Observacion')}" />



        </tr>
        </thead>
        <tbody>
        <g:each in="${maternidad.ValorPractica.createCriteria().list {  planConvenio{eq('id',planConvenio?.id)}
            practica{eq('modulo',true)}}}" status="i" var="valor">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${valor?.practica?.nombre}</td>

                <td>${valor?.practica?.codigo}</td>

                <td> ${ (valor?.practica?.observacion?.size()>=50)? valor?.practica?.observacion?.substring(0,50) +' ...':valor?.practica?.observacion}</td>



            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${maternidad.ValorPractica.createCriteria().list {  planConvenio{eq('id',planConvenio?.id)}
            practica{eq('modulo',true)}}.size() ?: 0}" />
    </div>

    ${message(code: 'convenio.cuentacorrientePlan')}
    <table>
        <tbody>

        <tr id="filaoculta" class="prop">
            <td valign="top" class="name">
                <label for="plan">Plan</label>
            </td>
            <td valign="top" class="value ">
                <g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id"  noSelection="['null':'Seleccione un Plan']"
                          onchange="${remoteFunction(controller: 'movimientoPlan',
                                  action: 'getmovimientosPlan',
                                  params: '\'idPlan=\' + this.value',
                                  update: 'divplan')}"
                />
            </td>
        </tr>
        <tr class="prop">
            <td></td>
            <td><div id="divplan">
                <g:render  template="/movimientoPlan/movimientos"
                           model="[movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: movimientos?.size(), total: total]"    />
            </div>
            </td>
        </tr>



        </tbody>
    </table>


    <g:form url="[resource:planConvenio?.plan, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" controller="convenio" action="editPlan" id="${planConvenio?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>

</div>

<script>
    $(function() {

        $('#plan').change(function(e){

            $("#plan").val('${planConvenio?.plan?.id}');
            //$("#plan").prop("disabled", true);
            $("#filaoculta").hide();
        });

        // And now fire change event when the DOM is ready
        $('#plan').trigger('change');

        // $("#obrasocial").attr('readonly',true).select2({allowClear: true});
        $("#obrasocial").attr('readonly',true);

    })

</script>


</body>
</html>