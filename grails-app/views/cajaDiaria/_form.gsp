<%@ page import="maternidad.CajaDiaria" %>



<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'fechaApertura', 'error')} required">
	<label for="fechaApertura">
		<g:message code="cajaDiaria.fechaApertura.label" default="Fecha Apertura" />
		<span class="required-indicator">*</span>
	</label>
    <g:datePicker name="fechaApertura" precision="minute"  value="${cajaDiariaInstance?.fechaApertura}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'saldoInicial', 'error')} required">
	<label for="saldoInicial">
		<g:message code="cajaDiaria.saldoInicial.label" default="Saldo Inicial" />
		<span class="required-indicator">*</span>
	</label>
    <g:textField name="saldoInicial" value="${fieldValue(bean: cajaDiariaInstance, field: 'saldoInicial')}" required=""/>
 </div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="cajaDiaria.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${cajaDiariaInstance?.observaciones}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'usuarioApertura', 'error')} required">
	<label for="usuarioApertura">
		<g:message code="cajaDiaria.usuarioApertura.label" default="Usuario Apertura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuarioApertura" name="usuarioApertura.id" from="${maternidad.Usuario.list()}" optionKey="id" required="" value="${cajaDiariaInstance?.usuarioApertura?.id}" class="many-to-one"/>

</div>