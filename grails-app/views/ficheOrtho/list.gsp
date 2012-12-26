
<%@ page import="bilan.FicheOrtho" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ficheOrtho.label', default: 'FicheOrtho')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ficheOrtho" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ficheOrtho" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="titre" title="${message(code: 'ficheOrtho.titre.label', default: 'Titre')}" />
					
						<g:sortableColumn property="ageDebut" title="${message(code: 'ficheOrtho.ageDebut.label', default: 'Age Debut')}" />
					
						<g:sortableColumn property="ageFin" title="${message(code: 'ficheOrtho.ageFin.label', default: 'Age Fin')}" />
					
						<g:sortableColumn property="passationTxt" title="${message(code: 'ficheOrtho.passationTxt.label', default: 'Passation Txt')}" />
					
						<g:sortableColumn property="cotationTxt" title="${message(code: 'ficheOrtho.cotationTxt.label', default: 'Cotation Txt')}" />
					
						<g:sortableColumn property="seuilPathoTxt" title="${message(code: 'ficheOrtho.seuilPathoTxt.label', default: 'Seuil Patho Txt')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ficheOrthoInstanceList}" status="i" var="ficheOrthoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ficheOrthoInstance.id}">${fieldValue(bean: ficheOrthoInstance, field: "titre")}</g:link></td>
					
						<td>${fieldValue(bean: ficheOrthoInstance, field: "ageDebut")}</td>
					
						<td>${fieldValue(bean: ficheOrthoInstance, field: "ageFin")}</td>
					
						<td>${fieldValue(bean: ficheOrthoInstance, field: "passationTxt")}</td>
					
						<td>${fieldValue(bean: ficheOrthoInstance, field: "cotationTxt")}</td>
					
						<td>${fieldValue(bean: ficheOrthoInstance, field: "seuilPathoTxt")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ficheOrthoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
