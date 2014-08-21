
<%@ page import="maternidad.PlanConvenio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planConvenio.label', default: 'PlanConvenio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-planConvenio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-planConvenio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list planConvenio">
			
				<g:if test="${planConvenioInstance?.plan}">
				<li class="fieldcontain">
					<span id="plan-label" class="property-label"><g:message code="planConvenio.plan.label" default="Plan" /></span>
					
						<span class="property-value" aria-labelledby="plan-label"><g:link controller="plan" action="show" id="${planConvenioInstance?.plan?.id}">${planConvenioInstance?.plan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${planConvenioInstance?.convenio}">
				<li class="fieldcontain">
					<span id="convenio-label" class="property-label"><g:message code="planConvenio.convenio.label" default="Convenio" /></span>
					
						<span class="property-value" aria-labelledby="convenio-label"><g:link controller="convenio" action="show" id="${planConvenioInstance?.convenio?.id}">${planConvenioInstance?.convenio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:planConvenioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${planConvenioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
