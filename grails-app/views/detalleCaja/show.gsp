
<%@ page import="maternidad.DetalleCaja" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleCaja.label', default: 'DetalleCaja')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleCaja" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="detalleCaja.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleCaja" class="content scaffold-show" role="main">
			<h1><g:message code="detalleCaja.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleCaja">

                <g:if test="${detalleCajaInstance?.id}">
                    <li class="fieldcontain">
                        <span id="id-label" class="property-label"><g:message code="detalleCaja.id.label" default="#" /></span>
                        <span class="property-value" aria-labelledby="id-label">${detalleCajaInstance?.id?.encodeAsHTML()}</span>

                    </li>
                </g:if>

				<g:if test="${detalleCajaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="detalleCaja.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label">
                            <g:formatDate type="datetime" dateStyle="MEDIUM" timeStyle="SHORT" date="${detalleCajaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCajaInstance?.planillainternacion}">
				<li class="fieldcontain">
					<span id="planillainternacion-label" class="property-label"><g:message code="detalleCaja.planillainternacion.label" default="Planillainternacion" /></span>
					
						<span class="property-value" aria-labelledby="planillainternacion-label">
                            ${detalleCajaInstance?.planillainternacion?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCajaInstance?.conceptocaja}">
				<li class="fieldcontain">
					<span id="conceptocaja-label" class="property-label"><g:message code="detalleCaja.conceptocaja.label" default="Conceptocaja" /></span>
					
						<span class="property-value" aria-labelledby="conceptocaja-label">
                            ${detalleCajaInstance?.conceptocaja?.encodeAsHTML()}
                        </span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCajaInstance?.credito}">
				<li class="fieldcontain">
					<span id="credito-label" class="property-label"><g:message code="detalleCaja.credito.label" default="Credito" /></span>
					
						<span class="property-value" aria-labelledby="credito-label">
                            <g:formatBoolean boolean="${detalleCajaInstance?.credito}" true="Crédito" false="Débito" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCajaInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="detalleCaja.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${detalleCajaInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCajaInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="detalleCaja.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${detalleCajaInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCajaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="detalleCaja.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label">
                            ${detalleCajaInstance?.usuario?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCajaInstance?.caja}">
				<li class="fieldcontain">
					<span id="caja-label" class="property-label"><g:message code="detalleCaja.caja.label" default="Caja" /></span>
					
						<span class="property-value" aria-labelledby="caja-label">
                            ${detalleCajaInstance?.caja?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:detalleCajaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${detalleCajaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
