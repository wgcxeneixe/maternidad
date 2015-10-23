<%@ page import="maternidad.PlanillaInternacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planillaInternacion.label', default: 'PlanillaInternacion')}"/>
    <title>Planillas Por Período</title>
</head>

<body>
<a href="#list-planillaInternacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="create" action="buscapaciente"><g:message code="planillaInternacion.new.label"
                                                                     args="[entityName]"/></g:link></li>



    </ul>
</div>


<div class="filters">
    <g:form action="planillasPorPeriodo">

        <table>

            <tr>
                <td>
                    <p><label for="periodo">Periodo</label>
                        <g:textField name="periodo" value="${filters?.periodo}"/></p></td>
                <td colspan="5"><p><label for="plan">Obra Social/Plan</label>
                    <g:select id="plan" name="plan" from="${maternidad.Plan.list()}" optionKey="id"
                              value="${filters?.plan? Long.valueOf(filters?.plan):''}" noSelection="['': '']"/></p></td>
                <td>

                <td>
                    <p><br><g:submitButton name="filter" value="Filtrar"/></p></td>
            </tr>
        </table>

    </g:form>
</div>


<br />
<div id="grid">
    <g:render template="listaPeriodo" model="model" />
</div>
<br />



<script>
    jQuery(function () {

        jQuery("#plan").select2({allowClear: true});
    });




</script>

</body>
</html>
