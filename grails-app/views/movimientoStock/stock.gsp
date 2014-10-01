<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'movimientoStock.label', default: 'MovimientoStock')}" />
    <g:setProvider library="prototype"/>
    <script>
        $(function() {

         //   $("#producto").select2({allowClear: true});



        })

    </script>

    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-movimientoStock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
      <!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-movimientoStock" class="content scaffold-create" role="main">
    <h1>${message(code: 'stock.listadomovimientos')}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

        <fieldset class="form">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="producto">${message(code: 'stock.producto')}</label>
                    </td>
                    <td valign="top" class="value ">
                        <g:select id="producto" name="producto.id" from="${maternidad.Producto.list()}" optionKey="id" noSelection="['null':'Seleccione un Producto']"
                                  onchange="${remoteFunction(controller: 'movimientoStock',
                                          action: 'getSaldoStock',
                                          params: '\'idProducto=\' + this.value',
                                          update: 'divstock')}"
                        />
                    </td>
                </tr>
                <tr class="prop">
                    <td></td>
                    <td><div id="divstock">
                        <g:render  template="/movimientoStock/movimientos"
                                   model="[movimientoStockInstanceList: movimientos, movimientoStockInstanceCount: movimientos?.size(), total: total]"    />
                    </div>
                    </td>
                </tr>













                </tbody>
            </table>

        </fieldset>



    <g:if test="params.id">
      <script>
          $(function() {

              $('#producto').change(function(e){

                  $("#producto").val('${params.id}');
                  $("#producto").prop("disabled", true);
                  // $("#filaoculta").hide();
              });

              // And now fire change event when the DOM is ready
              $('#producto').trigger('change');


          })
      </script>

    </g:if>

</div>
</body>
</html>