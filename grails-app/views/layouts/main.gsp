<!DOCTYPE html>
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
    <!-- Agrego la librería JQuery y JQueryUI -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <!-- Si no la encuentra JQuery en la CDN carga la copia local -->
    <script>window.jQuery || document.write('<script src="js/jquery-1.10.2/jquery.min.js">\x3C/script>')</script>

    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <!-- Si no la encuentra JQuery UI en la CDN carga la copia local -->
    <script>(window.jQuery.ui === undefined) && document.write('<script src="js/jquery-ui-1.10.4/jquery-ui.min.js">\x3C/script>')</script>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'select2.css')}"/>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.css')}"/>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-custom.css')}"/>

    <asset:javascript src="utilidades.js"/>
    <asset:javascript src="select2.js"/>
    <asset:javascript src="datepicker-es.js"/>

    <asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
