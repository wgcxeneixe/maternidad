
<%@ page import="maternidad.DetalleCaja" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleCaja.label', default: 'DetalleCaja')}" />
		<title><g:message code="detalleCaja.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleCaja" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="create" action="create"><g:message code="detalleCaja.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleCaja" class="content scaffold-list" role="main">
			<h1><g:message code="detalleCaja.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="filters">
                <g:form action="index">
                    <table>
                        <tr>
                            <td> <p><label for="caja">Caja</label>
                                <g:select id="caja" name="caja" from="${maternidad.CajaDiaria.list()}" optionKey="id"  value="${filters?.caja}" noSelection="['':'']"/>
                                </p></td>
                            <td> <p><label for="fechaDesde">Desde</label>
                                <g:datePicker name="fechaDesde" precision="day"  value="${(filters?.fechaDesde)?new java.text.SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US).parse(filters?.fechaDesde.toString() ):(new Date())}" default="${new Date() -365}" format="EEE MMM dd HH:mm:ss z yyyy" /></p></td>
                            <td> <p><label for="fechaHasta">Hasta</label>
                                <g:datePicker name="fechaHasta" precision="day"  value="${(filters?.fechaHasta)?new java.text.SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US).parse(filters?.fechaHasta.toString() ):(new Date())}" format="EEE MMM dd HH:mm:ss z yyyy" /></p></td>
<td>
                            <p><g:submitButton name="filter" value="Filtrar" /></p></td>
                        </tr>
                    </table>

                    <g:hiddenField name="filtrar" id="filtrar" value="true" />

                </g:form>
            </div>

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

            jQuery("#caja").select2({allowClear: true,width: 'resolve'});


        })

    </script>

	</body>
</html>
