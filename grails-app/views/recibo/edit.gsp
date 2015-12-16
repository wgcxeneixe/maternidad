<%@ page import="maternidad.ReciboMaternidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recibo.label', default: 'Recibo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>

		<script>
			jQuery(function() {
				var dialog, form,



						valor =jQuery( "#valorDetalle" ),concepto=jQuery( "#concepto" ),
						allFields = jQuery( [] ).add( valor).add(concepto),
						tips = jQuery( ".validateTips" );

				function updateTips( t ) {
					tips
							.text( t )
							.addClass( "ui-state-highlight" );
					setTimeout(function() {
						tips.removeClass( "ui-state-highlight", 1500 );
					}, 500 );
				}

				function checkLength( o, n, min, max ) {
					if ( o.val().length > max || o.val().length < min ) {
						o.addClass( "ui-state-error" );
						updateTips( "Longitud de " + n + " debe estar entre " +
								min + " and " + max + "." );
						return false;
					} else {
						return true;
					}
				}



				function add() {
					var valid = true;
					allFields.removeClass( "ui-state-error" );

					valid = valid && checkLength( valor, "valor", 1, 16 );
					valid = valid && checkLength( concepto, "concepto", 1, 4 );
					if ( valid ) {
						jQuery("#formAgregarDetalle").submit();
						dialog.dialog( "close" );
					}
					return valid;
				}

				dialog = jQuery( "#dialog-form" ).dialog({
					autoOpen: false,
					height: 300,
					width: 350,
					modal: true,
					buttons: {
						"Agregar Detalle": add,
						Cancel: function() {
							dialog.dialog( "close" );
						}
					},
					close: function() {
						//jQuery("#formAgregarDetalle").reset();
						allFields.removeClass( "ui-state-error" );
					}
				});

				/*form = dialog.find( "form" ).on( "submit", function( event ) {
					event.preventDefault();
					add();
				});*/

				jQuery( "#agregar" ).on( "click", function(e) {
					e.preventDefault();
					dialog.dialog( "open" );
				});
			});
		</script>

	</head>
	<br>
		<a href="#edit-recibo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-recibo" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${reciboInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${reciboInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:reciboInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${reciboInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
</br>
<a href="#" name="agregar"  id="agregar">Agregar Detalle</a>

</br>
	<div id="list-detalleRecibo" class="content scaffold-list" role="main">
		<h1>Lista de Detalles</h1>
		<table>
			<thead>
			<tr>

				<th><g:message code="detalleRecibo.conceptoProfesional.label" default="Concepto Profesional" /></th>

				<g:sortableColumn property="valor" title="${message(code: 'detalleRecibo.valor.label', default: 'Valor')}" />

				<g:sortableColumn property="debitoCredito" title="${message(code: 'detalleRecibo.debitoCredito.label', default: 'Debito Credito')}" />
				<th></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${reciboInstance?.detalle}" status="i" var="detalleReciboInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					<td><g:link action="show" id="${detalleReciboInstance.id}">${fieldValue(bean: detalleReciboInstance, field: "conceptoProfesional")}</g:link></td>

					<td>${fieldValue(bean: detalleReciboInstance, field: "valor")}</td>

					<td><g:formatBoolean boolean="${detalleReciboInstance.debitoCredito}" /></td>
                    <td>  <g:link action="editarDetalle" params="[idRecibo:reciboInstance.id,idDetalle:detalleReciboInstance.id]">Editar</g:link> </td>
				<td><g:link action="eliminarDetalle" params="[idRecibo:reciboInstance.id,idDetalle:detalleReciboInstance.id]">Eliminar</g:link></td>
				</tr>
			</g:each>
			</tbody>
		</table>

	</div>

</br>

<g:link action="imprimirRecibo" id="${reciboInstance.id}">Imprimir</g:link>


<div id="dialog-form" title="Agregar Detalle">
	<p class="validateTips">Todos los campos son requeridos.</p>

	<form id="formAgregarDetalle" action="${createLink(action: "agregarDetalle")}">
		<fieldset>
			<g:hiddenField name="recibo" value="${reciboInstance?.id}"/>
			<label for="concepto">Concepto Profesional</label>
			<g:select id="concepto" name="concepto" from="${maternidad.ConceptoProfesional.findAllByActivo(Boolean.TRUE)}" required="true"
					  optionKey="id" optionValue="nombre"
					  noSelection="${['': 'Seleccione una Opción...']}" />
			<label >Débito</label><g:radio name="debitocredito" value="debito"/>
			<label >Crédito</label><g:radio name="debitocredito" value="credito" checked="true"/></br>
			<label for="valorDetalle">Valor</label>
			<g:field type="number" step="any"  name="valorDetalle"  required="true"/>

			<!-- Allow form submission with keyboard without duplicating the dialog button -->
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
		</fieldset>
	</form>
</div>


	<script>
		jQuery(function() {

			//idioma de los calendar
			jQuery.datepicker.regional[ "es" ];
			updateDatePicker();

			jQuery("#spinner").ajaxComplete(function (event, request, settings) {
				updateDatePicker();
			});

			jQuery("#profesional").select2({allowClear: true});


		})

	</script>
	</body>
</html>
