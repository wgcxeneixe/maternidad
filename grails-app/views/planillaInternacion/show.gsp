<%@ page import="maternidad.PlanillaInternacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planillaInternacion.label', default: 'PlanillaInternacion')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-planillaInternacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
     <!--   <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
        <li><g:link class="list" action="index"><g:message code="planillaInternacion.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="list" action="create" controller="nacimiento" id="${planillaInternacionInstance?.id}"><g:message code="nacimiento.edit.label" args="[entityName]"/></g:link></li>

    </ul>
</div>

<div id="show-planillaInternacion" class="content scaffold-show" role="main">
    <h1><g:message code="planillaInternacion.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list planillaInternacion">

        <g:if test="${planillaInternacionInstance?.paciente}">
            <li class="fieldcontain">
                <span id="paciente-label" class="property-label"><g:message code="planillaInternacion.paciente.label"
                                                                            default="Paciente"/></span>
                <span class="property-value" aria-labelledby="paciente-label">${planillaInternacionInstance?.paciente?.encodeAsHTML()}</span>

            </li>
        </g:if>

        <!-- persona  -->

    <g:if test="${planillaInternacionInstance?.paciente?.cuit}">
        <li class="fieldcontain">
            <span id="cuit-label" class="property-label"><g:message code="persona.cuit.label" default="Cuit" /></span>

            <span class="property-value" aria-labelledby="cuit-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="cuit"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.apellido}">
        <li class="fieldcontain">
            <span id="apellido-label" class="property-label"><g:message code="persona.apellido.label" default="Apellido" /></span>

            <span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="apellido"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.nombre}">
        <li class="fieldcontain">
            <span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>

            <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="nombre"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.razonSocial}">
        <li class="fieldcontain">
            <span id="razonSocial-label" class="property-label"><g:message code="persona.razonSocial.label" default="Razon Social" /></span>

            <span class="property-value" aria-labelledby="razonSocial-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="razonSocial"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.tipoDocumento}">
        <li class="fieldcontain">
            <span id="tipoDocumento-label" class="property-label"><g:message code="persona.tipoDocumento.label" default="Tipo Documento" /></span>

            <span class="property-value" aria-labelledby="tipoDocumento-label"><g:link controller="tipoDocumento" action="show" id="${planillaInternacionInstance?.paciente?.tipoDocumento?.id}">${planillaInternacionInstance?.paciente?.tipoDocumento?.encodeAsHTML()}</g:link></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.nroDocumento}">
        <li class="fieldcontain">
            <span id="nroDocumento-label" class="property-label"><g:message code="persona.nroDocumento.label" default="Nro Documento" /></span>

            <span class="property-value" aria-labelledby="nroDocumento-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="nroDocumento"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.nacionalidad}">
        <li class="fieldcontain">
            <span id="nacionalidad-label" class="property-label"><g:message code="persona.nacionalidad.label" default="Nacionalidad" /></span>

            <span class="property-value" aria-labelledby="nacionalidad-label"><g:link controller="pais" action="show" id="${planillaInternacionInstance?.paciente?.nacionalidad?.id}">${planillaInternacionInstance?.paciente?.nacionalidad?.encodeAsHTML()}</g:link></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.calle}">
        <li class="fieldcontain">
            <span id="calle-label" class="property-label"><g:message code="persona.calle.label" default="Calle" /></span>

            <span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="calle"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.piso}">
        <li class="fieldcontain">
            <span id="piso-label" class="property-label"><g:message code="persona.piso.label" default="Piso" /></span>

            <span class="property-value" aria-labelledby="piso-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="piso"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.departamento}">
        <li class="fieldcontain">
            <span id="departamento-label" class="property-label"><g:message code="persona.departamento.label" default="Departamento" /></span>

            <span class="property-value" aria-labelledby="departamento-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="departamento"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.codigoPostal}">
        <li class="fieldcontain">
            <span id="codigoPostal-label" class="property-label"><g:message code="persona.codigoPostal.label" default="Codigo Postal" /></span>

            <span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="codigoPostal"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.localidad}">
        <li class="fieldcontain">
            <span id="localidad-label" class="property-label"><g:message code="persona.localidad.label" default="Localidad" /></span>

            <span class="property-value" aria-labelledby="localidad-label"><g:link controller="localidad" action="show" id="${planillaInternacionInstance?.paciente?.localidad?.id}">${planillaInternacionInstance?.paciente?.localidad?.encodeAsHTML()}</g:link></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.estadoCivil}">
        <li class="fieldcontain">
            <span id="estadoCivil-label" class="property-label"><g:message code="persona.estadoCivil.label" default="Estado Civil" /></span>

            <span class="property-value" aria-labelledby="estadoCivil-label"><g:link controller="estadoCivil" action="show" id="${planillaInternacionInstance?.paciente?.estadoCivil?.id}">${planillaInternacionInstance?.paciente?.estadoCivil?.encodeAsHTML()}</g:link></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.numero}">
        <li class="fieldcontain">
            <span id="numero-label" class="property-label"><g:message code="persona.numero.label" default="Numero" /></span>

            <span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${planillaInternacionInstance?.paciente}" field="numero"/></span>

        </li>
    </g:if>

    <g:if test="${planillaInternacionInstance?.paciente?.personaFisica}">
        <li class="fieldcontain">
            <span id="personaFisica-label" class="property-label"><g:message code="persona.personaFisica.label" default="Persona Fisica" /></span>

            <span class="property-value" aria-labelledby="personaFisica-label"><g:formatBoolean boolean="${planillaInternacionInstance?.paciente?.personaFisica}" /></span>

        </li>
    </g:if>





    <!--- fin persona-->







    <g:if test="${planillaInternacionInstance?.plan}">
            <li class="fieldcontain">
                <span id="plan-label" class="property-label"><g:message code="planillaInternacion.plan.label"
                                                                        default="Plan"/></span>

                <span class="property-value" aria-labelledby="plan-label">
                    ${planillaInternacionInstance?.plan?.encodeAsHTML()}</span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.fechaInternacion}">
            <li class="fieldcontain">
                <span id="fechaInternacion-label" class="property-label"><g:message
                        code="planillaInternacion.fechaInternacion.label" default="Fecha Internacion"/></span>

                <span class="property-value" aria-labelledby="fechaInternacion-label"><g:formatDate style="LONG" type="date"
                        date="${planillaInternacionInstance?.fechaInternacion}"/></span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.nombreFamiliarResponsable}">
            <li class="fieldcontain">
                <span id="nombreFamiliarResponsable-label" class="property-label"><g:message
                        code="planillaInternacion.nombreFamiliarResponsable.label"
                        default="Nombre Familiar Responsable"/></span>

                <span class="property-value" aria-labelledby="nombreFamiliarResponsable-label"><g:fieldValue
                        bean="${planillaInternacionInstance}" field="nombreFamiliarResponsable"/></span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.telefonoFamiliarResponsable}">
            <li class="fieldcontain">
                <span id="telefonoFamiliarResponsable-label" class="property-label"><g:message
                        code="planillaInternacion.telefonoFamiliarResponsable.label"
                        default="Telefono Familiar Responsable"/></span>

                <span class="property-value" aria-labelledby="telefonoFamiliarResponsable-label"><g:fieldValue
                        bean="${planillaInternacionInstance}" field="telefonoFamiliarResponsable"/></span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.fechaAlta}">
            <li class="fieldcontain">
                <span id="fechaAlta-label" class="property-label"><g:message code="planillaInternacion.fechaAlta.label"
                                                                             default="Fecha Alta"/></span>

                <span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate  style="LONG" type="date"
                        date="${planillaInternacionInstance?.fechaAlta}"/></span>

            </li>
        </g:if>

        <g:if test="${planillaInternacionInstance?.observaciones}">
            <li class="fieldcontain">
                <span id="observaciones-label" class="property-label"><g:message
                        code="planillaInternacion.observaciones.label" default="Observaciones"/></span>

                <span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue
                        bean="${planillaInternacionInstance}" field="observaciones"/></span>

            </li>
        </g:if>

    </ol>
    <!-- Listado de Nacimientos -->
    <g:if test="${planillaInternacionInstance?.nacimientos}">
        <fieldset class="form">
            <g:render template="nacimientos" />
        </fieldset>
    </g:if>

