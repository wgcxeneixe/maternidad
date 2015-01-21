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
    <g:each in="${maternidad.ConceptoProfesional?.list() }" status="i" var="conceptoProfesional">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


            <td> <g:checkBox name="conceptos"  value="${conceptoProfesional?.id}"  checked="${conceptoProfesional?.id in conceptos?.conceptoProfesional?.id}"   ></g:checkBox></td>

            <td> ${conceptoProfesional?.nombre} </td>

            <td>
                <g:field type="number" step="any" name="${'valor'+conceptoProfesional?.id}"    value="${ conceptoProfesional?.id in conceptos?.conceptoProfesional?.id ? maternidad.ConceptoPorProfesional.findByConceptoProfesionalAndProfesional(conceptoProfesional,profesional).montoFijo:'0'}" />  </td>

      <td>
          <g:field type="number" step="any" name="${'porcentaje'+conceptoProfesional?.id}"    value="${ conceptoProfesional?.id in conceptos?.conceptoProfesional?.id ? maternidad.ConceptoPorProfesional.findByConceptoProfesionalAndProfesional(conceptoProfesional,profesional).porcentaje:'0'}" />
      </td>

            <td>
                <g:checkBox name="${'unicavez'+conceptoProfesional?.id}"    value="${ conceptoProfesional?.id in conceptos?.conceptoProfesional?.id ? maternidad.ConceptoPorProfesional.findByConceptoProfesionalAndProfesional(conceptoProfesional,profesional).porUnicaVez:false}" />
            </td>

            <td>
                <g:textField name="${'observacion'+conceptoProfesional?.id}"    value="${ conceptoProfesional?.id in conceptos?.conceptoProfesional?.id ? maternidad.ConceptoPorProfesional.findByConceptoProfesionalAndProfesional(conceptoProfesional,profesional).observacion:''}" />
            </td>

            <td>
                <g:checkBox checked="true" name="${'activo'+conceptoProfesional?.id}"    value="${ conceptoProfesional?.id in conceptos?.conceptoProfesional?.id ? maternidad.ConceptoPorProfesional.findByConceptoProfesionalAndProfesional(conceptoProfesional,profesional).activo:false}" />
            </td>


        </tr>
    </g:each>
    </tbody>


</table>