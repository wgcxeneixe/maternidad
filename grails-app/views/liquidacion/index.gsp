<%@ page import="maternidad.Liquidacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'liquidacion.label', default: 'Liquidacion')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-liquidacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="list-liquidacion" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="filters">
        <g:form action="index">

            <table >
                <tr>
                    <td> <p><label for="planilla">Planilla</label>
                        <g:field type="number" only-num="" name="planilla" value="${filters?.planilla}" /></p></td>
                    <td>
                        <p><label for="profesional">Profesional</label>
                            <g:select id="profesional" name="profesional" from="${maternidad.Profesional.list()}" optionKey="id"  value="${filters.profesional}" noSelection="['':'']"/>
                        </p></td>

                    <td> <p><label for="periodo">Periodo</label>
                        <g:textField  name="periodo" value="${filters?.periodo}" /></p></td>

                    <td>
                        <p><g:submitButton name="filter" value="Filtrar" /></p></td>

                </tr>

            </table>


        </g:form>
    </div>

    <br />
    <div id="grid">
        <g:render template="grilla" model="model" />
    </div>
    <br />
</div>

<script>
    $(function() {

        //idioma de los calendar
        jQuery.datepicker.regional[ "es" ];
        updateDatePicker();

        jQuery("#spinner").ajaxComplete(function (event, request, settings) {
            updateDatePicker();
        });

        jQuery("#profesional").select2({allowClear: true,width: 'resolve'});


    })

</script>
</body>
</html>
