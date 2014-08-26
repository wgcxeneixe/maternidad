<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoStock.label', default: 'MovimientoStock')}" />
        <script>
            $(function() {

                //idioma de los calendar
                jQuery.datepicker.regional[ "es" ];
                updateDatePicker();

                jQuery("#spinner").ajaxComplete(function (event, request, settings) {
                    updateDatePicker();
                });

                $("#producto").select2({allowClear: true});


                $("#destino").select2({allowClear: true});

                var selected = $("#divradio input[type='radio']:checked");

               if ( selected.val()=='true'){

                $("#divdestino").hide();
               }

                $("#divradio input[type='radio']").change(function(){

                    var selected = $("#divradio input[type='radio']:checked");

                    if ( selected.val()=='false'){

                        $("#divdestino").show();
                    }
                    else{
                        $("#divdestino").hide();
                    }
                });





$("#boton").click(function( event ) {
    event.preventDefault();
   if ( $("#divradio input[type='radio']:checked").val() == 'true')  {
    //es ingreso
       $("#formulario").submit();
   } else {
    // es egreso
     var cant=  $("#cantidad").val();
     var producto=  $("#producto").val();


      if(!existeStock( cant , producto )) {

          if (confirm('${message(code: 'stock.nohaystock', default: 'No existe Stock suficiente. Desea Continuar?')}')) {
              $("#formulario").submit();
          }

      }
       else if (!existeCantidadMinima( cant , producto )){

          if (confirm('${message(code: 'stock.nohaycantidadminima', default: 'El producto quedara por debajo de la cantidad mínima. Desea Continuar?')}')) {
              $("#formulario").submit();
          }

      }
       else {   $("#formulario").submit(); }

   }

});


            });


            function existeStock(cantidad,producto){
                var resultado=false;
                var url = "${createLink(controller:'movimientoStock', action:'chequearCantidad')}";

                jQuery.ajax({
                    url:url,
                    dataType: 'json',
                    type:'POST',
                    async:false,
                    data: {
                        cantidad: cantidad,producto:producto
                    },
                    success: function(data) {
                        resultado=data.resultado;
                    },
                    error: function(request, status, error) {
                    },
                    complete: function() {
                        //alert(data);
                    }
                });

                return resultado;
            }


            function existeCantidadMinima(cantidad,producto){
                var resultado=false;
                var url = "${createLink(controller:'movimientoStock', action:'chequearMinimo')}";

                jQuery.ajax({
                    url:url,
                    dataType: 'json',
                    type:'POST',
                    async:false,
                    data: {
                        cantidad: cantidad,producto:producto
                    },
                    success: function(data) {
                        resultado=data.resultado;
                    },
                    error: function(request, status, error) {
                    },
                    complete: function() {
                        //alert(data);
                    }
                });

                return resultado;
            }


        </script>

				<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-movimientoStock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-movimientoStock" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${movimientoStockInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${movimientoStockInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:movimientoStockInstance, action:'save']"  id="formulario" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" id="boton" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
