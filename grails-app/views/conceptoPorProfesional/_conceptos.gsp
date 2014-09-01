<table>
    <thead>
    <tr>
        <th>  </th>
        <th>Concepto</th>
        <th> Monto Fijo </th>
        <th> Porcentaje </th>
        <th> Por única vez </th>
        <th> Observaciones </th>
        <th> Activo </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${maternidad.ConceptoLiquidacion.list() }" status="i" var="conceptoLiquidacion">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


            <td> <g:checkBox name="conceptos"  value="${conceptoLiquidacion?.id}"  checked="${conceptoLiquidacion?.id in conceptos?.conceptoLiquidacion?.id}"   ></g:checkBox></td>

            <td> ${conceptoLiquidacion?.nombre} </td>

            <td>
                <g:textField name="${'valor'+conceptoLiquidacion?.id}"    value="${ conceptoLiquidacion?.id in conceptos?.conceptoLiquidacion?.id ? maternidad.ConceptoPorProfesional.findByConceptoLiquidacionAndProfesional(conceptoLiquidacion,profesional).montoFijo:'0'}" />  </td>

      <td>
          <g:textField name="${'porcentaje'+conceptoLiquidacion?.id}"    value="${ conceptoLiquidacion?.id in conceptos?.conceptoLiquidacion?.id ? maternidad.ConceptoPorProfesional.findByConceptoLiquidacionAndProfesional(conceptoLiquidacion,profesional).porcentaje:'0'}" />
      </td>

            <td>
                <g:checkBox name="${'unicavez'+conceptoLiquidacion?.id}"    value="${ conceptoLiquidacion?.id in conceptos?.conceptoLiquidacion?.id ? maternidad.ConceptoPorProfesional.findByConceptoLiquidacionAndProfesional(conceptoLiquidacion,profesional).porUnicaVez:false}" />
            </td>

            <td>
                <g:textField name="${'observacion'+conceptoLiquidacion?.id}"    value="${ conceptoLiquidacion?.id in conceptos?.conceptoLiquidacion?.id ? maternidad.ConceptoPorProfesional.findByConceptoLiquidacionAndProfesional(conceptoLiquidacion,profesional).observacion:''}" />
            </td>

            <td>
                <g:checkBox name="${'activo'+conceptoLiquidacion?.id}"    value="${ conceptoLiquidacion?.id in conceptos?.conceptoLiquidacion?.id ? maternidad.ConceptoPorProfesional.findByConceptoLiquidacionAndProfesional(conceptoLiquidacion,profesional).activo:false}" />
            </td>


        </tr>
    </g:each>
    </tbody>


</table>