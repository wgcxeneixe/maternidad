<!DOCTYPE html>
<html lang="en" class="app"><!-- /ADD -->
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

    <g:javascript library='jquery' />
    <r:layoutResources/>


    <!-- Agrego la librería JQuery y JQueryUI -->
    <script  src="/maternidad/js/jquery-1.10.2/jquery.min.js"></script>
    <script src="/maternidad/js/jquery-ui-1.10.4/jquery-ui.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

    <!--    <link rel="stylesheet" href="/maternidad/css/application.css" type="text/css" />

    <script src="/maternidad/js/application.js"></script>  -->


    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <g:layoutHead/>


    <link rel="stylesheet" href="/maternidad/css/select2.css" type="text/css" />

    <link rel="stylesheet" href="/maternidad/css/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="/maternidad/css/jquery-ui-custom.css" type="text/css" />



    <!-- /ADD START -->
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />


    <link rel="stylesheet" href="/maternidad/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="/maternidad/css/animate.css" type="text/css" />
    <link rel="stylesheet" href="/maternidad/css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="/maternidad/css/icon.css" type="text/css" />
    <link rel="stylesheet" href="/maternidad/css/font.css" type="text/css" />
    <link rel="stylesheet" href="/maternidad/css/app.css" type="text/css" />
    <link rel="stylesheet" href="/maternidad/js/calendar/bootstrap_calendar.css" type="text/css" />
    <!--[if lt IE 9]>
    <script src="/maternidad/js/ie/html5shiv.js"></script>
    <script src="/maternidad/js/ie/respond.min.js"></script>
    <script src="/maternidad/js/ie/excanvas.js"></script>
    <![endif]-->
    <!-- /ADD END -->


    <link rel="stylesheet" href="/maternidad/css/styles.css" type="text/css" />

    <!-- Agrego la máscara -->
    <script src="/maternidad/js/jQuery-Mask-Plugin/jquery.mask.min.js"></script>

</head>
<body>


<!-- /ADD START -->
<section class="vbox">

<section>
<section class="hbox stretch">
<!-- .aside -->
<aside class="bg-black aside-md hidden-print" id="nav">
<section class="vbox">
<section class="w-f scrollable">
<div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">
<div class="clearfix wrapper dk nav-user hidden-xs">
    <div class="dropdown">
        <span class="hidden-nav-xs clear">
            <a href="${createLink(controller:'home',action: 'index')}" class="navbar-brand">
                <img src="/maternidad/css/maternidad.png" class="m-r-sm" alt="scale">
            </a>
        </span>
        <ul class="dropdown-menu animated fadeInRight m-t-xs">
            <li>
                <span class="arrow top hidden-nav-xs"></span>
                <a href="#">Configuracion</a>
            </li>
            <li>
                <a href="profile.html">Perfil</a>
            </li>
            <li>
                <a href="#">
                    <span class="badge bg-danger pull-right">3</span>
                    Notificationes
                </a>
            </li>
            <li>
                <a href="docs.html">Ayuda</a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="modal.lockme.html" data-toggle="ajaxModal" >Logout</a>
            </li>
        </ul>
    </div>
</div>


<!-- nav -->
<nav class="nav-primary hidden-xs">
<div class="text-muted text-sm hidden-nav-xs padder m-t-sm m-b-sm">Inicio</div>
<ul class="nav nav-main" data-ride="collapse">
<li>
    <a href="${createLink(controller:'home',action: 'index')}" class="auto">
        <i class="i i-screen icon">
        </i>
        <span class="font-bold">INICIO</span>
    </a>
</li>

<li class="${(controllerName == 'cajaDiaria' || controllerName == 'detalleCaja' ) ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">CAJAS</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'cajaDiaria' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'cajaDiaria',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Caja Diaria</span>
            </a>
        </li>
        <li class="${(controllerName == 'detalleCaja' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'detalleCaja',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de detalle de cajas</span>
            </a>
        </li>
    </ul>
</li>

<li class="${controllerName == 'planillaInternacion' ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">PLANILLA INTERNACION</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'planillaInternacion' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'planillaInternacion',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de Planillas</span>
            </a>
        </li>
    </ul>
</li>


<li class="${(controllerName == 'movimientoStock' || controllerName == 'producto' || controllerName == 'destino'  ) ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">STOCK</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'producto' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'producto',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de Productos</span>
            </a>
        </li>
        <li class="${(controllerName == 'destino' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'destino',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de destinos</span>
            </a>
        </li>
        <li class="${(controllerName == 'movimientoStock' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'movimientoStock',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Movimientos Stock</span>
            </a>
        </li>
    </ul>
</li>


