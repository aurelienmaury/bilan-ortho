<%@ page import="bilan.FicheOrtho" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ficheOrtho.label', default: 'FicheOrtho')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
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
    <h1>Recherche</h1>
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
    <g:form action="list">
        <fieldset class="form">
            <div>
                <label for="ans">
                    Ans
                </label>
                <g:field name="ans" type="number" min="0"/>
            </div>

            <div>
                <label for="mois">
                    Mois
                </label>
                <g:field name="mois" type="number" min="0"/>
            </div>
        </fieldset>
        <hr/>
        <fieldset>
            <g:submitButton name="search" class="btn btn-primary" value="Rechercher"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
