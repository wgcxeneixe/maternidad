<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'movimientoPlan.label', default: 'MovimientoPlan')}" />

    <script>
        $(function() {

            //idioma de los calendar
            jQuery.datepicker.regional[ "es" ];
            updateDatePicker();

            jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                updateDatePicker();
            });


            $("#plan").select2({allowClear: true});

        })

    </script>

    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-movimientoPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-movimientoPlan" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <fieldset class="form">
        <table>
            <tbody>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="plan">Plan</label>
                </td>
                <td valign="top" class="value ">
                    <g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" noSelection="['null':'Seleccione un Plan']"
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
    </fieldset>

</div>
</body>
</html>