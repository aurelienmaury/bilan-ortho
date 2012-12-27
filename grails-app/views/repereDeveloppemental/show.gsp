
<%@ page import="bilan.RepereDeveloppemental" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-repereDeveloppemental" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-repereDeveloppemental" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list repereDeveloppemental">
			
				<g:if test="${repereDeveloppementalInstance?.ageDebut}">
				<li class="fieldcontain">
					<span id="ageDebut-label" class="property-label"><g:message code="repereDeveloppemental.ageDebut.label" default="Age Debut" /></span>
					
						<span class="property-value" aria-labelledby="ageDebut-label"><g:fieldValue bean="${repereDeveloppementalInstance}" field="ageDebut"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${repereDeveloppementalInstance?.ageFin}">
				<li class="fieldcontain">
					<span id="ageFin-label" class="property-label"><g:message code="repereDeveloppemental.ageFin.label" default="Age Fin" /></span>
					
						<span class="property-value" aria-labelledby="ageFin-label"><g:fieldValue bean="${repereDeveloppementalInstance}" field="ageFin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${repereDeveloppementalInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="repereDeveloppemental.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${repereDeveloppementalInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${repereDeveloppementalInstance?.theme}">
				<li class="fieldcontain">
					<span id="theme-label" class="property-label"><g:message code="repereDeveloppemental.theme.label" default="Theme" /></span>
					
						<span class="property-value" aria-labelledby="theme-label"><g:link controller="themeDeveloppemental" action="show" id="${repereDeveloppementalInstance?.theme?.id}">${repereDeveloppementalInstance?.theme?.nom}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${repereDeveloppementalInstance?.id}" />
					<g:link class="edit" action="edit" id="${repereDeveloppementalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