<li class="${controllerName == 'proveedor' ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">PROVEEDORES</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'proveedor' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'proveedor',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Listado</span>
            </a>
        </li>
        <li >
            <a href="${createLink(controller:'facturaProveedor',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Facturas Proveedor</span>
            </a>
        </li>
        <li >
            <a href="${createLink(controller:'proveedor',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Cuenta Corriente</span>
            </a>
        </li>
    </ul>
</li>


<li class="${(controllerName == 'obraSocial' || controllerName == 'plan' ) ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">OBRAS SOCIALES</span>
    </a>
    <ul class="nav dk">
        <li  class="${(controllerName == 'obraSocial' && actionName == 'index') ? 'active' : ''}" > <!-- /ActionName -->
            <a href="${createLink(controller:'obraSocial',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Listado</span>
            </a>
        </li>
        <li class="${(controllerName == 'obraSocial' && actionName == 'create') ? 'active' : ''}">
            <a href="${createLink(controller:'obraSocial',action: 'create')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Agregar Obra Social</span>
            </a>
        </li>
        <li class="${(controllerName == 'plan' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'plan',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Listado Planes</span>
            </a>
        </li>
        <li class="${(controllerName == 'obraSocial' && actionName == 'listaConvenios') ? 'active' : ''}">
            <a href="${createLink(controller:'obraSocial',action: 'listaConvenios')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Listado Convenios</span>
            </a>
        </li>

        <li class="${(controllerName == 'enteReceptor' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'enteReceptor',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Listado Ente Receptor</span>
            </a>
        </li>

    </ul>
</li>


<li class="${controllerName == 'convenio' ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">CONVENIOS</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'convenio' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'convenio',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Listado</span>
            </a>
        </li>
        <li class="${(controllerName == 'convenio' && actionName == 'create') ? 'active' : ''}">
            <a href="${createLink(controller:'convenio',action: 'create')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-arrow-right5"></i>
                <span>Agregar Convenio</span>
            </a>
        </li>
    </ul>
</li>



<li class="${controllerName == 'profesional' ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">PROFESIONALES</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'profesional' && actionName == 'index') ? 'active' : ''}" >
            <a href="${createLink(controller:'profesional',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de Profesionales</span>
            </a>
        </li>
    </ul>
</li>


<li class="${controllerName == 'banco' ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">BANCOS</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'banco' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'banco',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de Bancos</span>
            </a>
        </li>
        <li class="${(controllerName == 'movimientoBanco' && actionName == 'cuentaCorriente') ? 'active' : ''}">
            <a href="${createLink(controller:'movimientoBanco',action: 'cuentaCorriente')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Cuenta Corriente</span>
            </a>
        </li>
    </ul>
</li>








<li class="${controllerName == 'practica' ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">NOMENCLADOR</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'practica' && actionName == 'nomenclador') ? 'active' : ''}">
            <a href="${createLink(controller:'practica',action: 'nomenclador')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de Practicas</span>
            </a>
        </li>
    </ul>
</li>



<li class="${controllerName == 'factura' ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">FACTURACION</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'factura' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'factura',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de Facturas</span>
            </a>
        </li>
        <li class="${(controllerName == 'factura' && actionName == 'facturar') ? 'active' : ''}">
            <a href="${createLink(controller:'factura',action: 'facturar')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Facturar</span>
            </a>
        </li>
        <li class="${(controllerName == 'pagoFactura' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'facturaPeriodo',action: 'abrirPagarFactura')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Pago Facturas</span>
            </a>
        </li>
    </ul>
</li>



<li class="${controllerName == 'caja' ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">LIQUIDACION</span>
    </a>
    <ul class="nav dk">
        <li >
            <a href="${createLink(controller:'liquidacion',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Consultar Liquidaciones</span>
            </a>
        </li>
        <li >
            <a href="${createLink(controller:'liquidacion',action: 'configurarLiquidacion')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Liquidar</span>
            </a>
        </li>
    </ul>
</li>



<li class="${(controllerName == 'medicamento' || controllerName == 'tipoMedicamento' || controllerName == 'laboratorio') ? 'active' : ''}"> <!-- /Controller -->
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">MEDICAMENTOS</span>
    </a>
    <ul class="nav dk">
        <li class="${(controllerName == 'medicamento' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'medicamento',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dot"></i>
                <span>Listado de Medicamento</span>
            </a>
        </li>

        <li class="${(controllerName == 'tipoMedicamento' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'tipoMedicamento',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dots"></i>
                <span>Tipo Medicamento</span>
            </a>
        </li>

        <li class="${(controllerName == 'laboratorio' && actionName == 'index') ? 'active' : ''}">
            <a href="${createLink(controller:'laboratorio',action: 'index')}" class="auto"> <!-- /CreateLink -->
                <i class="i i-dots"></i>
                <span>Laboratorio</span>
            </a>
        </li>



    </ul>
