
<%@ page import="maternidad.DetalleFactura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleFactura.label', default: 'DetalleFactura')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleFactura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleFactura" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleFactura">
			
				<g:if test="${detalleFacturaInstance?.practica}">
				<li class="fieldcontain">
					<span id="practica-label" class="property-label"><g:message code="detalleFactura.practica.label" default="Practica" /></span>
					
						<span class="property-value" aria-labelledby="practica-label"><g:link controller="practica" action="show" id="${detalleFacturaInstance?.practica?.id}">${detalleFacturaInstance?.practica?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.profesional}">
				<li class="fieldcontain">
					<span id="profesional-label" class="property-label"><g:message code="detalleFactura.profesional.label" default="Profesional" /></span>
					
						<span class="property-value" aria-labelledby="profesional-label"><g:link controller="profesional" action="show" id="${detalleFacturaInstance?.profesional?.id}">${detalleFacturaInstance?.profesional?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.plan}">
				<li class="fieldcontain">
					<span id="plan-label" class="property-label"><g:message code="detalleFactura.plan.label" default="Plan" /></span>
					
						<span class="property-value" aria-labelledby="plan-label"><g:link controller="plan" action="show" id="${detalleFacturaInstance?.plan?.id}">${detalleFacturaInstance?.plan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.planillaInternacion}">
				<li class="fieldcontain">
					<span id="planillaInternacion-label" class="property-label"><g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" /></span>
					
						<span class="property-value" aria-labelledby="planillaInternacion-label"><g:link controller="planillaInternacion" action="show" id="${detalleFacturaInstance?.planillaInternacion?.id}">${detalleFacturaInstance?.planillaInternacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.medicamento}">
				<li class="fieldcontain">
					<span id="medicamento-label" class="property-label"><g:message code="detalleFactura.medicamento.label" default="Medicamento" /></span>
					
						<span class="property-value" aria-labelledby="medicamento-label"><g:link controller="medicamento" action="show" id="${detalleFacturaInstance?.medicamento?.id}">${detalleFacturaInstance?.medicamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="detalleFactura.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${detalleFacturaInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.carreraMedica}">
				<li class="fieldcontain">
					<span id="carreraMedica-label" class="property-label"><g:message code="detalleFactura.carreraMedica.label" default="Carrera Medica" /></span>
					
						<span class="property-value" aria-labelledby="carreraMedica-label"><g:fieldValue bean="${detalleFacturaInstance}" field="carreraMedica"/></span>
					
				</li>
				</g:if>
			

				<g:if test="${detalleFacturaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="detalleFactura.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${detalleFacturaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.funcion}">
				<li class="fieldcontain">
					<span id="funcion-label" class="property-label"><g:message code="detalleFactura.funcion.label" default="Funcion" /></span>
					
						<span class="property-value" aria-labelledby="funcion-label"><g:fieldValue bean="${detalleFacturaInstance}" field="funcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.modulo}">
				<li class="fieldcontain">
					<span id="modulo-label" class="property-label"><g:message code="detalleFactura.modulo.label" default="Modulo" /></span>
					
						<span class="property-value" aria-labelledby="modulo-label"><g:formatBoolean boolean="${detalleFacturaInstance?.modulo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="detalleFactura.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${detalleFacturaInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.valorFijo}">
				<li class="fieldcontain">
					<span id="valorFijo-label" class="property-label"><g:message code="detalleFactura.valorFijo.label" default="Valor Fijo" /></span>
					
						<span class="property-value" aria-labelledby="valorFijo-label"><g:formatBoolean boolean="${detalleFacturaInstance?.valorFijo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.valorGastos}">
				<li class="fieldcontain">
					<span id="valorGastos-label" class="property-label"><g:message code="detalleFactura.valorGastos.label" default="Valor Gastos" /></span>
					
						<span class="property-value" aria-labelledby="valorGastos-label"><g:fieldValue bean="${detalleFacturaInstance}" field="valorGastos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.valorHonorarios}">
				<li class="fieldcontain">
					<span id="valorHonorarios-label" class="property-label"><g:message code="detalleFactura.valorHonorarios.label" default="Valor Honorarios" /></span>
					
						<span class="property-value" aria-labelledby="valorHonorarios-label"><g:fieldValue bean="${detalleFacturaInstance}" field="valorHonorarios"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.valorMedicamento}">
				<li class="fieldcontain">
					<span id="valorMedicamento-label" class="property-label"><g:message code="detalleFactura.valorMedicamento.label" default="Valor Medicamento" /></span>
					
						<span class="property-value" aria-labelledby="valorMedicamento-label"><g:fieldValue bean="${detalleFacturaInstance}" field="valorMedicamento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFacturaInstance?.valorPractica}">
				<li class="fieldcontain">
					<span id="valorPractica-label" class="property-label"><g:message code="detalleFactura.valorPractica.label" default="Valor Practica" /></span>
					
						<span class="property-value" aria-labelledby="valorPractica-label"><g:fieldValue bean="${detalleFacturaInstance}" field="valorPractica"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:detalleFacturaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${detalleFacturaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
