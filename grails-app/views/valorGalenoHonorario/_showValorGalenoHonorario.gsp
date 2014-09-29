
<table>
    <thead>
    <tr>

        <th>Tipo de Honorario</th>
        <th> Valor </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${maternidad.TipoHonorario.list() }" status="i" var="honorario">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


            <td>${honorario?.sigla+" - "+honorario?.descripcion}
            </td>

            <td>
                ${ honorario?.id in planConvenio?.valoresGalenoHonorario?.tipoHonorario?.id ? maternidad.ValorGalenoHonorario.findByPlanConvenioAndTipoHonorario(planConvenio,honorario)?.valor:'0'}  </td>
        </tr>
    </g:each>
    </tbody>


</table>



