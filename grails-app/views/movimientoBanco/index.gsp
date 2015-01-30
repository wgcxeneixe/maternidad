
<%@ page import="maternidad.MovimientoBanco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoBanco.label', default: 'MovimientoBanco')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

        <script>
            jQuery(function() {


                jQuery.datepicker.regional[ "es" ];
                updateDatePicker();

                jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                    updateDatePicker();
                });





            })
        </script>


	</head>
	<body>
		<a href="#list-movimientoBanco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-movimientoBanco" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>


            <div class="filters">
                <g:form  action="index">

                    <table>
                        <tr>
                            <td> <p><label for="fechaDesde">Fecha Desde</label>
                                <g:datePicker name="fechaDesde" precision="day" value="${filters?.fechaDesde}" /></p></td>

                            <td> <p><label for="fechaHasta">Fecha Hasta</label>
                                <g:datePicker name="fechaHasta" precision="day" value="${filters?.fechaHasta}" /></p></td>


                            <td>
                                <p><label for="banco">Banco</label>

                            <g:select id="banco" name="banco" from="${maternidad.Banco.list()}" optionKey="id" value="${filters?.banco}" class="many-to-one" noSelection="['': '']"/>
                                </p>
                        </tr>
                        <tr>
                            <td>
                                <p><label for="concepto">Concepto</label>

                            <g:select id="concepto" name="concepto" from="${maternidad.ConceptoBanco.list()}" optionKey="id" value="${filters?.concepto}" class="many-to-one" noSelection="['': '']"/>
                                </p>
                            <td>
                                <p><label for="tipoPago">Tipo Pago</label>

                            <g:select id="tipoPago" name="tipoPago" from="${maternidad.TipoPago.list()}" optionKey="id" value="${filters?.tipoPago}" class="many-to-one" noSelection="['': '']"/>
                        </p>

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
	</body>
</html>
