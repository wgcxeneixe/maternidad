<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <script>
        $(function() {


            $("#seleccionar").change(function(){
                var checkboxes = $(this).closest('form').find(':checkbox');
                if($(this).is(':checked')) {
                    checkboxes.prop('checked', true);
                } else {
                    checkboxes.prop('checked', false);
                }
            });

            //idioma de los calendar
           $.datepicker.regional[ "es" ];
            updateDatePicker();

            jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                updateDatePicker();
            });

            // $("#obrasocial").attr('readonly',true).select2({allowClear: true});
            $("#obrasocial").attr('readonly',true);

        })

    </script>
</head>
<body>
<a href="#create-factura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-factura" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${facturaInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${facturaInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

<g:form action="facturarSeleccionado">


    <div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'fecha', 'error')} required">
        <label for="fecha">
            <g:message code="factura.fecha.label" default="Fecha" />
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="fecha" precision="day"  value="${facturaInstance?.fecha}"  />

    </div>

    <div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'nrofactura', 'error')} required">
        <label for="nrofactura">
            <g:message code="factura.nrofactura.label" default="Nrofactura" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="nrofactura" type="number" value="${facturaInstance.nrofactura}" required=""/>

    </div>



    <div class="fieldcontain ${hasErrors(bean: facturaInstance, field: 'periodo', 'error')} required">
        <label for="periodo">
            <g:message code="factura.periodo.label" default="Periodo" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="periodo" type="number" value="${facturaInstance.periodo}" required=""/>

    </div>



    <table>
        <thead>
        <tr>
<th></th>
            <th><g:message code="detalleFactura.profesional.label" default="Plan" /></th>

            <th><g:message code="detalleFactura.practica.label" default="Cantidad de Practicas" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Total" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Facturar" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${maternidad.DetalleFactura.executeQuery("select df.plan.id as planid ,df.plan.codigo as codigoplan,sum(df.cantidad) as cant,sum(coalesce(df.valorHonorarios,0)* df.cantidad + coalesce(df.valorGastos,0)*df.cantidad ) as total from DetalleFactura df where df.factura is null group by df.plan.id,df.plan.codigo  ").asList()}" status="i" var="detalleFactura">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${detalleFactura.getAt(0)}</td>

                <td>${detalleFactura.getAt(1)}</td>

                <td>${detalleFactura.getAt(2)}</td>

                <td>${detalleFactura.getAt(3)}</td>

                <td><g:checkBox  name="facturar[]" value="${detalleFactura.getAt(0)}"/> </td>


            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="">
        <label for="periodo">
            <g:message code="factura.periodo.label" default="Seleccionar Todas" />

        </label>
        <g:checkBox id="seleccionar" name="seleccionar"/>

    </div>



    <!--
      <div class="pagination">
        <g:paginate total="${maternidad.DetalleFactura.createCriteria().list {  planillaInternacion{eq('id',params?.id as Long)}
            isNull("factura")}.size() ?: 0}" />
    </div>
-->





    <fieldset class="buttons">
        <g:actionSubmit class="save" action="facturarSeleccionado" value="${message(code: 'default.button.update.label', default: 'Facturar')}" />
    </fieldset>

</g:form>


</div>
</body>
</html>