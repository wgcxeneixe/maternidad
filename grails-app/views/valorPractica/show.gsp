
<%@ page import="maternidad.ValorPractica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'valorPractica.label', default: 'ValorPractica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-valorPractica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-valorPractica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list valorPractica">
			
				<g:if test="${valorPracticaInstance?.valorGasto}">
				<li class="fieldcontain">
					<span id="valorGasto-label" class="property-label"><g:message code="valorPractica.valorGasto.label" default="Valor Gasto" /></span>
					
						<span class="property-value" aria-labelledby="valorGasto-label"><g:fieldValue bean="${valorPracticaInstance}" field="valorGasto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.valorHonorario}">
				<li class="fieldcontain">
					<span id="valorHonorario-label" class="property-label"><g:message code="valorPractica.valorHonorario.label" default="Valor Honorario" /></span>
					
						<span class="property-value" aria-labelledby="valorHonorario-label"><g:fieldValue bean="${valorPracticaInstance}" field="valorHonorario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.valorAnestecista}">
				<li class="fieldcontain">
					<span id="valorAnestecista-label" class="property-label"><g:message code="valorPractica.valorAnestecista.label" default="Valor Anestecista" /></span>
					
						<span class="property-value" aria-labelledby="valorAnestecista-label"><g:fieldValue bean="${valorPracticaInstance}" field="valorAnestecista"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.valorAyudante}">
				<li class="fieldcontain">
					<span id="valorAyudante-label" class="property-label"><g:message code="valorPractica.valorAyudante.label" default="Valor Ayudante" /></span>
					
						<span class="property-value" aria-labelledby="valorAyudante-label"><g:fieldValue bean="${valorPracticaInstance}" field="valorAyudante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.valorEspecialista}">
				<li class="fieldcontain">
					<span id="valorEspecialista-label" class="property-label"><g:message code="valorPractica.valorEspecialista.label" default="Valor Especialista" /></span>
					
						<span class="property-value" aria-labelledby="valorEspecialista-label"><g:fieldValue bean="${valorPracticaInstance}" field="valorEspecialista"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.practica}">
				<li class="fieldcontain">
					<span id="practica-label" class="property-label"><g:message code="valorPractica.practica.label" default="Practica" /></span>
					
						<span class="property-value" aria-labelledby="practica-label"><g:link controller="practica" action="show" id="${valorPracticaInstance?.practica?.id}">${valorPracticaInstance?.practica?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.plan}">
				<li class="fieldcontain">
					<span id="plan-label" class="property-label"><g:message code="valorPractica.plan.label" default="Plan" /></span>
					
						<span class="property-value" aria-labelledby="plan-label"><g:link controller="plan" action="show" id="${valorPracticaInstance?.plan?.id}">${valorPracticaInstance?.plan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.planConvenio}">
				<li class="fieldcontain">
					<span id="planConvenio-label" class="property-label"><g:message code="valorPractica.planConvenio.label" default="Plan Convenio" /></span>
					
						<span class="property-value" aria-labelledby="planConvenio-label"><g:link controller="planConvenio" action="show" id="${valorPracticaInstance?.planConvenio?.id}">${valorPracticaInstance?.planConvenio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.fechaActualizado}">
				<li class="fieldcontain">
					<span id="fechaActualizado-label" class="property-label"><g:message code="valorPractica.fechaActualizado.label" default="Fecha Actualizado" /></span>
					
						<span class="property-value" aria-labelledby="fechaActualizado-label"><g:formatDate date="${valorPracticaInstance?.fechaActualizado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.valorGastoModulo}">
				<li class="fieldcontain">
					<span id="valorGastoModulo-label" class="property-label"><g:message code="valorPractica.valorGastoModulo.label" default="Valor Gasto Modulo" /></span>
					
						<span class="property-value" aria-labelledby="valorGastoModulo-label"><g:fieldValue bean="${valorPracticaInstance}" field="valorGastoModulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${valorPracticaInstance?.valorHonorarioModulo}">
				<li class="fieldcontain">
					<span id="valorHonorarioModulo-label" class="property-label"><g:message code="valorPractica.valorHonorarioModulo.label" default="Valor Honorario Modulo" /></span>
					
						<span class="property-value" aria-labelledby="valorHonorarioModulo-label"><g:fieldValue bean="${valorPracticaInstance}" field="valorHonorarioModulo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:valorPracticaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${valorPracticaInstance}"><g:message code="default.button.editar.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
