<%@ page import="maternidad.DetalleFactura" %>


<g:if test="${detalleFacturaInstance?.planillaInternacion}">
    <li class="fieldcontain">
        <span id="planillaInternacion-label" class="property-label"><g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" /></span>

        <span class="property-value" aria-labelledby="planillaInternacion-label"><g:link controller="planillaInternacion" action="show" id="${detalleFacturaInstance?.planillaInternacion?.id}">${detalleFacturaInstance?.planillaInternacion?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${detalleFacturaInstance.practica}">



<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'profesional', 'error')} required">
    <label for="profesional">
        <g:message code="detalleFactura.profesional.label" default="Profesional" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.profesional?.id}" class="many-to-one"/>

</div>



<g:if test="${detalleFacturaInstance?.plan}">
    <li class="fieldcontain">
        <span id="plan-label" class="property-label"><g:message code="detalleFactura.plan.label" default="Plan" /></span>

        <span class="property-value" aria-labelledby="plan-label"><g:link controller="plan" action="show" id="${detalleFacturaInstance?.plan?.id}">${detalleFacturaInstance?.plan?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>


<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'practica', 'error')} required">
    <label for="practica">
        <g:message code="detalleFactura.practica.label" default="Practica" />

    </label>
    <g:select required="" id="practica" name="practica.id" from="${practicas}" optionKey="id"  value="${detalleFacturaInstance?.practica?.id}" class="many-to-one" />

</div>



    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorGastos', 'error')} ">
        <label for="valorGastos">
            <g:message code="detalleFactura.valorGastos.label" default="Valor Gastos" />

        </label>
        <g:field name="valorGastos" type="number" step="any" value="${detalleFacturaInstance?.valorGastos}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorHonorarios', 'error')} ">
        <label for="valorHonorarios">
            <g:message code="detalleFactura.valorHonorarios.label" default="Valor Honorarios" />

        </label>
        <g:field name="valorHonorarios" type="number" step="any" value="${detalleFacturaInstance?.valorHonorarios}"/>

    </div>



</g:if>


<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'cantidad', 'error')} ">
    <label for="cantidad">
        <g:message code="detalleFactura.cantidad.label" default="Cantidad" />

    </label>
    <g:field name="cantidad" type="number" value="${fieldValue(bean: detalleFacturaInstance, field: 'cantidad')}"/>

</div>

<g:if test="${detalleFacturaInstance?.carreraMedica}">
    <li class="fieldcontain">
        <span id="carreraMedica-label" class="property-label"><g:message code="detalleFactura.carreraMedica.label" default="Carrera Medica" /></span>

        <span class="property-value" aria-labelledby="carreraMedica-label"><g:fieldValue bean="${detalleFacturaInstance}" field="carreraMedica"/></span>

    </li>
</g:if>



<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="movimientoStock.fecha.label" default="Fecha" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha"  precision="day"  value="${detalleFacturaInstance?.fecha}"  />

</div>



<div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'funcion', 'error')} ">
    <label for="funcion">
        <g:message code="detalleFactura.funcion.label" default="Funcion" />

    </label>
    <select required name ="funcion" id="funcion">
        <option value="">Seleccione una Función</option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="60">60</option>
        <option value="70">70</option>
        <option value="91">91</option>
    </select>
</div>

<g:if test="${detalleFacturaInstance?.modulo}">
    <li class="fieldcontain">
        <span id="modulo-label" class="property-label"><g:message code="detalleFactura.modulo.label" default="Modulo" /></span>

        <span class="property-value" aria-labelledby="modulo-label"><g:formatBoolean boolean="${detalleFacturaInstance?.modulo}" /></span>

    </li>
</g:if>

<g:if test="${detalleFacturaInstance?.observacion}">



    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'observacion', 'error')} ">
        <label for="observacion">
            <g:message code="detalleFactura.observacion.label" default="Observacion" />

        </label>
        <g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${detalleFacturaInstance?.observacion}"/>

    </div>

</g:if>


<g:if test="${detalleFacturaInstance?.medicamento}">

    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'medicamento', 'error')} required">
        <label for="medicamento">
            <g:message code="detalleFactura.profesional.label" default="Medicamento" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="medicamento" name="medicamento.id" from="${maternidad.Medicamento.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.medicamento?.id}" class="many-to-one"/>

    </div>


    <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorMedicamento', 'error')} ">
        <label for="valorMedicamento">
            <g:message code="detalleFactura.valorMedicamento.label" default="Valor Medicamento" />

        </label>
        <g:field name="valorMedicamento" type="number" step="any" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorMedicamento')}"/>

    </div>
</g:if>


