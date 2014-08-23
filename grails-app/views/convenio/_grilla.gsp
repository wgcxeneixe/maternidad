<table class="ajax">
    <thead>
    <tr>

        <g:sortableColumn property="codigo" title="${message(code: 'convenio.codigo.label', default: 'Codigo')}" params="${filters}" />

        <th><g:message code="convenio.obrasocial.label" default="Obrasocial" params="${filters}" /></th>

        <g:sortableColumn property="fechaInicio" title="${message(code: 'convenio.fechaInicio.label', default: 'Fecha Inicio')}" params="${filters}" />

        <g:sortableColumn property="fechaFin" title="${message(code: 'convenio.fechaFin.label', default: 'Fecha Fin')}" params="${filters}" />

        <g:sortableColumn property="activo" title="${message(code: 'convenio.activo.label', default: 'Activo')}" params="${filters}" />

        <g:sortableColumn property="observacion" title="${message(code: 'convenio.observacion.label', default: 'Observacion')}" params="${filters}" />

        <th>Planes</th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${convenioInstanceList}" status="i" var="convenioInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${convenioInstance.id}">${fieldValue(bean: convenioInstance, field: "codigo")}</g:link></td>

            <td>${fieldValue(bean: convenioInstance, field: "obrasocial")}</td>

            <td><g:formatDate date="${convenioInstance.fechaInicio}" /></td>

            <td><g:formatDate date="${convenioInstance.fechaFin}" /></td>

            <td><g:formatBoolean boolean="${convenioInstance.activo}" /></td>

            <td>${fieldValue(bean: convenioInstance, field: "observacion")}</td>

           <td>

               <g:link action="agregarPlan" id="${convenioInstance.id}">Agregar Plan</g:link>

               <g:if test="${convenioInstance.planConvenio}">
                   <g:link action="verPlanes" id="${convenioInstance.id}">Ver Planes</g:link>
               </g:if>

           </td>


        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${convenioInstanceCount ?: 0}" params="${filters}" />
</div>