<br>
<h1><g:message code="planillainternacion.listadodepracticas"  /></h1>
<table>
    <thead>
    <tr>

        <th><g:message code="detalleFactura.profesional.label" default="Profesional" /></th>

        <th><g:message code="detalleFactura.practica.label" default="Practica" /></th>

        <th><g:message code="detalleFactura.cantidad.label" default="Cantidad" /></th>

        <th><g:message code="detalleFactura.valorPractica.label" default="Valor Honorario" /></th>

        <th><g:message code="detalleFactura.valorPractica.label" default="valor Gasto" /></th>

        <th><g:message code="detalleFactura.valorPractica.label" default="Función" /></th>

        <th><g:message code="detalleFactura.valorPractica.label" default="Total" /></th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${maternidad.DetalleFactura.createCriteria().list {  planillaInternacion{eq('id',planillaInternacionInstance?.id as Long)}
        isNull("factura")

    }}" status="i" var="detalleFactura">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: detalleFactura, field: "profesional")}</td>

            <td>${fieldValue(bean: detalleFactura, field: "practica")}</td>

            <td>${fieldValue(bean: detalleFactura, field: "cantidad")}</td>

            <td>${fieldValue(bean: detalleFactura, field: "valorHonorarios")}</td>

            <td>${fieldValue(bean: detalleFactura, field: "valorGastos")}</td>


            <td>${detalleFactura?.funcion}</td>

            <td>


                <g:formatNumber number="${ (detalleFactura?.valorHonorarios)? (detalleFactura?.valorHonorarios?.multiply( detalleFactura?.cantidad as Character) ):0  +
                        (detalleFactura?.valorGastos)? (detalleFactura?.valorGastos?.multiply( detalleFactura?.cantidad as Character) ):0
                }" type="currency" currencyCode="ARS" />
            </td>

        </tr>
    </g:each>
    </tbody>
</table>
<!--    <div class="pagination">
        <g:paginate params="[id:params?.id]" total="${maternidad.DetalleFactura.createCriteria().list {  planillaInternacion{eq('id',params?.id as Long)}
    isNull("factura")}.size() ?: 0}" />
    </div>
-->



<!-- Listado de Transacciones de caja -->
<g:if test="${planillaInternacionInstance?.detalles}">
    <fieldset class="form">
        <g:render template="listaDetallesCaja" />
    </fieldset>
</g:if>


    <g:form url="[resource: planillaInternacionInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${planillaInternacionInstance}"><g:message
                    code="default.button.editar.label" default="Edit"/></g:link>
            <!--
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            -->
        </fieldset>
    </g:form>
</div>
</body>
</html>
