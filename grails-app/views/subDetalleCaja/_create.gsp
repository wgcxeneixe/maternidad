<div id="create-subDetalleCaja" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="['Detalle Movimiento']" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${subDetalleCajaInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${subDetalleCajaInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:subDetalleCajaInstance, action:'save']" >
        <div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'conceptocaja', 'error')} ">
            <label for="conceptocaja">
                <g:message code="subDetalleCaja.conceptocaja.label" default="Conceptocaja" />

            </label>
            <g:select id="conceptocaja" name="conceptocaja.id" from="${maternidad.ConceptoCaja.list()}" optionKey="id" value="${subDetalleCajaInstance?.conceptocaja?.id}" class="many-to-one" noSelection="['null': '']"/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'credito', 'error')} ">
            <label for="credito">
                <g:message code="subDetalleCaja.credito.label" default="Credito" />

            </label>
            <g:checkBox name="credito" value="${subDetalleCajaInstance?.credito}" />

        </div>

        <div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'monto', 'error')} required">
            <label for="monto">
                <g:message code="subDetalleCaja.monto.label" default="Monto" />
                <span class="required-indicator">*</span>
            </label>
            <g:field name="monto" value="${fieldValue(bean: subDetalleCajaInstance, field: 'monto')}" required=""/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: subDetalleCajaInstance, field: 'observaciones', 'error')} ">
            <label for="observaciones">
                <g:message code="subDetalleCaja.observaciones.label" default="Observaciones" />

            </label>
            <g:textArea name="observaciones" cols="40" rows="5" maxlength="5000" value="${subDetalleCajaInstance?.observaciones}"/>

        </div>

        <g:hiddenField name="detalleCaja.id" value="${subDetalleCajaInstance?.detalleCaja?.id}"/>

        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</div>