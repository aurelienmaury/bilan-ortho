<%@ page import="bilan.FicheOrtho" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ficheOrtho.label', default: 'FicheOrtho')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div class="row-fluid">
    <div class="span3">
        <div class="well sidebar-nav">
            <ul class="nav nav-list">
                <li class="nav-header">Actions</li>
                <li><g:link action="search">Rechercher</g:link></li>
                <li><g:link action="list">List</g:link></li>
                <li class="active"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                                     args="[entityName]"/></g:link></li>
            </ul>
        </div>
    </div>

    <div class="span9">

        <div id="create-ficheOrtho" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
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
            <g:form action="save" class="form-horizontal">
                <fieldset>
                    <g:render template="form"/>
                </fieldset>
                <hr/>
                <fieldset>
                    <g:submitButton name="create" class="btn btn-primary"
                                    value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                </fieldset>
            </g:form>
        </div>
    </div>
</body>
</html>
