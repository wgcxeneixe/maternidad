<%--
  Created by IntelliJ IDEA.
  User: walter
  Date: 23/09/2014
  Time: 12:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
		<meta name="layout" content="main">

<title>Inicio</title>
</head>

<div id="controller-list" role="navigation">
    <h2>Available Controllers:</h2>
    <ul>
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
        </g:each>

    </ul>

</div>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<body>

</body>
</html>