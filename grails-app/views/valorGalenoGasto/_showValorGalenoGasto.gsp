<!--<table>
    <tbody>

    <tr class="prop">
        <td valign="top" class="name">
            <label for="convenio">Convenio</label>
        </td>
        <td valign="top" class="value ">
            <g:hiddenField   name="planConvenio" value="${planConvenio?.id}" />
            <g:textField readonly="true" id="convenio" name="convenio" value="${planConvenio?.convenio?.encodeAsHTML()}" />
        </td>
    </tr>




    </tbody>
</table>
-->

<table>
    <thead>
    <tr>
        <th>  </th>
        <th>Tipo de Gasto</th>
        <th> Valor </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${maternidad.TipoGasto?.list() }" status="i" var="gasto">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


            <td> <g:checkBox name="gastos"  value="${gasto?.id}" readonly="true"  checked="${gasto?.id in planConvenio?.valoresGalenoGasto?.tipoGasto?.id}"   ></g:checkBox></td>

            <td> ${gasto?.sigla+" - "+gasto?.descripcion} </td>

            <td>
                <g:textField name="${'valor'+gasto?.id}"  readonly="true"  value="${ gasto?.id in planConvenio?.valoresGalenoGasto?.tipoGasto?.id ? maternidad.ValorGalenoGasto.findByPlanConvenioAndTipoGasto(planConvenio,gasto)?.valor:'0'}" />  </td>
        </tr>
    </g:each>
    </tbody>


</table>