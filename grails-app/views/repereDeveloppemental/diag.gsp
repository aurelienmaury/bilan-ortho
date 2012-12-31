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

    <g:render template="navbar" model="[active: 'search']"/>

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
        <g:form action="diag">
            <fieldset class="form">
                <div>
                    <label for="ans">
                        Ans
                    </label>
                    <g:textField name="criteres.desc"/>
                </div>

                <div>
                    <label for="mois">
                        Mois
                    </label>
                    <g:field name="criteres.age" type="number" min="0"/>
                </div>
            </fieldset>
            <hr/>
            <fieldset>
                <g:submitButton name="diag" class="btn btn-primary" value="Rechercher"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