</li>


<li class="${(controllerName == 'tipoDocumento' || controllerName == 'localidad' || controllerName == 'pais'
        || controllerName == 'provincia' || controllerName == 'tipoHonorario' || controllerName == 'tipoGasto' || controllerName == 'componente' || controllerName == 'componenteTipoHonorario'
        || controllerName == 'conceptoProveedor') ? 'active' : ''}">
    <a href="#" class="auto">
        <i class="i i-folder2 icon"></i>
        <span class="font-bold">GENERALES</span>
    </a>


    <ul class="nav dk">



        <li >
            <a href="#" class="auto">
                <i class="i i-plus"></i>
                <span>NOMENCLADOR</span>
            </a>
            <ul class="nav dker">

                <li class="${(controllerName == 'tipoHonorario' && actionName == 'index') ? 'active' : ''}">
                    <a href="${createLink(controller:'tipoHonorario',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Tipo Honorarios</span>
                    </a>
                </li>
                <li class="${(controllerName == 'tipoGasto' && actionName == 'index') ? 'active' : ''}">
                    <a href="${createLink(controller:'tipoGasto',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Tipo Gastos</span>
                    </a>
                </li>
                <li class="${(controllerName == 'componente' && actionName == 'index') ? 'active' : ''}">
                    <a href="${createLink(controller:'componente',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>

                        <span>Componente</span>
                    </a>
                </li>
                <li class="${(controllerName == 'componenteTipoHonorario' && actionName == 'index') ? 'active' : ''}">
                    <a href="${createLink(controller:'componenteTipoHonorario',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Comp. con Tipo Honorario</span>
                    </a>
                </li>


            </ul>
        </li>



        <li >
            <a href="#" class="auto">
                <i class="i i-plus"></i>
                <span>CONCEPTOS</span>
            </a>
            <ul class="nav dker">

                <li class="${(controllerName == 'conceptoPlan' && actionName == 'index') ? 'active' : ''}" >
                    <a href="${createLink(controller:'conceptoPlan',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Concepto Plan</span>
                    </a>
                </li>
                <li class="${(controllerName == 'conceptoProveedor' && actionName == 'index') ? 'active' : ''}" >
                    <a href="${createLink(controller:'conceptoProveedor',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Concepto Proveedor</span>
                    </a>
                </li>

                <li class="${(controllerName == 'conceptoProfesional' && actionName == 'index') ? 'active' : ''}" >
                    <a href="${createLink(controller:'conceptoProfesional',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Concepto Profesional</span>
                    </a>
                </li>
                <li class="${(controllerName == 'conceptoMovimientoProfesional' && actionName == 'index') ? 'active' : ''}" >
                    <a href="${createLink(controller:'conceptoMovimientoProfesional',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Concepto Mov. Profesional</span>
                    </a>
                </li>
                <li class="${(controllerName == 'conceptoCaja' && actionName == 'index') ? 'active' : ''}" >
                    <a href="${createLink(controller:'conceptoCaja',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Concepto Caja</span>
                    </a>
                </li>
                <li class="${(controllerName == 'conceptoBanco' && actionName == 'index') ? 'active' : ''}" >
                    <a href="${createLink(controller:'conceptoBanco',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Concepto Banco</span>
                    </a>
                </li>

            </ul>
        </li>


        <li >
            <a href="#" class="auto">
                <i class="i i-plus"></i>
                <span>DATOS PERSONALES</span>
            </a>
            <ul class="nav dker">

                <li class="${(controllerName == 'tipoDocumento' && actionName == 'index') ? 'active' : ''}" >
                    <a href="${createLink(controller:'tipoDocumento',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Tipo Documento </span>
                    </a>
                </li>
                <li class="${(controllerName == 'localidad' && actionName == 'index') ? 'active' : ''}">
                    <a href="${createLink(controller:'localidad',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Localidad</span>
                    </a>
                </li>
                <li class="${(controllerName == 'pais' && actionName == 'index') ? 'active' : ''}">
                    <a href="${createLink(controller:'pais',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>País</span>
                    </a>
                </li>
                <li class="${(controllerName == 'provincia' && actionName == 'index') ? 'active' : ''}">
                    <a href="${createLink(controller:'provincia',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-dots"></i>
                        <span>Provincia</span>
                    </a>
                </li>
                <li >
                    <a href="${createLink(controller:'condicionImpositiva',action: 'index')}" class="auto"> <!-- /CreateLink -->
                        <i class="i i-arrow-right5"></i>
                        <span>Condición impositiva</span>
                    </a>
                </li>

            </ul>
        </li>





    </ul>
