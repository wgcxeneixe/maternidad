<%@ page import="maternidad.PlanillaInternacion" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'planillaInternacion.label', default: 'PlanillaInternacion')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-planillaInternacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
       <!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="create" action="buscapaciente"><g:message code="planillaInternacion.new.label"
                                                              args="[entityName]"/></g:link></li>

        <g:if test="${filters?.estado== maternidad.EstadoPlanilla.findByCodigo("IMP")?.id?.toString()}">
            <li>
                <a href="#" id="presentar" class="create" ><g:message code="planillaInternacion.planillaspresentadas" /></a>
               </li>
        </g:if>

    </ul>
</div>





<div class="filters">
    <g:form action="index">

        <table>
            <tr>
                <td> <p><label for="dni">DNI Paciente</label>
                    <g:textField name="dni" value="${filters?.dni}" /></p></td>
                <td>
                    <p><label for="nombre">Nombre</label>
                        <g:textField name="nombre" value="${filters?.nombre}" /></p></td>

                <td>
                    <p><label for="nroplanilla">Nº Planilla</label>
                        <g:textField id="nroplanilla" name="nroplanilla" value="${filters?.nroplanilla}" /></p></td>


                <td>
                    <p><label for="estado">Estado</label>
                        <g:select id="estado" name="estado" from="${maternidad.EstadoPlanilla.list()}" optionKey="id" value="${filters?.estado}"  noSelection="['': '']"/></p></td>

                <td>
                    <p><g:submitButton name="filter" value="Filtrar" /></p></td>
            </tr>
        </table>




    </g:form>
</div>

<g:form name="formPresentar"  controller="planillaInternacion" action="presentarSeleccionadas">

    <g:if test="${filters?.estado== maternidad.EstadoPlanilla.findByCodigo("IMP")?.id?.toString()}">
    <div class="">
        <label for="periodo">
            <g:message code="factura.periodo.label" default="Seleccionar Todas" />

        </label>
        <g:checkBox id="seleccionar" name="seleccionar"/>

    </div>
</g:if>
<g:render template="lista" model="model"/>

</g:form>

<g:if test="${filters?.estado== maternidad.EstadoPlanilla.findByCodigo("PRE")?.id?.toString()}">


    <g:form name="formFacturarSeleccionadas"  controller="planillaInternacion" action="cerrar" params="${[planilla:planillaInternacionInstanceList?.id]}">


            <div class="">
                <label for="periodo">
                    <g:message code="factura.periodo.label" default="Periodo" />

                </label>
                <g:textField name="periodo" value=""/>

            </div>

       <g:submitButton name="facturarSeleccionados"  value="Facturar"/>
    </g:form>



</g:if>


<script>
    jQuery(function() {


        jQuery("#seleccionar").change(function(){
            var checkboxes = jQuery(this).closest('form').find(':checkbox');
            if(jQuery(this).is(':checked')) {
                checkboxes.prop('checked', true);
            } else {
                checkboxes.prop('checked', false);
            }
        });

        //idioma de los calendar
        jQuery.datepicker.regional[ "es" ];
        updateDatePicker();

        jQuery("#spinner").ajaxComplete(function (event, request, settings) {
            updateDatePicker();
        });

        // jQuery("#obrasocial").attr('readonly',true).select2({allowClear: true});
      //  jQuery("#obrasocial").attr('readonly',true);

        jQuery( "#presentar" ).click(function(e) {
           // e.preventDefault();
            //jQuery("#formFacturar").submit();
            jQuery('form[name="formPresentar"]').submit();

        });

    });




</script>



    </body>
</html>