<script>
    jQuery(function() {


        //idioma de los calendar
        jQuery.datepicker.regional[ "es" ];
        updateDatePicker();


        var valorHonorarios= jQuery("#valorHonorarios");
        var valorGastos= jQuery("#valorGastos");

        var divgasto= jQuery("#divgasto");
        var divhonorario= jQuery("#divhonorario");

        jQuery("#planillaInternacion").select2({allowClear: true});
        jQuery("#profesional").select2({allowClear: true});
        jQuery("#practica").select2({allowClear: true});

        var funcion = jQuery("#funcion").val();

        valorHonorarios.prop('readonly', true);
        valorGastos.prop('readonly', true);

        if (funcion == 10) {
            divhonorario.show();
            divgasto.hide();
        }

        if (funcion == 20) {

            divhonorario.show();
            divgasto.hide();
        }

        if (funcion == 30) {

            divhonorario.show();
            divgasto.hide();
        }


        if (funcion == 60) {

            divgasto.show();
            divhonorario.hide();
        }

        if (funcion == 70) {
            divgasto.show();
            divhonorario.show();
        }


        if (funcion == 91) {
            divgasto.show();
            divhonorario.show();
            valorHonorarios.prop('readonly', false);
            valorGastos.prop('readonly', false);
        }


        jQuery("#funcion").change(function() {
            //  alert(jQuery(this).val());
            var funcion = jQuery(this).val();
            var practica = jQuery("#practica").val();



            if( funcion!=''){

                jQuery.ajax({
                    url: "${g.createLink(controller:'detalleFactura',action:'obtenerValores')}",
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        plan: "${detalleFacturaInstance?.plan?.id}",
                        practica: practica,
                        funcion: funcion
                    },
                    success: function (data) {

                        var hon=data.honorario;

                        //hon=("" + hon).replace(/./g, ',');

                        //    hon=("" + hon).replace('.', ',');

                        var gas=data.gasto;

                        //       gas=("" + gas).replace(/./g, ',');
                        //   gas=("" + gas).replace('.', ',');

                        if (funcion == 10) {
                            valorHonorarios.val(hon);
                            divhonorario.show();
                            divgasto.hide();
                        }

                        if (funcion == 20) {
                            //valorHonorarios.val(data.honorario);
                            valorHonorarios.val(hon);
                            divhonorario.show();
                            divgasto.hide();
                        }

                        if (funcion == 30) {
                            valorHonorarios.val(hon);
                            divhonorario.show();
                            divgasto.hide();
                        }


                        if (funcion == 60) {
                            valorGastos.val(gas);
                            divgasto.show();
                            divhonorario.hide();
                        }

                        if (funcion == 70) {
                            valorGastos.val(gas);
                            valorHonorarios.val(hon);
                            divgasto.show();
                            divhonorario.show();
                        }

                        if (funcion == 91) {
                            // valorGastos.val(data.gasto);
                            // valorHonorarios.val(data.honorario);
                            divgasto.show();
                            divhonorario.show();
                            valorHonorarios.prop('readonly', false);
                            valorGastos.prop('readonly', false);
                        }

//                        jQuery("#cantidad").select();
                    },
                    error: function (request, status, error) {
                        alert(error)
                    },
                    complete: function () {
                    }
                });

            }


        });

        jQuery("#practica").change(function() {
            //  alert(jQuery(this).val());
            var funcion = jQuery("#funcion").val();
            var practica =  jQuery(this).val();



            if(funcion!=''){

                jQuery.ajax({
                    url: "${g.createLink(controller:'detalleFactura',action:'obtenerValores')}",
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        plan: "${detalleFacturaInstance?.plan?.id}",
                        practica: practica,
                        funcion: funcion
                    },
                    success: function (data) {

                        var hon=data.honorario;

                        //hon=("" + hon).replace(/./g, ',');

                        hon=("" + hon).replace('.', ',');

                        var gas=data.gasto;

                        //       gas=("" + gas).replace(/./g, ',');
                        gas=("" + gas).replace('.', ',');

                        if (funcion == 10) {
                            valorHonorarios.val(hon);
                            divhonorario.show();
                            divgasto.hide();
                        }

                        if (funcion == 20) {
                            //valorHonorarios.val(data.honorario);
                            valorHonorarios.val(hon);
                            divhonorario.show();
                            divgasto.hide();
                        }

                        if (funcion == 30) {
                            valorHonorarios.val(hon);
                            divhonorario.show();
                            divgasto.hide();
                        }


                        if (funcion == 60) {
                            valorGastos.val(gas);
                            divgasto.show();
                            divhonorario.hide();
                        }

                        if (funcion == 70) {
                            valorGastos.val(gas);
                            valorHonorarios.val(hon);
                            divgasto.show();
                            divhonorario.show();
                        }

                        if (funcion == 91) {
                            // valorGastos.val(data.gasto);
                            // valorHonorarios.val(data.honorario);
                            divgasto.show();
                            divhonorario.show();
                            valorHonorarios.prop('readonly', false);
                            valorGastos.prop('readonly', false);
                        }

//                        jQuery("#cantidad").select();
                    },
                    error: function (request, status, error) {
                        alert(error)
                    },
                    complete: function () {
                    }
                });

            }


        });


    })

</script>

