
<table>
    <thead>
    <tr>
        <th>  </th>
        <th>Tipo de Honorario</th>
        <th> Valor </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${maternidad.TipoHonorario.list() }" status="i" var="honorario">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


            <td> <g:checkBox name="honorarios"  value="${honorario?.id}" readonly="true"  checked="${honorario?.id in planConvenio?.valoresGalenoHonorario?.tipoHonorario?.id}"   ></g:checkBox></td>

            <td>${honorario?.sigla+" - "+honorario?.descripcion}
            </td>

            <td>
                <g:textField name="${'valor'+honorario?.id}"  readonly="true"  value="${ honorario?.id in planConvenio?.valoresGalenoHonorario?.tipoHonorario?.id ? maternidad.ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio,honorario)?.valor:'0'}" />  </td>
        </tr>
    </g:each>
    </tbody>


</table>