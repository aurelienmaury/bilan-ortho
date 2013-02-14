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

                <table class="table">
                    <thead>
                    <tr>
                        <th>Description</th>
                        <th>Age d'apparition</th>
                        <th>Standards</th>
                    </tr>
                    </thead>
                    <tbody id="bodyForm">
                    <g:each in="${criteres}" var="critere">
                        <tr>
                            <td>
                                <g:textField name="desc" value="${critere.desc}"/>
                            </td>
                            <td>
                                <g:field name="age" type="number" min="0" value="${critere.age}"/>
                            </td>
                            <td>
                                <g:if test="${critere.ok}">OK</g:if>
                                ${critere.msg}
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

            </fieldset>
            <hr/>
            <fieldset>
                <a id="plus" class="btn btn-success">Plus</a>
                <g:submitButton name="diag" class="btn btn-primary" value="Rechercher"/>
            </fieldset>
        </g:form>
    </div>
</div>

<r:script>
    $(function () {
        $('#plus').click(function () {
            $('#bodyForm').append('<tr><td><input type="text" name="desc"/><td><input type="number" name="age"/></td><td></td></tr>');
        });
    });

</r:script>

</body>
</html>
