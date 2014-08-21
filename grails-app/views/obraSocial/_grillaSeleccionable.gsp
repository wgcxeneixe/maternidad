<table class="ajax">
    <thead>
    <tr>
         <td></td>
        <g:sortableColumn property="sigla" title="${message(code: 'obraSocial.sigla.label', default: 'Sigla')}" params="${filters}" />

        <g:sortableColumn property="nombre" title="${message(code: 'obraSocial.nombre.label', default: 'Nombre')}" params="${filters}" />

        <g:sortableColumn property="codigo" title="${message(code: 'obraSocial.codigo.label', default: 'Codigo')}" params="${filters}" />

        <g:sortableColumn property="cuit" title="${message(code: 'obraSocial.cuit.label', default: 'Cuit')}" params="${filters}" />

        <g:sortableColumn property="observacion" title="${message(code: 'obraSocial.observacion.label', default: 'Observacion')}" params="${filters}" />

        <g:sortableColumn property="activa" title="${message(code: 'obraSocial.activa.label', default: 'Activa')}" params="${filters}" />

    </tr>
    </thead>
    <tbody>
    <g:each in="${obraSocialInstanceList}" status="i" var="obraSocialInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:radio name="seleccion" value="${obraSocialInstance.id}"/></td>

            <td><g:link action="show" id="${obraSocialInstance.id}">${fieldValue(bean: obraSocialInstance, field: "sigla")}</g:link></td>

            <td>${fieldValue(bean: obraSocialInstance, field: "nombre")}</td>

            <td>${fieldValue(bean: obraSocialInstance, field: "codigo")}</td>

            <td>${fieldValue(bean: obraSocialInstance, field: "cuit")}</td>

            <td>${fieldValue(bean: obraSocialInstance, field: "observacion")}</td>

            <td><g:formatBoolean boolean="${obraSocialInstance.activa}" /></td>

        </tr>
    </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${obraSocialInstanceCount ?: 0}" params="${filters}" />
</div>