<%@ page import="maternidad.Plan" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">

    <script>
        $(function() {



            // $("#obrasocial").attr('readonly',true).select2({allowClear: true});
            $("#obrasocial").attr('readonly',true);

        })

    </script>

    <g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<a href="#edit-plan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <!--	<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="list" action="verPlanes" id="${planConvenio?.plan?.obrasocial?.id}"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <!--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li> -->
    </ul>
</div>
<div id="edit-plan" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${planConvenio?.plan}">
        <ul class="errors" role="alert">
            <g:eachError bean="${planConvenio?.plan}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:planConvenio?.plan, action:'updatePlan']" method="PUT" >
        <g:hiddenField name="version" value="${planConvenio?.plan?.version}" />
        <fieldset class="form">
            <div class="fieldcontain ${hasErrors(bean: planConvenio?.plan, field: 'obrasocial', 'error')} required">
                <label for="obrasocial">
                    <g:message code="plan.obrasocial.label" default="Obrasocial" />
                    <span class="required-indicator">*</span>
                </label>

                <g:textField name="nombreOS" readonly="true" value="${planConvenio?.plan?.obrasocial?.encodeAsHTML()}" />

                <g:hiddenField name="obrasocial.id" value="${planConvenio?.plan?.obrasocial?.id}"/>

                <g:hiddenField name="planConvenio.id" value="${planConvenio?.id}"/>

            </div>



            <div class="fieldcontain ${hasErrors(bean: planConvenio?.plan, field: 'nombre', 'error')} ">
                <label for="nombre">
                    <g:message code="plan.nombre.label" default="Nombre" />

                </label>
                <g:textField name="nombre" maxlength="35" value="${planConvenio?.plan?.nombre}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: planConvenio?.plan, field: 'codigo', 'error')} ">
                <label for="codigo">
                    <g:message code="plan.codigo.label" default="Codigo" />

                </label>
                <g:textField name="codigo" maxlength="10" value="${planConvenio?.plan?.codigo}"/>

            </div>

            <div class="fieldcontain ${hasErrors(bean: planConvenio?.plan, field: 'observacion', 'error')} ">
                <label for="observacion">
                    <g:message code="plan.observacion.label" default="Observacion" />

                </label>
                <g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${planConvenio?.plan?.observacion}"/>

            </div>


            <div class="fieldcontain ${hasErrors(bean: planConvenio?.plan, field: 'activo', 'error')} ">
                <label for="activo">
                    <g:message code="plan.activo.label" default="Activo" />

                </label>
                <g:checkBox name="activo" value="${planConvenio?.plan?.activo}" />

            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save"  action="updatePlan" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>


    <br/>

    <g:render  template="/valorGalenoGasto/valoresGalenoGasto" model="[planConvenio: planConvenio]" />

    <br/>

    <g:render  template="/valorGalenoHonorario/valoresGalenoHonorario" model="[planConvenio: planConvenio]" />

    <div class="nav" role="navigation">
        <ul>

            <li><g:link class="create" controller="calculoValores" action="calcularValores" id="${planConvenio?.id}"><g:message code="convenio.calcularValores"  /></g:link></li>
        </ul>
    </div>

    <g:render  template="/practica/verModulos" model="[planConvenio: planConvenio]" />

    <div class="nav" role="navigation">
        <ul>
            <!-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
            <li><g:link class="create" controller="movimientoPlan" action="create" id="${planConvenio?.id}"><g:message code="convenio.crearmovimientoPlan"  /></g:link></li>
        </ul>
    </div>
    <div id="create-movimientoPlan" class="content scaffold-create" role="main">
        <h1><g:message code="convenio.cuentacorrientePlan"  /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <fieldset class="form">
            <table>
                <tbody>

                <tr id="filaoculta" class="prop">
                    <td valign="top" class="name">
                        <label for="plan">Plan</label>
                    </td>
                    <td valign="top" class="value ">
                        <g:select id="plan" name="plan.id" from="${maternidad.Plan.list()}" optionKey="id"  noSelection="['null':'Seleccione un Plan']"
                                  onchange="${remoteFunction(controller: 'movimientoPlan',
                                          action: 'getmovimientosPlan',
                                          params: '\'idPlan=\' + this.value',
                                          update: 'divplan')}"
                        />
                    </td>
                </tr>
                <tr class="prop">
                    <td></td>
                    <td><div id="divplan">
                        <g:render  template="/movimientoPlan/movimientos"
                                   model="[movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: movimientos?.size(), total: total]"    />
                    </div>
                    </td>
                </tr>



                </tbody>
            </table>
        </fieldset>

    </div>


    <h1><g:message code="convenio.practicas"  /></h1>

    <div class="nav" role="navigation">
        <ul>

            <li><g:link class="create" controller="convenio" action="asociarPractica" id="${planConvenio?.id}"><g:message code="convenio.asociarpractica"  /></g:link></li>
        </ul>
    </div>


<fieldset class="buttons">

  <g:link class="list" action="verPracticasAsociadas" params="[planConvenio:planConvenio?.id]">
    <g:message code="convenio.verPracticasAsociadas" />
  </g:link>

</br>
  <g:link class="list" action="verPracticasCalculadas" params="[planConvenio:planConvenio?.id]">
      <g:message code="convenio.verPracticasCalculadas" />
  </g:link>


</fieldset>

<script>
        $(function() {

            $('#plan').change(function(e){

                $("#plan").val('${planConvenio?.plan?.id}');
                $("#plan").prop("disabled", true);
                $("#filaoculta").hide();
            });

            // And now fire change event when the DOM is ready
            $('#plan').trigger('change');

            // $("#obrasocial").attr('readonly',true).select2({allowClear: true});
            $("#obrasocial").attr('readonly',true);

        })

    </script>
</div>
</body>
</html>