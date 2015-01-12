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
        $(function () {
            $("select").multiselect({
                selectedList: 4
            });
            $("select").multiselect().multiselectfilter();

        });
    </script>
</head>

<body>
<div>
    <select id="example" name="example" multiple="multiple">
        <option value="1">Option 1</option>
        <option value="2">Option 2</option>
        <option value="3">Option 3</option>
        <option value="4">Option 4</option>
        <option value="5">Option 5</option>
    </select>
</div>
</body>
</html>