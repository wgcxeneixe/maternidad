<%--
  Created by IntelliJ IDEA.
  User: leandro
  Date: 12/01/15
  Time: 11:16
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Liquidación</title>
    <link rel="stylesheet" type="text/css" href="../css/jquery.multiselect.css"/>

    <link rel="stylesheet" type="text/css" href="../css/jquery-ui-themes-1.10.4/themes/ui-lightness/jquery-ui.css"/>
    <script type="text/javascript" src="../js/jquery-ui-1.10.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/jquery.multiselect.js"></script>
    <script type="text/javascript" src="../js/jquery.multiselect.filter.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            var periodo = jQuery("#periodo");

            periodo.mask('00/0000');
        });
        $(function () {
            $("conceptos").multiselect({
                selectedList: 4
            });
            $("conceptos").multiselect().multiselectfilter();

        });
    </script>

</head>

<body>
<g:form>
    <div class="list">
        %{--<div>--}%
        %{--<select id="example" name="example" multiple="multiple">--}%
        %{--<option value="1">Option 1</option>--}%
        %{--<option value="2">Option 2</option>--}%
        %{--<option value="3">Option 3</option>--}%
        %{--<option value="4">Option 4</option>--}%
        %{--<option value="5">Option 5</option>--}%
        %{--</select>--}%
        %{--</div>--}%
        <div>
            <g:select id="conceptos" name="conceptos.id" from="${maternidad.ConceptoProfesional.list()}" optionKey="id"
                      noSelection="['null': 'Seleccione los Conceptos a Liquidar']"/>
        </div>

        <table>
            <thead>
            <tr>
                <th>Plan</th>
                <th>Nro Factura</th>
                <th>Fecha Pago</th>
                <th>Monto Pago</th>
                <th>% liquidado</th>
                <th>% a liquidar</th>
                <th>Total a liquidar</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${listaPagos}" status="i" var="pago">
                <tr>
                    <td>${pago.factura.plan.codigo}</td>
                    <td>${pago.factura.nrofactura}</td>
                    <td>${pago.fecha.format('dd/MM/yyyy')}</td>
                    <td>${pago.monto}</td>
                    <td>${pago.porcentajeLiquidado}</td>
                    <td>${pago.montoALiquidar()}</td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div>
            <g:actionSubmit value="Liquidar" action="liquidarAction"/>
        </div>
    </div>
</g:form>
</body>
</html>