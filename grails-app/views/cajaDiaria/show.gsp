
<%@ page import="maternidad.CajaDiaria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cajaDiaria.label', default: 'CajaDiaria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cajaDiaria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index"><g:message code="cajaDiaria.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="list" action="create" controller="detalleCaja"><g:message code="detalleCaja.create.label" default="Nueva transacción" args="[entityName]" /></g:link></li>
				<!--
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				-->
			</ul>
		</div>
		<div id="show-cajaDiaria" class="content scaffold-show" role="main">
			<h1><g:message code="cajaDiaria.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cajaDiaria">
			
				<g:if test="${cajaDiariaInstance?.fechaApertura}">
				<li class="fieldcontain">
					<span id="fechaApertura-label" class="property-label"><g:message code="cajaDiaria.fechaApertura.label" default="Fecha Apertura" /></span>
					
						<span class="property-value" aria-labelledby="fechaApertura-label">
                            <g:formatDate type="datetime" readonly="readonly" style="LONG" timeStyle="SHORT" name="fechaApertura" precision="minute"  date="${cajaDiariaInstance?.fechaApertura}"  />
                        </span>
					
				</li>
				</g:if>
			
				<g:if test="${cajaDiariaInstance?.fechaCierre}">
				<li class="fieldcontain">
					<span id="fechaCierre-label" class="property-label"><g:message code="cajaDiaria.fechaCierre.label" default="Fecha Cierre" /></span>
					
						<span class="property-value" aria-labelledby="fechaCierre-label">
                            <g:formatDate type="datetime" readonly="readonly" style="LONG" timeStyle="SHORT" name="fechaApertura" precision="minute"  date="${cajaDiariaInstance?.fechaCierre}"  />
                        </span>
					
				</li>
				</g:if>
			
				<g:if test="${cajaDiariaInstance?.saldoInicial}">
				<li class="fieldcontain">
					<span id="saldoInicial-label" class="property-label"><g:message code="cajaDiaria.saldoInicial.label" default="Saldo Inicial" /></span>
					
						<span class="property-value" aria-labelledby="saldoInicial-label"><g:fieldValue bean="${cajaDiariaInstance}" field="saldoInicial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cajaDiariaInstance?.saldoFinal}">
				<li class="fieldcontain">
					<span id="saldoFinal-label" class="property-label"><g:message code="cajaDiaria.saldoFinal.label" default="Saldo Final" /></span>
					
						<span class="property-value" aria-labelledby="saldoFinal-label"><g:fieldValue bean="${cajaDiariaInstance}" field="saldoFinal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cajaDiariaInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="cajaDiaria.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${cajaDiariaInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cajaDiariaInstance?.usuarioApertura}">
				<li class="fieldcontain">
					<span id="usuarioApertura-label" class="property-label"><g:message code="cajaDiaria.usuarioApertura.label" default="Usuario Apertura" /></span>
					
						<span class="property-value" aria-labelledby="usuarioApertura-label">
                                      ${cajaDiariaInstance?.usuarioApertura?.encodeAsHTML()}
                        </span>
					
				</li>
				</g:if>
			
				<g:if test="${cajaDiariaInstance?.usuarioCierre}">
				<li class="fieldcontain">
					<span id="usuarioCierre-label" class="property-label"><g:message code="cajaDiaria.usuarioCierre.label" default="Usuario Cierre" /></span>
					
						<span class="property-value" aria-labelledby="usuarioCierre-label">${cajaDiariaInstance?.usuarioCierre?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${cajaDiariaInstance?.detallesCaja}">
                    <g:render template="lista"/>
				</g:if>
			
			</ol>
			<g:form url="[resource:cajaDiariaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${cajaDiariaInstance}"><g:message code="default.button.editar.label" default="Edit" /></g:link>
					<!--
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				    -->
                </fieldset>
			</g:form>
		</div>
	</body>
</html>
