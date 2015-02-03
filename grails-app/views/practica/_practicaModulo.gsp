

<g:each in="${loopCount}" var="idx">
    <script>
  var idx='${idx}';
        jQuery("#practica"+idx).select2({allowClear: true});

    </script>
    <tr>
        <td style="visibility: hidden"><input type="checkbox" checked="true" name="practicas" value="${idx}"></td>
        <td>   <g:select  name="practica${idx}" from="${maternidad.Practica.findByNomenclada(Boolean.TRUE).list()}" optionKey="id"  class="many-to-one" />
        </td>
        <td>   Valor Gasto<input type="text" name="valorGasto${idx}"> </td>
        <td>   Valor Especialista<input type="text" name="valorEspecialista${idx}"> </td>
        <td>   Valor Ayudante<input type="text" name="valorAyudante${idx}"> </td>
        <td>   Valor Anestesista<input type="text" name="valorAnestesista${idx}"> </td>

    </tr>


</g:each>