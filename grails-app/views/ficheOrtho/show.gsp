<%@ page import="bilan.FicheOrtho" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ficheOrtho.label', default: 'FicheOrtho')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="row-fluid">
    <g:render template="navbar"/>

    <div class="span9">
        <h1>Fiche test : ${ficheOrthoInstance.titre}</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ul>
            <g:if test="${ficheOrthoInstance?.versant}">
                <li class="fieldcontain">
                    <span id="versant-label" class="property-label"><g:message code="ficheOrtho.versant.label"
                                                                               default="Versant"/></span>

                    <span class="property-value"
                          aria-labelledby="versant-label">${ficheOrthoInstance.versant.label}</span>

                </li>
            </g:if>

            <g:if test="${ficheOrthoInstance?.ageDebut}">
                <li class="fieldcontain">
                    <span id="ageDebut-label" class="property-label"><g:message code="ficheOrtho.ageDebut.label"
                                                                                default="Age Debut"/></span>

                    <span class="property-value" aria-labelledby="ageDebut-label"><g:fieldValue
                            bean="${ficheOrthoInstance}" field="ageDebut"/></span>

                </li>
            </g:if>

            <g:if test="${ficheOrthoInstance?.ageFin}">
                <li class="fieldcontain">
                    <span id="ageFin-label" class="property-label"><g:message code="ficheOrtho.ageFin.label"
                                                                              default="Age Fin"/></span>

                    <span class="property-value" aria-labelledby="ageFin-label"><g:fieldValue
                            bean="${ficheOrthoInstance}" field="ageFin"/></span>

                </li>
            </g:if>

            <g:if test="${ficheOrthoInstance?.passationTxt}">
                <li class="fieldcontain">
                    <span id="passationTxt-label" class="property-label"><g:message code="ficheOrtho.passationTxt.label"
                                                                                    default="Passation Txt"/></span>

                    <span class="property-value" aria-labelledby="passationTxt-label"><g:fieldValue
                            bean="${ficheOrthoInstance}" field="passationTxt"/></span>

                </li>
            </g:if>

            <g:if test="${ficheOrthoInstance?.cotationTxt}">
                <li class="fieldcontain">
                    <span id="cotationTxt-label" class="property-label"><g:message code="ficheOrtho.cotationTxt.label"
                                                                                   default="Cotation Txt"/></span>

                    <span class="property-value" aria-labelledby="cotationTxt-label"><g:fieldValue
                            bean="${ficheOrthoInstance}" field="cotationTxt"/></span>

                </li>
            </g:if>

            <g:if test="${ficheOrthoInstance?.seuilPathoTxt}">
                <li class="fieldcontain">
                    <span id="seuilPathoTxt-label" class="property-label"><g:message
                            code="ficheOrtho.seuilPathoTxt.label" default="Seuil Patho Txt"/></span>

                    <span class="property-value" aria-labelledby="seuilPathoTxt-label"><g:fieldValue
                            bean="${ficheOrthoInstance}" field="seuilPathoTxt"/></span>

                </li>
            </g:if>

            <g:if test="${ficheOrthoInstance?.avantagesTxt}">
                <li class="fieldcontain">
                    <span id="avantagesTxt-label" class="property-label"><g:message code="ficheOrtho.avantagesTxt.label"
                                                                                    default="Avantages Txt"/></span>

                    <span class="property-value" aria-labelledby="avantagesTxt-label"><g:fieldValue
                            bean="${ficheOrthoInstance}" field="avantagesTxt"/></span>

                </li>
            </g:if>

            <g:if test="${ficheOrthoInstance?.inconvenientsTxt}">
                <li class="fieldcontain">
                    <span id="inconvenientsTxt-label" class="property-label"><g:message
                            code="ficheOrtho.inconvenientsTxt.label" default="Inconvenients Txt"/></span>

                    <span class="property-value" aria-labelledby="inconvenientsTxt-label"><g:fieldValue
                            bean="${ficheOrthoInstance}" field="inconvenientsTxt"/></span>

                </li>
            </g:if>

            <g:if test="${ficheOrthoInstance?.domaines}">
                <li class="fieldcontain">
                    <span id="domaines-label" class="property-label"><g:message code="ficheOrtho.domaines.label"
                                                                                default="Domaines"/></span>

                    <g:each in="${ficheOrthoInstance.domaines}" var="d">
                        <span class="property-value" aria-labelledby="domaines-label"><g:link controller="domaineOrtho"
                                                                                              action="show"
                                                                                              id="${d.id}">${d?.nom}</g:link></span>
                    </g:each>

                </li>
            </g:if>

        </ul>
        <hr/>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${ficheOrthoInstance?.id}"/>
                <g:link class="btn btn-primary" action="edit" id="${ficheOrthoInstance?.id}"><g:message
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
