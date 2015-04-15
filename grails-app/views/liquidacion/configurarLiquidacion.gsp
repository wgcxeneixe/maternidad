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

    <script src="//ajax.googleapis.com/ajax/libs/prototype/1.6.1.0/prototype.js"></script>

    <link rel="stylesheet" type="text/css" href="../css/jquery-ui-themes-1.10.4/themes/ui-lightness/jquery-ui.css"/>
    <script type="text/javascript" src="../js/jquery-ui-1.10.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/jquery.multiselect.js"></script>
    <script type="text/javascript" src="../js/jquery.multiselect.filter.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery("#liquidarBtn").click(function () {
                var conceptos = jQuery("#conceptos").val();
                new Ajax.Updater('confirmarLiquidacionDiv',
                        '${createLink(action:"armarLiquidacion", controller:"liquidacion" )}',
                        {
                            asynchronous: false, evalScripts: true,
                            parameters: {
                                conceptos: conceptos
                            }
                        });
            });
        });

        $(function () {
            jQuery("conceptos").multiselect({
                selectedList: 4
            });
            jQuery("conceptos").multiselect().multiselectfilter();

        });
    </script>

</head>

<body>
<div class="list">

    <table>
        <thead>
        <tr>
            <th>Plan</th>
            <th>Periodo</th>
            <th>Fecha Pago</th>
            <th>Monto Pago</th>
            <th>% liquidado</th>
            <th>a liquidar</th>
            <th>Total a liquidar</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${listaPagos}" status="i" var="pago">
            <tr>
                <td>${pago.facturaPeriodo.plan.codigo}</td>
                <td>${pago.facturaPeriodo.periodo}</td>
                <td>${pago.fecha.format('dd/MM/yyyy')}</td>
                <td>${pago.monto}</td>
                <td>${pago.porcentajeLiquidado}</td>
                <td>${pago.montoALiquidar()}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

    %{--<div>--}%
    %{--<g:submitButton name="algo" id="algo" value="Liquidar" action="armarLiquidacion"/>--}%
    %{--</div>--}%
    <input type="button"
           id="liquidarBtn"
           value="Armar Liquidaciones"/>
    <fieldset>
        <div id="confirmarLiquidacionDiv">
            <g:render template="confirmarLiquidacion"/>
        </div>
    </fieldset>
</div>

</body>
</html>