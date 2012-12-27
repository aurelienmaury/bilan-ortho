
<%@ page import="bilan.RepereDeveloppemental" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-repereDeveloppemental" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="ageDebut" title="${message(code: 'repereDeveloppemental.ageDebut.label', default: 'Age Debut')}" />
					
						<g:sortableColumn property="ageFin" title="${message(code: 'repereDeveloppemental.ageFin.label', default: 'Age Fin')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'repereDeveloppemental.description.label', default: 'Description')}" />
					
						<th><g:message code="repereDeveloppemental.theme.label" default="Theme" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${repereDeveloppementalInstanceList}" status="i" var="repereDeveloppementalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${repereDeveloppementalInstance.id}">${fieldValue(bean: repereDeveloppementalInstance, field: "ageDebut")}</g:link></td>
					
						<td>${fieldValue(bean: repereDeveloppementalInstance, field: "ageFin")}</td>
					
						<td>${fieldValue(bean: repereDeveloppementalInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: repereDeveloppementalInstance, field: "theme")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${repereDeveloppementalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
