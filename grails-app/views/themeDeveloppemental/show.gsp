<%@ page import="bilan.ThemeDeveloppemental" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="navbar"/>

    <div class="span9">
        <h1><g:message code="default.show.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list themeDeveloppemental">

            <g:if test="${themeDeveloppementalInstance?.nom}">
                <li class="fieldcontain">
                    <span id="nom-label" class="property-label"><g:message code="themeDeveloppemental.nom.label"
                                                                           default="Nom"/></span>

                    <span class="property-value" aria-labelledby="nom-label"><g:fieldValue
                            bean="${themeDeveloppementalInstance}" field="nom"/></span>

                </li>
            </g:if>

            <g:if test="${themeDeveloppementalInstance?.reperes}">
                <li class="fieldcontain">
                    <span id="reperes-label" class="property-label"><g:message code="themeDeveloppemental.reperes.label"
                                                                               default="Reperes"/></span>

                    <g:each in="${themeDeveloppementalInstance.reperes}" var="r">
                        <span class="property-value" aria-labelledby="reperes-label"><g:link
                                controller="repereDeveloppemental" action="show"
                                id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
                    </g:each>

                </li>
            </g:if>

        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${themeDeveloppementalInstance?.id}"/>
                <g:link class="edit" action="edit" id="${themeDeveloppementalInstance?.id}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
