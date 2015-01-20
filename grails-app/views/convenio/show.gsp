
<%@ page import="maternidad.Convenio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'convenio.label', default: 'Convenio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-convenio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-convenio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list convenio">
			
				<g:if test="${convenioInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="convenio.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${convenioInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.obrasocial}">
				<li class="fieldcontain">
					<span id="obrasocial-label" class="property-label"><g:message code="convenio.obrasocial.label" default="Obrasocial" /></span>
					
						<span class="property-value" aria-labelledby="obrasocial-label"><g:link controller="obraSocial" action="show" id="${convenioInstance?.obrasocial?.id}">${convenioInstance?.obrasocial?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="convenio.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${convenioInstance?.fechaInicio}" format="dd-MM-yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="convenio.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate date="${convenioInstance?.fechaFin}" format="dd-MM-yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="convenio.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${convenioInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${convenioInstance?.observacion}">
				<li class="fieldcontain">
					<span id="observacion-label" class="property-label"><g:message code="convenio.observacion.label" default="Observacion" /></span>
					
						<span class="property-value" aria-labelledby="observacion-label"><g:fieldValue bean="${convenioInstance}" field="observacion"/></span>
					
				</li>
				</g:if>
			
			</ol>


            <br/>
            ${message(code: 'convenio.planesasociados')}
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="nombre" title="${message(code: 'plan.nombre.label', default: 'Nombre')}" />

                    <g:sortableColumn property="codigo" title="${message(code: 'plan.codigo.label', default: 'Codigo')}" />

                    <g:sortableColumn property="observacion" title="${message(code: 'plan.observacion.label', default: 'Observacion')}" />

                    <g:sortableColumn property="activo" title="${message(code: 'plan.activo.label', default: 'Activo')}" />

                </tr>
                </thead>
                <tbody>
                <g:each in="${maternidad.PlanConvenio.findAllByActivoAndConvenio(Boolean.TRUE,convenioInstance)}" status="i" var="planConvenio">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: planConvenio?.plan, field: "nombre")}</td>

                        <td>${fieldValue(bean: planConvenio?.plan, field: "codigo")}</td>

                        <td>${ (planConvenio?.plan?.observacion?.size()>=50)? planConvenio?.plan?.observacion?.substring(0,50) +' ...':planConvenio?.plan?.observacion}</td>

                        <td><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></td>


                    </tr>
                </g:each>
                </tbody>
            </table>
            <br>
            ${message(code: 'convenio.planesnoasociados')}
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="nombre" title="${message(code: 'plan.nombre.label', default: 'Nombre')}" />

                    <g:sortableColumn property="codigo" title="${message(code: 'plan.codigo.label', default: 'Codigo')}" />

                    <g:sortableColumn property="observacion" title="${message(code: 'plan.observacion.label', default: 'Observacion')}" />

                    <g:sortableColumn property="activo" title="${message(code: 'plan.activo.label', default: 'Activo')}" />


                </tr>
                </thead>
                <tbody>

                <g:each in="${maternidad.PlanConvenio.findByActivoAndConvenio(Boolean.FALSE,convenioInstance)}" status="i" var="planConvenio">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: planConvenio?.plan, field: "nombre")}</td>

                        <td>${fieldValue(bean: planConvenio?.plan, field: "codigo")}</td>

                        <td>${ (planConvenio?.observacion?.size()>=50)? planConvenio?.observacion?.substring(0,50) +' ...':planConvenio?.observacion}</td>

                        <td><g:formatBoolean boolean="${planConvenio?.plan?.activo}" /></td>

                    </tr>
                </g:each>


                <g:each in="${maternidad.PlanConvenio.executeQuery(" select p from Plan p where p.obrasocial=:os  and p.id not in (select pc.plan.id from PlanConvenio pc where pc.convenio.obrasocial=:os and pc.convenio.activo=true)",[os:convenioInstance?.obrasocial])}" status="i" var="plan">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: plan, field: "nombre")}</td>

                        <td>${fieldValue(bean: plan, field: "codigo")}</td>

                        <td>${ (plan?.observacion?.size()>=50)? plan?.observacion?.substring(0,50) +' ...':plan?.observacion}</td>

                        <td><g:formatBoolean boolean="${plan?.activo}" /></td>


                    </tr>
                </g:each>



                </tbody>
            </table>


        <g:message code="convenio.conveniosAnteriores"/>

        <table class="ajax">
            <thead>
            <tr>

                <g:sortableColumn property="codigo" title="${message(code: 'convenio.codigo.label', default: 'Codigo')}"  />

                <th><g:message code="convenio.obrasocial.label" default="Obrasocial"  /></th>

                <g:sortableColumn property="fechaInicio" title="${message(code: 'convenio.fechaInicio.label', default: 'Fecha Inicio')}"  />

                <g:sortableColumn property="fechaFin" title="${message(code: 'convenio.fechaFin.label', default: 'Fecha Fin')}"  />

                <g:sortableColumn property="activo" title="${message(code: 'convenio.activo.label', default: 'Activo')}"  />


            </tr>
            </thead>
            <tbody>
            <g:each in="${Convenio.withCriteria {eq("obrasocial",convenioInstance?.obrasocial)
           lt("fechaInicio",convenioInstance?.fechaInicio)
            }}" status="i" var="convenio">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td>${fieldValue(bean: convenio, field: "codigo")}</td>

                    <td>${fieldValue(bean: convenio, field: "obrasocial")}</td>

                    <td><g:formatDate date="${convenio.fechaInicio}" format="dd-MM-yyyy" /></td>

                    <td><g:formatDate date="${convenio.fechaFin}" format="dd-MM-yyyy" /></td>

                    <td><g:formatBoolean boolean="${convenio.activo}" /></td>

                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${Convenio.withCriteria {eq("obrasocial",convenioInstance?.obrasocial)}?.size() ?: 0}"  />
        </div>



            <g:form url="[resource:convenioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${convenioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
