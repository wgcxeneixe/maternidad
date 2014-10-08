<%@ page import="maternidad.CajaDiaria" %>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'fechaApertura', 'error')} required">
	<label for="fechaApertura">
		<g:message code="cajaDiaria.fechaApertura.label" default="Fecha Apertura" />

	</label>
        <g:formatDate type="datetime" readonly="readonly" style="LONG" timeStyle="SHORT"  precision="minute"  date="${cajaDiariaInstance?.fechaApertura}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'usuarioApertura', 'error')} required">
    <label for="usuarioApertura">
        <g:message code="cajaDiaria.usuarioApertura.label" default="Usuario Apertura" />

    </label>
    <g:fieldValue bean="${cajaDiariaInstance}" field="usuarioApertura"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'saldoInicial', 'error')} required">
    <label for="saldoInicial">
        <g:message code="cajaDiaria.saldoInicial.label" default="Saldo Inicial" />

    </label>
    <!-- No se puede editar si la fecha de cierra ya esta establecida -->
    <g:if test="${cajaDiariaInstanceCerrada == false}">
        <g:textField name="saldoInicial" value="${fieldValue(bean: cajaDiariaInstance, field: 'saldoInicial')}" required=""/>
    </g:if>
    <g:else>
        $ <g:fieldValue bean="${cajaDiariaInstance}" field="saldoInicial"/>

    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'fechaCierre', 'error')} ">
	<label for="fechaCierre">
		<g:message code="cajaDiaria.fechaCierre.label" default="Fecha Cierre" />
		
	</label>
        <g:formatDate type="datetime" style="LONG" timeStyle="SHORT" readonly="readonly"  precision="minute"  date="${cajaDiariaInstance?.fechaCierre}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'usuarioCierre', 'error')} ">
    <label for="usuarioCierre">
        <g:message code="cajaDiaria.usuarioCierre.label" default="Usuario Cierre" />

    </label>
    <g:fieldValue bean="${cajaDiariaInstance}" field="usuarioCierre"/>

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
        $ <g:fieldValue bean="${cajaDiariaInstance}" field="saldoFinal"/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: cajaDiariaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="cajaDiaria.observaciones.label" default="Observaciones" />
	</label>
	<g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${cajaDiariaInstance?.observaciones}"/>
</div>

<g:if test="${cajaDiariaInstance?.detallesCaja}">
<g:render template="lista"/>
</g:if>

