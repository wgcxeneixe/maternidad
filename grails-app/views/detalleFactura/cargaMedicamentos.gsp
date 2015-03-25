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
    <h1><g:message code="planillainternacion.cargademedicamentos"  /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${detalleFacturaInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${detalleFacturaInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form id="formulario" url="[resource:detalleFacturaInstance, action:'saveCargaMedicamento']" >
        <fieldset class="form">

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'planillaInternacion', 'error')} required">
                <label for="planillaInternacion">
                    <g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="planillaInternacion" name="planillaInternacion.id" from="${maternidad.PlanillaInternacion.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.planillaInternacion?.id}" class="many-to-one"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'plan', 'error')} required">
                <label for="plan">
                    <g:message code="detalleFactura.plan.label" default="Plan" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select readonly="" id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.plan?.id}" class="many-to-one"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'medicamento', 'error')} required">
                <label for="medicamento">
                    <g:message code="detalleFactura.profesional.label" default="Medicamento" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="medicamento" name="medicamento.id" from="${maternidad.Medicamento.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.medicamento?.id}" class="many-to-one"/>

            </div>


            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'funcion', 'error')} ">
                <label for="funcion">
                    <g:message code="detalleFactura.funcion.label" default="Funcion" />

                </label>
                <select required name ="funcion" id="funcion">
                    <option value="91">91</option>
                </select>
            </div>


            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'cantidad', 'error')} required">
                <label for="cantidad">
                    <g:message code="detalleFactura.cantidad.label" default="Cantidad" />

                </label>
                <g:field type="number" step="any" id="cantidad" name="cantidad" required="" value="${fieldValue(bean: detalleFacturaInstance, field: 'cantidad')}"/>

            </div>




            <div id="divvalor" class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorMedicamento', 'error')} ">
                <label for="valorMedicamento">
                    <g:message code="detalleFactura.valorGastos.label" default="Valor Medicamento" />

                </label>
                <g:field type="number" id="valorMedicamento" step="any" name="valorMedicamento" value="${detalleFacturaInstance?.valorMedicamento}"/>

            </div>


            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'observacion', 'error')} ">
                <label for="observacion">
                    <g:message code="detalleFactura.observacion.label" default="Observacion" />

                </label>
                <g:textField name="observacion" value="${detalleFacturaInstance?.observacion}"/>

            </div>



            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'fecha', 'error')} required">
                <label for="fecha">
                    <g:message code="convenio.fecha.label" default="Fecha" />
                    <span class="required-indicator">*</span>
                </label>
                <g:datePicker name="fecha" precision="minute"  value="${detalleFacturaInstance?.fecha}"  />

            </div>



        </fieldset>
        <fieldset class="buttons">
            <g:submitButton id="boton" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>


    <table>
        <thead>
        <tr>

            <th><g:message code="detalleFactura.medicamento.label" default="Medicamento" /></th>

            <th><g:message code="detalleFactura.cantidad.label" default="Cantidad" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Valor" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Función" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Fecha" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Total" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${maternidad.DetalleFactura.createCriteria().list {  planillaInternacion{eq('id',params?.id as Long)
            isNull("factura")
        }
            isNull("practica")

        }}" status="i" var="detalleFactura">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: detalleFactura, field: "medicamento")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "cantidad")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "valorMedicamento")}</td>


                <td>${detalleFactura?.funcion}</td>


                <td>${detalleFactura?.fecha}</td>


                <td>
                    <g:formatNumber number="${ (detalleFactura?.valorMedicamento)? (detalleFactura?.valorMedicamento * detalleFactura?.cantidad ):0
                    }" type="currency" currencyCode="ARS" />
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>




</div>

<script>
    jQuery(function() {

        var valorMedicamento= jQuery("#medicamento").val();

        if(valorMedicamento!=''){

            jQuery.ajax({
                url: "${g.createLink(controller:'detalleFactura',action:'obtenerValorMedicamento')}",
                type: 'POST',
                dataType: 'json',
                data: {
                    medicamento: valorMedicamento
                    //,funcion: funcion
                },
                success: function (data) {

                    var valor=data.valor;



                    jQuery("#valorMedicamento").val(valor);


                },
                error: function (request, status, error) {
                    alert(error)
                },
                complete: function () {
                }
            });

        }

        //idioma de los calendar
        jQuery.datepicker.regional[ "es" ];
        updateDatePicker();

        jQuery("#medicamento").select2({allowClear: true});


        jQuery("#medicamento").change(function() {
            //  alert(jQuery(this).val());

            var medicamento =  jQuery(this).val();



            if(medicamento!=''){

                jQuery.ajax({
                    url: "${g.createLink(controller:'detalleFactura',action:'obtenerValorMedicamento')}",
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        medicamento: medicamento
                        //,funcion: funcion
                    },
                    success: function (data) {

                        var valor=data.valor;



                        jQuery("#valorMedicamento").val(valor);


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

</body>
</html>