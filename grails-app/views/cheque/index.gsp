
<%@ page import="maternidad.Cheque" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>





    </head>
	<body>
		<a href="#list-cheque" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cheque" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="filters">
                <g:form action="index">

                    <table >
                        <tr>
                            <td> <p><label for="nrocheque">Nº Cheque</label>
                                <g:field type="number" only-num="" name="nrocheque" value="${filters?.nrocheque}" /></p></td>

                            <td> <p><label for="fechaDesde">Fecha Emisión Desde</label>
                                <g:datePicker name="fechaDesde" precision="day"  value="${filters?.fechaDesde}" format="dd-MM-yyyy" /></p></td>
                            <td> <p><label for="fechaHasta">Fecha Emisión Hasta</label>
                                <g:datePicker name="fechaHasta" precision="day"  value="${filters?.fechaHasta}" format="dd-MM-yyyy" /></p></td>
</tr>
                        <tr>
                            <td>
                                <p><label for="banco">Banco</label>

                                    <g:select id="banco" name="banco" from="${maternidad.Banco.list()}" optionKey="id" value="${filters?.banco}" class="many-to-one" noSelection="['': '']"/>
                                </p><td>

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


        })

    </script>


    </body>
</html>
