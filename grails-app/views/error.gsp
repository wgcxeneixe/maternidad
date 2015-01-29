<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:if env="development">
            <li>Revisar el LOG del sistema.</li>
            <g:logMsg level="error">ERROR desde Vista</g:logMsg>
            <!--
            -->
		</g:if>
		<g:else>
			<ul class="errors">
				<li>Revisar el LOG del sistema.</li>
			</ul>
		</g:else>
	</body>
</html>
