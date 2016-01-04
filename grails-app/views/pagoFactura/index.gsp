
<%@ page import="maternidad.PagoFactura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagoFactura.label', default: 'PagoFactura')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pagoFactura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" controller="factura" action="abrirPagarFactura"><g:message code="default.new.label" args="[entityName]" /></g:link></li>-->
			</ul>
		</div>
		<div id="list-pagoFactura" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>


			<div class="filters">
				<g:form action="index">

					<table >
						<tr>
							<td> <p><label for="factura">Factura</label>
								<g:select id="factura" name="factura" from="${maternidad.Factura.list()}" optionKey="id"  value="" noSelection="['':'']"/></p></td>
							<td>
								<p><label for="plan">Plan</label>
									<g:select id="plan" name="plan" from="${maternidad.Plan.list()}" optionKey="id"  value="" noSelection="['':'']"/>
								</p></td>
						</tr>

						<tr>
							<td> <p><label for="fechaDesde">Desde</label>
								<g:datePicker name="fechaDesde" precision="day"  value="${(filters?.fechaDesde)?new java.text.SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US).parse(filters?.fechaDesde.toString() ):(new Date())}" default="${new Date() -365}" format="EEE MMM dd HH:mm:ss z yyyy" /></p></td>
							<td> <p><label for="fechaHasta">Hasta</label>
								<g:datePicker name="fechaHasta" precision="day"  value="${(filters?.fechaHasta)?new java.text.SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US).parse(filters?.fechaHasta.toString() ):(new Date())}" default="${new Date()}" format="EEE MMM dd HH:mm:ss z yyyy" /></p></td>

							<td> <p><label for="periodo">Periodo</label>
								<g:textField  name="periodo" value="${filters?.periodo}" /></p></td>

							<td>
								<p><g:submitButton name="filter" value="Filtrar" /></p></td>
						</tr>
					</table>

					<g:hiddenField name="filtrar" id="filtrar" value="true" />


				</g:form>
			</div>

			<br />
			<div id="grid">
				<g:render template="grilla" model="model" />
			</div>
			<br />


			<script>
				$(function() {

					//idioma de los calendar
					jQuery.datepicker.regional[ "es" ];
					updateDatePicker();

					jQuery("#spinner").ajaxComplete(function (event, request, settings) {
						updateDatePicker();
					});

					jQuery("#plan").select2({allowClear: true,width: 'resolve'});
					jQuery("#factura").select2({allowClear: true,width: 'resolve'});

				})

			</script>

		</div>
	</body>
</html>
