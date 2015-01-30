<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Revisar el LOG del sistema.</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:if env="development">
            <h1>Grails Runtime Exception Development</h1>
            <h2>Detalles del error</h2>

            <div class="message">
                <strong>Error ${request.'javax.servlet.error.status_code'}:</strong> ${request.'javax.servlet.error.message'.encodeAsHTML()}<br/>
                <strong>Servlet:</strong> ${request.'javax.servlet.error.servlet_name'}<br/>
                <strong>URI:</strong> ${request.'javax.servlet.error.request_uri'}<br/>
                <g:if test="${exception}">
                    <strong>Exception Message:</strong> ${exception.message?.encodeAsHTML()} <br />
                    <strong>Caused by:</strong> ${exception.cause?.message?.encodeAsHTML()} <br />
                    <strong>Class:</strong> ${exception.className} <br />
                    <strong>At Line:</strong> [${exception.lineNumber}] <br />
                    <strong>Code Snippet:</strong><br />
                    <div class="snippet">
                        <g:each var="cs" in="${exception.codeSnippet}">
                            ${cs?.encodeAsHTML()}<br />
                        </g:each>
                    </div>
                </g:if>
            </div>

		</g:if>
		<g:else>
            <p>Revisar el LOG del sistema.</p>
            <g:logMsg level="error">
                ${exception}
            </g:logMsg>

		</g:else>
	</body>
</html>
