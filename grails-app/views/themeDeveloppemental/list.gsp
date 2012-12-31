<%@ page import="bilan.ThemeDeveloppemental" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental')}"/>
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

                <g:sortableColumn property="nom"
                                  title="${message(code: 'themeDeveloppemental.nom.label', default: 'Nom')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${themeDeveloppementalInstanceList}" status="i" var="themeDeveloppementalInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${themeDeveloppementalInstance.id}">${fieldValue(bean: themeDeveloppementalInstance, field: "nom")}</g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${themeDeveloppementalInstanceTotal}"/>
        </div>
    </div>
</div>
</body>
</html>
