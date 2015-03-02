<%--
  Created by IntelliJ IDEA.
  User: leandro
  Date: 1/03/15
  Time: 16:34
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Diario</title>
</head>

<body>
<g:form>
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.errors}">
        <div class="error" role="status">${flash.errors}</div>
    </g:if>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="InputBr">
        <span class="label_input">
            <label>Desde:</label>
        </span>
        <span>
            <g:datePicker name="fechaDesde" precision="day" value="${fechaDesde}"/>
        </span>
    </div>

    <div class="InputBr">
        <span class="label_input">
            <label>Hasta:</label>
        </span>
        <span>
            <g:datePicker name="fechaHasta" precision="day" value="${fechaHasta}"/>
        </span>
    </div>
    <fieldset class="buttons">
        <g:actionSubmit name="consultar" value="Consultar" action="consultar"/>
    </fieldset>

    <table>
        <thead>
        <tr>

            <th><g:message code="movimiento.asiento.label" default="Asiento Nº"/></th>

            <g:sortableColumn property="fecha" title="${message(code: 'movimiento.fecha.label', default: 'Fecha')}"/>

            <th><g:message code="movimiento.cuenta.label" default="Cuenta"/></th>

            <g:sortableColumn property="descripcion"
                              title="${message(code: 'movimiento.descripcion.label', default: 'Descripcion')}"/>

            <g:sortableColumn property="debe" title="${message(code: 'movimiento.debe.label', default: 'Debe')}"/>

            <g:sortableColumn property="haber" title="${message(code: 'movimiento.haber.label', default: 'Haber')}"/>

        </tr>
        </thead>
        <tbody>
        <g:if test="${asientoInstanceList}">
            <g:each in="${asientoInstanceList}" status="i" var="asientoInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}" style="background-color: #ffff00">
                    <td>${fieldValue(bean: asientoInstance, field: "numero")}</td>

                    <td><g:formatDate date="${asientoInstance.fecha}" format="dd/MM/yyyy"/></td>

                    <td></td>

                    <td></td>

                    <td></td>

                    <td></td>
                </tr>

                <g:each in="${asientoInstance?.movimientos}" status="k" var="movimientoInstance">
                    <tr class="${(k % 2) == 0 ? 'even' : 'odd'}">
                        <td></td>

                        <td></td>

                        <td>${fieldValue(bean: movimientoInstance, field: "cuenta")}</td>

                        <td>${fieldValue(bean: movimientoInstance, field: "descripcion")}</td>

                        <td>${fieldValue(bean: movimientoInstance, field: "debe")}</td>

                        <td>${fieldValue(bean: movimientoInstance, field: "haber")}</td>
                    </tr>
                </g:each>

                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}" style="background-color: darkseagreen">
                    <td></td>

                    <td></td>

                    <td></td>

                    <td></td>

                    <td>${fieldValue(bean: asientoInstance, field: "totalDebe")}</td>

                    <td>${fieldValue(bean: asientoInstance, field: "totalHaber")}</td>
                </tr>
            </g:each>
        </g:if>
        </tbody>
    </table>
</g:form>
</body>
</html>