<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'detalleFactura.label', default: 'DetalleFactura')}" />
    <title><g:message code="planillainternacion.cargadepracticas"  /></title>

 

</head>
<body>
<a href="#create-detalleFactura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
     <!--   <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>-->
        <li><g:link class="create" controller="planillaInternacion" action="index" id="${detalleFacturaInstance?.planillaInternacion?.id}" ><g:message code="defaul.button.volver.label" /></g:link></li>
    </ul>
</div>
<div id="create-detalleFactura" class="content scaffold-create" role="main">
    <h1><g:message code="planillainternacion.cargadepracticas"  /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
<g:if test="${flash.error}">
    <div class="errors" role="status">${flash.error}</div>
</g:if>
    <g:hasErrors bean="${detalleFacturaInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${detalleFacturaInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form id="formulario" url="[resource:detalleFacturaInstance, action:'saveCarga']" >
        <fieldset class="form">

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'planillaInternacion', 'error')} required">
                <label for="planillaInternacion">
                    <g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="planillaInternacion" name="planillaInternacion.id" from="${maternidad.PlanillaInternacion.findAllById(detalleFacturaInstance?.planillaInternacion?.id)}" optionKey="id" required="" value="${detalleFacturaInstance?.planillaInternacion?.id}" class="many-to-one" />

            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'plan', 'error')} required">
                <label for="plan">
                    <g:message code="detalleFactura.plan.label" default="Plan" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="plan" name="plan.id" from="${maternidad.Plan.findAllById(detalleFacturaInstance?.plan?.id)}" optionKey="id" required="" value="${detalleFacturaInstance?.plan?.id}" class="many-to-one" />

            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'fecha', 'error')} required">
                <label for="fecha">
                    <g:message code="convenio.fecha.label" default="Fecha" />
                    <span class="required-indicator">*</span>
                </label>
                %{--<g:datePicker name="fecha" precision="day"  value="${detalleFacturaInstance?.fecha}"  />--}%
                 <g:textField name="fechaText" value="${detalleFacturaInstance?.fecha?.format('dd/MM/yyyy')}" />
            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'profesional', 'error')} required">
                <label for="profesional">
                    <g:message code="detalleFactura.profesional.label" default="Profesional" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.profesional?.id}" class="many-to-one"/>

            </div>


            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'practica', 'error')} required">
                <label for="practica">
                    <g:message code="detalleFactura.practica.label" default="Practica" />

                </label>
                <g:select required="" id="practica" name="practica.id" from="${practicas}" optionKey="id"  value="${detalleFacturaInstance?.practica?.id}" class="many-to-one" />

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


            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'cantidad', 'error')} required">
                <label for="cantidad">
                    <g:message code="detalleFactura.cantidad.label" default="Cantidad" />

                </label>
                <g:field type="number" step="any" id="cantidad" name="cantidad" required="" value="${fieldValue(bean: detalleFacturaInstance, field: 'cantidad')}"/>

            </div>




            <div id="divgasto" class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorGastos', 'error')} ">
                <label for="valorGastos">
                    <g:message code="detalleFactura.valorGastos.label" default="Valor Gastos" />

                </label>
                <g:field type="number" step="any" name="valorGastos" value="${detalleFacturaInstance?.valorGastos}"/>

            </div>

            <div id="divhonorario" class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorHonorarios', 'error')} ">
                <label for="valorHonorarios">
                    <g:message code="detalleFactura.valorHonorarios.label" default="Valor Honorarios" />

                </label>
                <g:field type="number" step="any" name="valorHonorarios" value="${detalleFacturaInstance?.valorHonorarios?.toString()}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'observacion', 'error')} ">
                <label for="observacion">
                    <g:message code="detalleFactura.observacion.label" default="Observacion" />

                </label>
                <g:textField name="observacion" value="${detalleFacturaInstance?.observacion}"/>

            </div>


<!--
            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorPractica', 'error')} ">
                <label for="valorPractica">
                    <g:message code="detalleFactura.valorPractica.label" default="Valor Practica" />

                </label>
                <g:field name="valorPractica" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorPractica')}"/>

            </div>
-->

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton id="boton" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>


    <table>
        <thead>
        <tr>

            <th><g:message code="detalleFactura.profesional.label" default="Profesional" /></th>

            <th><g:message code="detalleFactura.practica.label" default="Practica" /></th>

            <th><g:message code="detalleFactura.cantidad.label" default="Cantidad" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Valor Honorario" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="valor Gasto" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Función" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Fecha" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Total" /></th>
<th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${maternidad.DetalleFactura.createCriteria().list {  planillaInternacion{eq('id',params?.id as Long)
            isNull("factura")
        }

            isNull("medicamento")
        }?.sort { -it.id }}" status="i" var="detalleFactura">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: detalleFactura, field: "profesional")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "practica")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "cantidad")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "valorHonorarios")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "valorGastos")}</td>


                <td>${detalleFactura?.funcion}</td>


                <td>${detalleFactura?.fecha?.format('dd/MM/yyyy')}</td>


                <td>
                    <g:formatNumber number="${ ((detalleFactura?.valorHonorarios)? (detalleFactura?.valorHonorarios?.multiply( detalleFactura?.cantidad as Character) ):0 ) +
                            ( (detalleFactura?.valorGastos)? (detalleFactura?.valorGastos?.multiply( detalleFactura?.cantidad as Character) ):0 )
                    }" type="currency" currencyCode="ARS" />
                     </td>

                <td>
                    <g:link class="edit" action="editDetalle" params="[id:detalleFactura?.id]"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </td>

                <td>
                <g:link action="eliminarDetalle" controller="detalleFactura" params="[detalle:detalleFactura?.id,planilla:detalleFactura?.planillaInternacion?.id]"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                >${message(code: 'default.button.delete.label')}</g:link>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>


    
    
</div>

<script>
    jQuery(function() {


        //idioma de los calendar
        jQuery.datepicker.regional[ "es" ];
        updateDatePicker();
        /*
         jQuery("#boton").click(function(e){

         e.preventDefault();

         var valorfuncion=  jQuery("#funcion").val();

         if (valorfuncion==0){

         alert("seleccione una función");


         }
         else {

         jQuery("#formulario").submit();

         }

         });
         */


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

        jQuery("#fechaText").mask('00/00/0000');
       jQuery("#fechaText").focus();
        jQuery("#fechaText").select();

//        jQuery("#fechaText").keyup(function (e) {
////            alert(this.value.length);
//            if ( this.value.length == 10) {
////            jQuery("#profesional").select2('focus');
//                jQuery("#profesional").select2('open');
//
//            }
//        });


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


        jQuery("#valorGastos,#valorHonorarios").keydown(function (e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,188]) !== -1 ||
                // Allow: Ctrl+A
                    (e.keyCode == 65 && e.ctrlKey === true) ||
                // Allow: home, end, left, right
                    (e.keyCode >= 35 && e.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });

           //para seguir el próximo foco con el enter
//        var elementos = jQuery('#divInit').find(':input:visible');
//        elementos.keydown(function(e){
//            var key = e.charCode? e.charCode : e.keyCode? e.keyCode : 0;
//            if(key == 13){
//                e.preventDefault();
//                var inputs = jQuery(this).closest('#divInit').find(':input:visible');
//                inputs.eq(inputs.index(this) + 1).focus();
//            }
//        });


    })

</script>

</body>
</html>