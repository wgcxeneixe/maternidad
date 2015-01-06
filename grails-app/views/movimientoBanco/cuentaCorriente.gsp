<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'movimientoBanco.label', default: 'MovimientoBanco')}" />

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
    <h1>${message(code: 'banco.cuentacorriente')}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

        <fieldset class="form">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="banco">${message(code: 'banco.banco')}</label>
                    </td>
                    <td valign="top" class="value ">
                        <g:select id="banco" name="banco.id" from="${maternidad.Banco.list()}" optionKey="id" noSelection="['null':'Seleccione un Banco']"
                                  onchange="${remoteFunction(controller: 'movimientoBanco',
                                          action: 'getCuenta',
                                          params: '\'idBanco=\' + this.value',
                                          update: 'divbanco')}"
                        />
                    </td>
                </tr>
                <tr class="prop">
                    <td></td>
                    <td><div id="divbanco">
                        <g:render  template="/movimientoBanco/movimientos"
                                   model="[movimientoBancoInstanceList: movimientos, movimientoBancoInstanceCount: movimientos?.size(), total: total]"    />
                    </div>
                    </td>
                </tr>













                </tbody>
            </table>

        </fieldset>



        <g:if test="params.id">
            <script>
                $(function() {

                    $('#banco').change(function(e){

                        $("#banco").val('${params.id}');
                        $("#banco").prop("disabled", true);
                        // $("#filaoculta").hide();
                    });

                    // And now fire change event when the DOM is ready
                    $('#banco').trigger('change');


                })
            </script>

        </g:if>

</div>
</body>
</html>