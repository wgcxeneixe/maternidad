<%@ page import="maternidad.CajaDiaria" %>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'usuarioApertura', 'error')} required">
    <label for="usuarioApertura">
        <g:message code="cajaDiaria.usuarioApertura.label" default="Usuario Apertura" />
        <span class="required-indicator">*</span>
    </label>
    <g:fieldValue bean="${cajaDiariaInstance}" field="usuarioApertura"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'fechaApertura', 'error')} required">
	<label for="fechaApertura">
		<g:message code="cajaDiaria.fechaApertura.label" default="Fecha Apertura" />
		<span class="required-indicator">*</span>
	</label>
    <!-- No se puede editar si la fecha de cierra ya esta establecida -->
    <g:if test="${cajaDiariaInstanceCerrada == false}">
	    <g:datePicker name="fechaApertura" precision="minute"  value="${cajaDiariaInstance?.fechaApertura}"  />
    </g:if>
    <g:else>
        <g:formatDate type="datetime" readonly="readonly" style="LONG" timeStyle="SHORT" name="fechaApertura" precision="minute"  date="${cajaDiariaInstance?.fechaApertura}"  />
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'saldoInicial', 'error')} required">
    <label for="saldoInicial">
        <g:message code="cajaDiaria.saldoInicial.label" default="Saldo Inicial" />
        <span class="required-indicator">*</span>
    </label>
    <!-- No se puede editar si la fecha de cierra ya esta establecida -->
    <g:if test="${cajaDiariaInstanceCerrada == false}">
        <g:textField name="saldoInicial" value="${fieldValue(bean: cajaDiariaInstance, field: 'saldoInicial')}" required=""/>
    </g:if>
    <g:else>
        <g:textField name="saldoInicial" readonly="readonly" value="${fieldValue(bean: cajaDiariaInstance, field: 'saldoInicial')}" required=""/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'fechaCierre', 'error')} ">
	<label for="fechaCierre">
		<g:message code="cajaDiaria.fechaCierre.label" default="Fecha Cierre" />
		
	</label>
    <!-- No se puede editar si la fecha de cierra ya esta establecida -->
    <g:if test="${cajaDiariaInstanceCerrada == false}">
	    <g:datePicker name="fechaCierre" precision="minute"  value="${cajaDiariaInstance?.fechaCierre}" default="none" noSelection="['': '']" />
    </g:if>
    <g:else>
        <g:formatDate type="datetime" style="LONG" timeStyle="SHORT" readonly="readonly"  name="fechaCierre" precision="minute"  date="${cajaDiariaInstance?.fechaCierre}" default="none" noSelection="['': '']" />
    </g:else>
</div>



<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'saldoFinal', 'error')} ">
	<label for="saldoFinal">
		<g:message code="cajaDiaria.saldoFinal.label" default="Saldo Final" />
		
	</label>
    <!-- No se puede editar si la fecha de cierra ya esta establecida -->
    <g:if test="${cajaDiariaInstanceCerrada == false}">
        <g:textField name="saldoFinal"  value="${fieldValue(bean: cajaDiariaInstance, field: 'saldoFinal')}"/>
    </g:if>
    <g:else>
        <g:textField name="saldoFinal" readonly="readonly"  value="${fieldValue(bean: cajaDiariaInstance, field: 'saldoFinal')}"/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="cajaDiaria.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${cajaDiariaInstance?.observaciones}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'usuarioCierre', 'error')} ">
	<label for="usuarioCierre">
		<g:message code="cajaDiaria.usuarioCierre.label" default="Usuario Cierre" />
		
	</label>
	<g:select id="usuarioCierre" name="usuarioCierre.id" from="${maternidad.Usuario.list()}" optionKey="id" value="${cajaDiariaInstance?.usuarioCierre?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<!--
<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'detallesCaja', 'error')} ">
	<label for="detallesCaja">
		<g:message code="cajaDiaria.detallesCaja.label" default="Detalles Caja" />
		
	</label>
<ul class="one-to-many">
<g:each in="${cajaDiariaInstance?.detallesCaja?}" var="d">
    <li><g:link controller="detalleCaja" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleCaja" action="create" params="['cajaDiaria.id': cajaDiariaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleCaja.label', default: 'DetalleCaja')])}</g:link>
</li>
</ul>
</div>
-->
<g:if test="${cajaDiariaInstance?.detallesCaja}">
<g:render template="lista"/>
</g:if>