</li>







</ul>
<div class="line dk hidden-nav-xs"></div>
<div class="text-muted text-xs hidden-nav-xs padder m-t-sm m-b-sm">Filtros</div>
<ul class="nav">
    <li>
        <a href="mail.html#work">
            <i class="i i-circle-sm text-info-dk"></i>
            <span>Reportes</span>
        </a>
    </li>
    <li>
        <a href="mail.html#social">
            <i class="i i-circle-sm text-success-dk"></i>
            <span>Ultimas Facturas</span>
        </a>
    </li>
    <li>
        <a href="mail.html#projects">
            <i class="i i-circle-sm text-danger-dk"></i>
            <span>Otros</span>
        </a>
    </li>
</ul>
<div class="text-muted text-xs hidden-nav-xs padder m-t-sm m-b-sm">Usuarios</div>
<ul class="nav">
    <li>
        <a href="#">
            <i class="i i-circle-sm-o text-success-lt"></i>
            <span>
                <g:link controller="usuario" action="show" id="${sec.loggedInUserInfo(field: 'id')}">${sec.loggedInUserInfo(field: 'username')}</g:link>

            </span>
        </a>
    </li>
    <!-- <li>
            <a href="#">
                <i class="i i-circle-sm-o text-warning"></i>
                <span>XXXXX</span>
            </a>
        </li> -->
</ul>
</nav>
<!-- / nav -->
</div>
</section>

<footer class="footer hidden-xs no-padder text-center-nav-xs">
    <a href="modal.lockme.html" data-toggle="ajaxModal" class="btn btn-icon icon-muted btn-inactive pull-right m-l-xs m-r-xs hidden-nav-xs">
        <i class="i i-logout"></i>
    </a>
    <a href="#nav" data-toggle="class:nav-xs" class="btn btn-icon icon-muted btn-inactive m-l-xs m-r-xs">
        <i class="i i-circleleft text"></i>
        <i class="i i-circleright text-active"></i>
    </a>
</footer>
</section>
</aside>
<!-- /.aside -->

<!-- /ADD END -->




<!-- /ADD START -->
<section id="content">
    <section class="hbox stretch">
        <section>
            <section class="vbox">
                <section class="scrollable padder">
                    <!-- /ADD END -->

                    <!--  <div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logos.png" alt="Grails"/></a></div> -->

                    <g:form action="index" controller="logout">
                        <g:actionSubmit value="Logout" action="index"/>
                    </g:form>
                    <!--
                    <g:link controller="logout" action="index" >Logout</g:link>
                    -->
                    <div class="container">



                    </div> <!-- /container -->



                    <script type="text/javascript">

                        jQuery(document).ready(function(){

                            // jQuery('#menu').superfish();

                        });

                    </script>




                    <g:layoutBody/>
                    <div class="footer" role="contentinfo"></div>
                    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>




                    <!-- /ADD START -->
                </section>
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
            </section>
        </section>
    </section>
</section>
<!-- /ADD END -->


<!-- /ADD START -->
</section>
</section>
<!-- /ADD END -->



</section><!-- /ADD -->


<!-- /ADD START -->

<script src="/maternidad/js/utilidades.js"></script>
<script src="/maternidad/js/select2.js"></script>
<script src="/maternidad/js/datepicker-es.js"></script>

<!-- Agrego la librería Prototype -->
<script src="/maternidad/js/prototype/prototype.js"></script>



<!-- <script src="/maternidad/js/jquery.min.js"></script> -->
<!-- Bootstrap -->
<script src="/maternidad/js/bootstrap.js"></script>
<!-- App -->
<script src="/maternidad/js/app.js"></script>
<script src="/maternidad/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/maternidad/js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
<script src="/maternidad/js/charts/sparkline/jquery.sparkline.min.js"></script>
<script src="/maternidad/js/charts/flot/jquery.flot.min.js"></script>
<script src="/maternidad/js/charts/flot/jquery.flot.tooltip.min.js"></script>
<script src="/maternidad/js/charts/flot/jquery.flot.spline.js"></script>
<script src="/maternidad/js/charts/flot/jquery.flot.pie.min.js"></script>
<script src="/maternidad/js/charts/flot/jquery.flot.resize.js"></script>
<script src="/maternidad/js/charts/flot/jquery.flot.grow.js"></script>
<script src="/maternidad/js/charts/flot/demo.js"></script>

<script src="/maternidad/js/calendar/bootstrap_calendar.js"></script>
<script src="/maternidad/js/calendar/demo.js"></script>

<script src="/maternidad/js/sortable/jquery.sortable.js"></script>
<script src="/maternidad/js/app.plugin.js"></script>

<!-- /ADD END -->

</body>
</html>
