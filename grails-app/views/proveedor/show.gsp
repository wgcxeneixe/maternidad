
<%@ page import="maternidad.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			<!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proveedor">
			
				<g:if test="${proveedorInstance?.cuit}">
				<li class="fieldcontain">
					<span id="cuit-label" class="property-label"><g:message code="proveedor.cuit.label" default="Cuit" /></span>
					
						<span class="property-value" aria-labelledby="cuit-label">${proveedorInstance?.cuit?.toString()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="proveedor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${proveedorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="proveedor.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${proveedorInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="proveedor.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${proveedorInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="proveedor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${proveedorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.localidad}">
				<li class="fieldcontain">
					<span id="localidad-label" class="property-label"><g:message code="proveedor.localidad.label" default="Localidad" /></span>
					
						<span class="property-value" aria-labelledby="localidad-label"><g:link controller="localidad" action="show" id="${proveedorInstance?.localidad?.id}">${proveedorInstance?.localidad?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="proveedor.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${proveedorInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
			</ol>

            <h1><g:message code="proveedor.facturas"  /></h1>
<br>
            <table>
                <thead>
                <tr>


                    <th>${message(code: 'facturaProveedor.numero.label', default: 'Numero')}</th>

                    <th>${message(code: 'facturaProveedor.monto.label', default: 'Monto')}</th>

                    <th>${message(code: 'facturaProveedor.fechaEmision.label', default: 'Fecha Emision')}</th>

                    <th>${message(code: 'facturaProveedor.fechaVencimientoPago.label', default: 'Fecha Vencimiento Pago')}</th>

                    <th>${message(code: 'facturaProveedor.fechaRealPago.label', default: 'Fecha Real Pago')}</th>

                    <th>${message(code: 'facturaProveedor.descripcion.label', default: 'Descripcion')}</th>

                    <th></th>

                    <th></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${maternidad.FacturaProveedor.findAllByProveedor(proveedorInstance)}" status="i" var="facturaProveedorInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">



                        <td>${fieldValue(bean: facturaProveedorInstance, field: "numero")}</td>

                        <td>${facturaProveedorInstance?.monto}</td>

                        <td><g:formatDate date="${facturaProveedorInstance.fechaEmision}" format="dd-MM-yyyy" /></td>

                        <td><g:formatDate date="${facturaProveedorInstance.fechaVencimientoPago}" format="dd-MM-yyyy" /></td>

                        <td><g:formatDate date="${facturaProveedorInstance.fechaRealPago}" format="dd-MM-yyyy" /></td>

                        <td>${ (facturaProveedorInstance?.descripcion?.size()>=40)? facturaProveedorInstance?.descripcion?.substring(0,40) +' ...':facturaProveedorInstance?.descripcion}</td>

                        <td><g:link class="linkEdit" controller="facturaProveedor" action="edit" id="${facturaProveedorInstance?.id}">${message(code: 'default.button.edit.label')}</g:link></td>
                        <td><g:link class="linkShow" controller="facturaProveedor" action="show" id="${facturaProveedorInstance?.id}">${message(code: 'default.button.show.label')}</g:link></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${maternidad.FacturaProveedor.findAllByProveedor(proveedorInstance)?.size() ?: 0}"  />
            </div>


			<g:form url="[resource:proveedorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${proveedorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
