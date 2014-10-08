

<table>
    <thead>
    <tr>

        <th>Tipo de Gasto</th>
        <th> Valor </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${maternidad.TipoGasto?.list() }" status="i" var="gasto">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td> ${gasto?.sigla+" - "+gasto?.descripcion} </td>

            <td>
                ${ gasto?.id in planConvenio?.valoresGalenoGasto?.tipoGasto?.id ? maternidad.ValorGalenoGasto.findByPlanConvenioAndTipoGasto(planConvenio,gasto)?.valor:'0'} </td>
        </tr>
    </g:each>
    </tbody>


</table>