<%@ page import="bilan.FicheOrtho" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ficheOrtho.label', default: 'FicheOrtho')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div class="row-fluid">

    <g:render template="navbar" model="[active: 'list']"/>

    <div class="span9">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table class="table table-striped table-bordered">
            <thead>
            <tr>

                <g:sortableColumn property="titre"
                                  title="${message(code: 'ficheOrtho.titre.label', default: 'Titre')}"/>

                <g:sortableColumn property="ageDebut"
                                  title="${message(code: 'ficheOrtho.ageDebut.label', default: 'Age Debut')}"/>

                <g:sortableColumn property="ageFin"
                                  title="${message(code: 'ficheOrtho.ageFin.label', default: 'Age Fin')}"/>

                <th>Domaines</th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${ficheOrthoInstanceList}" status="i" var="ficheOrthoInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${ficheOrthoInstance.id}">${fieldValue(bean: ficheOrthoInstance, field: "titre")}</g:link></td>

                    <td>${fieldValue(bean: ficheOrthoInstance, field: "ageDebut")}</td>

                    <td>${fieldValue(bean: ficheOrthoInstance, field: "ageFin")}</td>

                    <td>${ficheOrthoInstance.domaines*.nom.sort().join(', ')}</td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${ficheOrthoInstanceTotal}"/>
        </div>
    </div>
</div>
</body>
</html>
