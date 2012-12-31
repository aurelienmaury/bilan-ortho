<%@ page import="bilan.ThemeDeveloppemental" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">

    <g:render template="navbar"/>

    <div class="span9">
        <div id="edit-themeDeveloppemental" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${themeDeveloppementalInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${themeDeveloppementalInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form method="post">
                <g:hiddenField name="id" value="${themeDeveloppementalInstance?.id}"/>
                <g:hiddenField name="version" value="${themeDeveloppementalInstance?.version}"/>
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="update"
                                    value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                    <g:actionSubmit class="delete" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    formnovalidate=""
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </g:form>
        </div>
    </div>
</body>
</html>
