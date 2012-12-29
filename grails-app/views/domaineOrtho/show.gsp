<%@ page import="bilan.DomaineOrtho" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'domaineOrtho.label', default: 'DomaineOrtho')}"/>
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
        <ol class="property-list domaineOrtho">

            <g:if test="${domaineOrthoInstance?.nom}">
                <li class="fieldcontain">
                    <span id="nom-label" class="property-label"><g:message code="domaineOrtho.nom.label"
                                                                           default="Nom"/></span>

                    <span class="property-value" aria-labelledby="nom-label"><g:fieldValue
                            bean="${domaineOrthoInstance}" field="nom"/></span>

                </li>
            </g:if>

            <g:if test="${domaineOrthoInstance?.fiches}">
                <li class="fieldcontain">
                    <span id="fiches-label" class="property-label"><g:message code="domaineOrtho.fiches.label"
                                                                              default="Fiches"/></span>

                    <g:each in="${domaineOrthoInstance.fiches}" var="f">
                        <span class="property-value" aria-labelledby="fiches-label"><g:link controller="ficheOrtho"
                                                                                            action="show"
                                                                                            id="${f.id}">${f?.titre}</g:link></span>
                    </g:each>

                </li>
            </g:if>

        </ol>
    <hr/>
        <g:form>
            <fieldset>
                <g:hiddenField name="id" value="${domaineOrthoInstance?.id}"/>
                <g:link class="btn btn-primary" action="edit" id="${domaineOrthoInstance?.id}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="btn btn-danger" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
