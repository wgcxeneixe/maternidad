<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'detalleFactura.label', default: 'DetalleFactura')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

    <script>
        $(function() {

           var valorHonorarios= $("#valorHonorarios");
            var valorGastos= $("#valorGastos");

            var divgasto= $("#divgasto");
            var divhonorario= $("#divhonorario");

            $("#planillaInternacion").select2({allowClear: true});
            $("#profesional").select2({allowClear: true});
            $("#practica").select2({allowClear: true});

            var funcion = $("#funcion").val();

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


            $("#funcion").change(function() {
                //  alert($(this).val());
                var funcion = $(this).val();
                var practica = $("#practica").val();



                if(practica!='null'){

                $.ajax({
                    url: "${g.createLink(controller:'detalleFactura',action:'obtenerValores')}",
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        plan: "${detalleFacturaInstance?.plan?.id}",
                        practica: practica,
                        funcion: funcion
                    },
                    success: function (data) {

                        if (funcion == 10) {
                            valorHonorarios.val(data.honorario);
                            divhonorario.show();
                            divgasto.hide();
                        }

                        if (funcion == 20) {
                            valorHonorarios.val(data.honorario);
                            divhonorario.show();
                            divgasto.hide();
                        }

                        if (funcion == 30) {
                            valorHonorarios.val(data.honorario);
                            divhonorario.show();
                            divgasto.hide();
                        }


                        if (funcion == 60) {
                            valorGastos.val(data.gasto);
                            divgasto.show();
                            divhonorario.hide();
                        }

                        if (funcion == 70) {
                            valorGastos.val(data.gasto);
                            valorHonorarios.val(data.honorario);
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


                    },
                    error: function (request, status, error) {
                        alert(error)
                    },
                    complete: function () {
                    }
                });

            }

                /*
                $.post( "${createLink(controller: "detalleFactura",action:"obtenerValores")}", { plan: "${detalleFacturaInstance?.plan?.id}", time: "2pm" } )
                        .done(function( data ) {
                            alert( "Data Loaded: " + data );
                        });
*/
            });




        })

    </script>

</head>
<body>
<a href="#create-detalleFactura" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-detalleFactura" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
    <g:form url="[resource:detalleFacturaInstance, action:'saveCarga']" >
        <fieldset class="form">

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'planillaInternacion', 'error')} required">
                <label for="planillaInternacion">
                    <g:message code="detalleFactura.planillaInternacion.label" default="Planilla Internacion" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="planillaInternacion" name="planillaInternacion.id" from="${maternidad.PlanillaInternacion.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.planillaInternacion?.id}" class="many-to-one"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'profesional', 'error')} required">
                <label for="profesional">
                    <g:message code="detalleFactura.profesional.label" default="Profesional" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="profesional" name="profesional.id" from="${maternidad.Profesional.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.profesional?.id}" class="many-to-one"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'plan', 'error')} required">
                <label for="plan">
                    <g:message code="detalleFactura.plan.label" default="Plan" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id" required="" value="${detalleFacturaInstance?.plan?.id}" class="many-to-one"/>

            </div>


            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'practica', 'error')} required">
                <label for="practica">
                    <g:message code="detalleFactura.practica.label" default="Practica" />

                </label>
                <g:select id="practica" name="practica.id" from="${practicas}" optionKey="id"  value="${detalleFacturaInstance?.practica?.id}" class="many-to-one" noSelection="['null': '']"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'funcion', 'error')} ">
                <label for="funcion">
                    <g:message code="detalleFactura.funcion.label" default="Funcion" />

                </label>
<select name ="funcion" id="funcion">
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
                <g:field name="cantidad" value="${fieldValue(bean: detalleFacturaInstance, field: 'cantidad')}"/>

            </div>




            <div id="divgasto" class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorGastos', 'error')} ">
                <label for="valorGastos">
                    <g:message code="detalleFactura.valorGastos.label" default="Valor Gastos" />

                </label>
                <g:field name="valorGastos" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorGastos')}"/>

            </div>

            <div id="divhonorario" class="fieldcontain ${hasErrors(bean: detalleFacturaInstance, field: 'valorHonorarios', 'error')} ">
                <label for="valorHonorarios">
                    <g:message code="detalleFactura.valorHonorarios.label" default="Valor Honorarios" />

                </label>
                <g:field name="valorHonorarios" value="${fieldValue(bean: detalleFacturaInstance, field: 'valorHonorarios')}"/>

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
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>


    <table>
        <thead>
        <tr>

            <th><g:message code="detalleFactura.profesional.label" default="Profesional" /></th>

            <th><g:message code="detalleFactura.practica.label" default="Practica" /></th>

            <g:sortableColumn property="cantidad" title="${message(code: 'detalleFactura.cantidad.label', default: 'Cantidad')}" />

            <th><g:message code="detalleFactura.valorPractica.label" default="Valor Honorario" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="valor Gasto" /></th>

            <th><g:message code="detalleFactura.valorPractica.label" default="Total" /></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${maternidad.DetalleFactura.createCriteria().list {  planillaInternacion{eq('id',params?.id as Long)}
            isNull("factura")}}" status="i" var="detalleFactura">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: detalleFactura, field: "profesional")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "practica")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "cantidad")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "valorHonorarios")}</td>

                <td>${fieldValue(bean: detalleFactura, field: "valorGastos")}</td>

                <td> ${ (detalleFactura?.valorHonorarios)? (detalleFactura.valorHonorarios.multiply( detalleFactura.cantidad as Character) ):0  +
                        (detalleFactura?.valorGastos)? (detalleFactura.valorGastos.multiply( detalleFactura.cantidad as Character) ):0
                } </td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${maternidad.DetalleFactura.createCriteria().list {  planillaInternacion{eq('id',params?.id as Long)}
            isNull("factura")}.size() ?: 0}" />
    </div>


</div>
</body>
</html>