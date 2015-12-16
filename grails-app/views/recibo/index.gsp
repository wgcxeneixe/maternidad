
<%@ page import="maternidad.ReciboMaternidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recibo.label', default: 'Recibo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

		<script>

			jQuery(function() {

				jQuery("body").on('click','.pagination a', function(event) {
					event.preventDefault();
					var url = jQuery(this).attr('href');

					var grid = jQuery(this).parents("table.ajax");
					jQuery(grid).html(jQuery("#spinner").html());

					jQuery.ajax({
						type: 'GET',
						url: url,
						success: function(data) {
							grid=jQuery("#grid");
							jQuery(grid).fadeOut('fast', function() {jQuery(this).html(data).fadeIn('slow');});
						}
					})
				});
				//setupFilterAjax();
				jQuery('div.filters :input[type=checkbox],:input[type=radio]').change(function() {
					var filterBox = jQuery(this).parents("div.filters");
					filterGrid(filterBox);
				});
				jQuery('div.filters :input').keyup(function() {
					var filterBox = jQuery(this).parents("div.filters");
					filterGrid(filterBox);
				});
				jQuery("div.filters form").submit(function() {
					var filterBox = jQuery(this).parents("div.filters");
					filterGrid(filterBox);
					return false;
				});


			})

		</script>



	</head>
	<body>
		<a href="#list-recibo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recibo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="filters">
				<g:form action="index">

					<table >
						<tr>
							<td> <p><label for="nro">Nº Recibo</label>
								<g:field type="number" only-num="" name="nro" value="${filters?.nro}" /></p></td>
							<td>
								<p><label for="profesional">Profesional</label>
									<g:select id="profesional" name="profesional" from="${maternidad.Profesional?.list()}" optionKey="id"  value="" noSelection="['':'']"/>
								</p></td>
						</tr>

						<tr>
							<td> <p><label for="fechaDesde">Desde</label>
								<g:datePicker name="fechaDesde" precision="day"  value="${filters?.fechaDesde}" format="dd-MM-yyyy" /></p></td>
							<td> <p><label for="fechaHasta">Hasta</label>
								<g:datePicker name="fechaHasta" precision="day"  value="${filters?.fechaHasta}" format="dd-MM-yyyy" /></p></td>


							<td>
								<p><g:submitButton name="filter" value="Filtrar" /></p></td>
						</tr>
					</table>




				</g:form>
			</div>

			<br />
			<div id="grid" class="grid">
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
