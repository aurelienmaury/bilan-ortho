<%@ page import="bilan.FicheOrtho" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ficheOrtho.label', default: 'FicheOrtho')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="row-fluid">
    <div class="span3">
        <div class="well sidebar-nav">
            <ul class="nav nav-list">
                <li class="nav-header">Actions</li>
                <li><g:link action="search">Rechercher</g:link></li>
                <li><g:link action="list">List</g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                      args="[entityName]"/></g:link></li>
            </ul>
        </div>
    </div>

    <div class="span9">

        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${ficheOrthoInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${ficheOrthoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>


        <g:form method="post" class="form-horizontal">
            <g:hiddenField name="id" value="${ficheOrthoInstance?.id}"/>
            <g:hiddenField name="version" value="${ficheOrthoInstance?.version}"/>

            <fieldset>
                <g:render template="form"/>
            </fieldset>

            <hr/>
            <fieldset class="buttons">
                <g:actionSubmit class="btn btn-primary" action="update"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>

                <g:actionSubmit class="btn btn-danger" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                formnovalidate=""
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</body>
</html>
