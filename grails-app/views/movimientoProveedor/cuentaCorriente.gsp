<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'movimientoBanco.label', default: 'MovimientoProveedor')}" />

    <script>
        $(function() {



        })

    </script>

    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-movimientoBanco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <!--   <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-movimientoBanco" class="content scaffold-create" role="main">
    <h1>${message(code: 'proveedor.cuentaCorriente')}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <fieldset class="form">
        <table>
            <tbody>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="proveedor">${message(code: 'proveedor.proveedor')}</label>
                </td>
                <td valign="top" class="value ">
                    <g:select id="proveedor" name="proveedor.id" from="${maternidad.Proveedor.list()}" optionKey="id" noSelection="['null':'Seleccione un Proveedor']"
                              onchange="${remoteFunction(controller: 'movimientoProveedor',
                                      action: 'getCuenta',
                                      params: '\'idProveedor=\' + this.value',
                                      update: 'divproveedor')}"
                    />
                </td>
            </tr>
            <tr class="prop">
                <td></td>
                <td><div id="divproveedor">
                    <g:render  template="/movimientoProveedor/movimientos"
                               model="[movimientoProveedorInstanceList: movimientos, movimientoProveedorInstanceCount: movimientos?.size(), total: total]"    />
                </div>
                </td>
            </tr>













            </tbody>
        </table>

    </fieldset>



    <g:if test="${params?.id}">
        <script>
            $(function() {


                jQuery('#proveedor').change(function(e){

                    jQuery("#proveedor").val('${params.id}');
                    jQuery("#proveedor").prop("disabled", true);
                    // $("#filaoculta").hide();
                });

                // And now fire change event when the DOM is ready
                jQuery('#proveedor').trigger('change');


            })
        </script>

    </g:if>
    <g:else >
        <script>
            $(function() {

                jQuery("#proveedor").removeAttr("disabled");


            })
        </script>

    </g:else>

</div>
</body>
</html>