<%@ page import="maternidad.Componente; maternidad.Practica" %>



<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'nombre', 'error')} required">
    <label for="nombre">
        <g:message code="practica.nombre.label" default="Nombre" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombre" maxlength="120" required="" value="${practicaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'codigo', 'error')} required">
    <label for="codigo">
        <g:message code="practica.codigo.label" default="Codigo" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="codigo" maxlength="10" required="" value="${practicaInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'observacion', 'error')} ">
    <label for="observacion">
        <g:message code="practica.observacion.label" default="Observacion" />

    </label>
    <g:textArea name="observacion" cols="40" rows="5" maxlength="5000" value="${practicaInstance?.observacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'nomenclada', 'error')} ">
    <label for="nomenclada">
        <g:message code="practica.nomenclada.label" default="Nomenclada" />

    </label>
    <g:checkBox name="nomenclada" value="${practicaInstance?.nomenclada}" />

</div>

<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'modulo', 'error')} ">
    <label for="modulo">
        <g:message code="practica.modulo.label" default="Modulo" />

    </label>
    <g:checkBox name="modulo" value="${practicaInstance?.modulo}" />

</div>


<div class="fieldcontain ${hasErrors(bean: practicaInstance, field: 'obrasocial', 'error')} ">
    <label for="obrasocial">
        <g:message code="practica.obrasocial.label" default="Obrasocial" />

    </label>
    <g:select id="obrasocial" name="obrasocial.id" from="${maternidad.ObraSocial.list()}" optionKey="id" value="${practicaInstance?.obrasocial?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>


<g:message code="nomenclador.gastos" default="Gastos"/>

<table>
    <tr>
        <td>Unidad</td>
        <td>Tipo</td>
    </tr>

        <tr>
            <td><g:field type="number" step="any"  name="valorGasto" value="${(practicaInstance?.id)?maternidad.ValorUnidadGasto.findByPractica(practicaInstance as Practica)?.valor:''}"/></td>
            <td><g:select id="tipoGasto" name="tipoGasto.id" from="${maternidad.TipoGasto.list()}" optionKey="id"  class="many-to-one" value="${(practicaInstance?.id)?maternidad.ValorUnidadGasto.findByPractica(practicaInstance)?.tipoGasto?.id:''}" /></td>

        </tr>

</table>

<br>

<g:message code="nomenclador.honorarios" default="Honorarios"/>

<table>

    <tr>

        <td>Tipo</td>
    </tr>

    <tr>

        <td><g:select id="tipoHonorario" name="tipoHonorario.id" from="${maternidad.TipoHonorario.list()}" optionKey="id" value="${practicaInstance?.tipoHonorario?.id}" class="many-to-one" noSelection="['null': '']"/></td>
    </tr>

</table>

<table>
    <tr>
        <td>Especialista</td>
        <td>Ayudante</td>
        <td>Anestesista</td>
    </tr>

        <tr>
            <td><g:field type="number" step="any" name="valorEspecialista" value="${(practicaInstance?.id)?maternidad.ValorUnidadHonorario.findByPracticaAndComponente(practicaInstance,Componente.findById(3))?.valor:null}"/></td>
            <td><g:field type="number" step="any" name="valorAyudante" value="${(practicaInstance?.id)?maternidad.ValorUnidadHonorario.findByPracticaAndComponente(practicaInstance,Componente.findById(1))?.valor:null}"/></td>
            <td><g:field type="number" step="any" name="valorAnestesista" value="${(practicaInstance?.id)?maternidad.ValorUnidadHonorario.findByPracticaAndComponente(practicaInstance,Componente.findById(2))?.valor:null}"/></td>
        </tr>

</table>



<script>

    $(function() {
        jQuery('#tipoGasto option[value="${(practicaInstance?.id)?maternidad.ValorUnidadGasto.findByPractica(practicaInstance)?.tipoGasto?.id:''}"]').prop('selected', true);
        jQuery('#tipoHonorario option[value="${practicaInstance?.tipoHonorario?.id}"]').prop('selected', true);
    })

</script>