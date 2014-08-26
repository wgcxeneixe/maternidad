
<%@ page import="maternidad.MovimientoStock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoStock.label', default: 'MovimientoStock')}" />

        <script>
            jQuery(function() {


                jQuery.datepicker.regional[ "es" ];
                updateDatePicker();

                jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                    updateDatePicker();
                });





            })
        </script>

			<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movimientoStock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="stock">Stock</g:link></li>
			</ul>
		</div>
		<div id="list-movimientoStock" class="content scaffold-list" role="main">
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
                                <p><label for="codigo">Código</label>
                                    <g:textField name="codigo" value="${filters?.codigo}" /></p></td>

                            <td>
                                <p><label for="nombre">Nombre Producto</label>
                                    <g:textField id="nombre" name="nombre" value="${filters?.nombre}" /></p></td>

                            </tr>
                            <tr>
                            <td>
                                <p><label for="nombreDestino">Nombre Destino</label>
                                    <g:textField id="nombreDestino" name="nombreDestino" value="${filters?.nombreDestino}" /></p></td>

                            <td>
                                <p><label for="codigoDestino">Codigo Destino</label>
                                    <g:textField id="codigoDestino" name="codigoDestino" value="${filters?.codigoDestino}" /></p></td>
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
