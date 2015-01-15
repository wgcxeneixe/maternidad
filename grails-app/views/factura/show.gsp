
<%@ page import="maternidad.Factura" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-factura" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list factura">
			
				<g:if test="${facturaInstance?.anulada}">
				<li class="fieldcontain">
					<span id="anulada-label" class="property-label"><g:message code="factura.anulada.label" default="Anulada" /></span>
					
						<span class="property-value" aria-labelledby="anulada-label"><g:formatBoolean boolean="${facturaInstance?.anulada}" /></span>
					
				</li>
				</g:if>
			



				<g:if test="${facturaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="factura.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${facturaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.nrofactura}">
				<li class="fieldcontain">
					<span id="nrofactura-label" class="property-label"><g:message code="factura.nrofactura.label" default="Nrofactura" /></span>
					
						<span class="property-value" aria-labelledby="nrofactura-label"><g:fieldValue bean="${facturaInstance}" field="nrofactura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.pagoCompleto}">
				<li class="fieldcontain">
					<span id="pagoCompleto-label" class="property-label"><g:message code="factura.pagoCompleto.label" default="Pago Completo" /></span>
					
						<span class="property-value" aria-labelledby="pagoCompleto-label"><g:formatBoolean boolean="${facturaInstance?.pagoCompleto}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.pagosFactura}">
				<li class="fieldcontain">
					<span id="pagosFactura-label" class="property-label"><g:message code="factura.pagosFactura.label" default="Pagos Factura" /></span>
					
						<g:each in="${facturaInstance.pagosFactura}" var="p">
						<span class="property-value" aria-labelledby="pagosFactura-label"><g:link controller="pagoFactura" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.periodo}">
				<li class="fieldcontain">
					<span id="periodo-label" class="property-label"><g:message code="factura.periodo.label" default="Periodo" /></span>
					
						<span class="property-value" aria-labelledby="periodo-label"><g:fieldValue bean="${facturaInstance}" field="periodo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.plan}">
				<li class="fieldcontain">
					<span id="plan-label" class="property-label"><g:message code="factura.plan.label" default="Plan" /></span>
					
						<span class="property-value" aria-labelledby="plan-label"><g:link controller="plan" action="show" id="${facturaInstance?.plan?.id}">${facturaInstance?.plan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.totalFacturado}">
				<li class="fieldcontain">
					<span id="totalFacturado-label" class="property-label"><g:message code="factura.totalFacturado.label" default="Total Facturado" /></span>
					
						<span class="property-value" aria-labelledby="totalFacturado-label"><g:fieldValue bean="${facturaInstance}" field="totalFacturado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${facturaInstance?.totalPagado}">
				<li class="fieldcontain">
					<span id="totalPagado-label" class="property-label"><g:message code="factura.totalPagado.label" default="Total Pagado" /></span>
					
						<span class="property-value" aria-labelledby="totalPagado-label"><g:fieldValue bean="${facturaInstance}" field="totalPagado"/></span>
					
				</li>
				</g:if>




			</ol>


            <table>
            <tr></tr>
            </table>

			<g:form url="[resource:facturaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${facturaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
