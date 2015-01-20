<table class="ajax">
    <thead>
    <tr>

        <g:sortableColumn property="codigo" title="${message(code: 'convenio.codigo.label', default: 'Codigo')}" params="${filters}" />

        <th><g:message code="convenio.obrasocial.label" default="Obrasocial" params="${filters}" /></th>

        <g:sortableColumn property="fechaInicio" title="${message(code: 'convenio.fechaInicio.label', default: 'Fecha Inicio')}" params="${filters}" />

        <g:sortableColumn property="fechaFin" title="${message(code: 'convenio.fechaFin.label', default: 'Fecha Fin')}" params="${filters}" />

        <g:sortableColumn property="activo" title="${message(code: 'convenio.activo.label', default: 'Activo')}" params="${filters}" />

        <g:sortableColumn property="observacion" title="${message(code: 'convenio.observacion.label', default: 'Observacion')}" params="${filters}" />
        <th></th>
        <th></th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${convenioInstanceList}" status="i" var="convenioInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>${fieldValue(bean: convenioInstance, field: "codigo")}</td>

            <td>${fieldValue(bean: convenioInstance, field: "obrasocial")}</td>

            <td><g:formatDate date="${convenioInstance.fechaInicio}" format="dd-MM-yyyy" /></td>

            <td><g:formatDate date="${convenioInstance.fechaFin}" format="dd-MM-yyyy" /></td>

            <td><g:formatBoolean boolean="${convenioInstance.activo}" /></td>

            <td>${ (convenioInstance?.observacion?.size()>=50)? convenioInstance?.observacion?.substring(0,50) +' ...':convenioInstance?.observacion}</td>

            <td><g:link class="linkEdit" controller="convenio" action="edit" id="${convenioInstance.id}">${message(code: 'default.button.edit.label')}</g:link></td>

            <td><g:link class="linkShow" controller="convenio" action="show" id="${convenioInstance.id}">${message(code: 'default.button.show.label')}</g:link></td>

            <td>

                <g:link action="verPlanes" controller="convenio" id="${convenioInstance.id}">${message(code: 'convenio.planes')}</g:link>

            </td>

            <td>

                <g:link action="duplicar" controller="convenio" id="${convenioInstance.id}">${message(code: 'convenio.duplicar')}</g:link>

            </td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${convenioInstanceCount ?: 0}" params="${filters}" />
</div>