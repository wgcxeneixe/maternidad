<%@ page import="facturaElectronica.FacturaElectronica" %>


<g:if test="${!facturaElectronicaInstance.cuit}">
<div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'cuit', 'error')} ">
    <label for="cuit">
        <g:message code="facturaElectronica.cuit.label" default="Cuit" />

    </label>
    <g:field name="cuit" type="number" value="${facturaElectronicaInstance.cuit}"/>
    <g:actionSubmit value="Buscar" id="buscarCuit" action="create" />
</div>

 </g:if>
<g:else>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'cuit', 'error')} ">
        <label for="cuit">
            <g:message code="facturaElectronica.cuit.label" default="Cuit" />

        </label>
        <g:field name="cuit" type="number" value="${facturaElectronicaInstance.cuit}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'cae', 'error')} ">
        <label for="cae">
            <g:message code="facturaElectronica.cae.label" default="Cae" />

        </label>
        <g:textField name="cae" value="${facturaElectronicaInstance?.cae}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'codigoPostal', 'error')} ">
        <label for="codigoPostal">
            <g:message code="facturaElectronica.codigoPostal.label" default="Codigo Postal" />

        </label>
        <g:field name="codigoPostal" type="number" value="${facturaElectronicaInstance.codigoPostal}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'direccion', 'error')} ">
        <label for="direccion">
            <g:message code="facturaElectronica.direccion.label" default="Direccion" />

        </label>
        <g:textField name="direccion" value="${facturaElectronicaInstance?.direccion}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'fecha', 'error')} ">
        <label for="fecha">
            <g:message code="facturaElectronica.fecha.label" default="Fecha" />

        </label>
        <g:datePicker name="fecha" precision="day"  value="${facturaElectronicaInstance?.fecha}" default="none" noSelection="['': '']" />

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'localidad', 'error')} ">
        <label for="localidad">
            <g:message code="facturaElectronica.localidad.label" default="Localidad" />

        </label>
        <g:textField name="localidad" value="${facturaElectronicaInstance?.localidad}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'numeroFactura', 'error')} ">
        <label for="numeroFactura">
            <g:message code="facturaElectronica.numeroFactura.label" default="Numero Factura" />

        </label>
        <g:field name="numeroFactura" type="number" value="${facturaElectronicaInstance.numeroFactura}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'personaFisica', 'error')} ">
        <label for="personaFisica">
            <g:message code="facturaElectronica.personaFisica.label" default="Persona Fisica" />

        </label>
        <g:checkBox name="personaFisica" value="${facturaElectronicaInstance?.personaFisica}" />

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'provincia', 'error')} ">
        <label for="provincia">
            <g:message code="facturaElectronica.provincia.label" default="Provincia" />

        </label>
        <g:textField name="provincia" value="${facturaElectronicaInstance?.provincia}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'puntoVenta', 'error')} ">
        <label for="puntoVenta">
            <g:message code="facturaElectronica.puntoVenta.label" default="Punto Venta" />

        </label>
        <g:field name="puntoVenta" type="number" value="${facturaElectronicaInstance.puntoVenta}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'razonSocial', 'error')} ">
        <label for="razonSocial">
            <g:message code="facturaElectronica.razonSocial.label" default="Razon Social" />

        </label>
        <g:textField name="razonSocial" value="${facturaElectronicaInstance?.razonSocial}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'tipoFactura', 'error')} ">
        <label for="tipoFactura">
            <g:message code="facturaElectronica.tipoFactura.label" default="Tipo Factura" />

        </label>
        <g:select id="tipoFactura" name="tipoFactura.id" from="${facturaElectronica.TipoFactura.list()}" optionKey="id" value="${facturaElectronicaInstance?.tipoFactura?.id}" class="many-to-one" noSelection="['null': '']"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'total', 'error')} ">
        <label for="total">
            <g:message code="facturaElectronica.total.label" default="Total" />

        </label>
        <g:field name="total" value="${fieldValue(bean: facturaElectronicaInstance, field: 'total')}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'totalIva', 'error')} ">
        <label for="totalIva">
            <g:message code="facturaElectronica.totalIva.label" default="Total Iva" />

        </label>
        <g:field name="totalIva" value="${fieldValue(bean: facturaElectronicaInstance, field: 'totalIva')}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaElectronicaInstance, field: 'totalNeto', 'error')} ">
        <label for="totalNeto">
            <g:message code="facturaElectronica.totalNeto.label" default="Total Neto" />

        </label>
        <g:field name="totalNeto" value="${fieldValue(bean: facturaElectronicaInstance, field: 'totalNeto')}"/>

    </div>
</g:else>


