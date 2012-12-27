<%@ page import="bilan.FicheOrtho" %>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'titre', 'error')} ">
    <label class="control-label" for="titre">
        <g:message code="ficheOrtho.titre.label" default="Titre"/>
    </label>

    <div class="controls">
        <g:textField name="titre" maxlength="50" value="${ficheOrthoInstance?.titre}" class="input-large"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'versant', 'error')} required">
    <label class="control-label" for="versant">
        <g:message code="ficheOrtho.versant.label" default="Versant"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:select name="versant" from="${bilan.Versant?.values()}"
            optionValue="label"
                  keys="${bilan.Versant.values()*.name()}" required=""
                  value="${ficheOrthoInstance?.versant?.name()}" class="input-large"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'domaines', 'error')} ">
    <label class="control-label" for="domaines">
        <g:message code="ficheOrtho.domaines.label" default="Domaines"/>

    </label>

    <div class="controls">
        <g:select name="domaines" from="${bilan.DomaineOrtho.list()}" multiple="multiple" optionKey="id"
                  optionValue="nom" size="5" value="${ficheOrthoInstance?.domaines*.id}" class="many-to-many"/>
    </div>
</div>


<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'ageDebut', 'error')} required">
    <label class="control-label" for="ageDebut">
        <g:message code="ficheOrtho.ageDebut.label" default="Age Debut"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:field name="ageDebut" type="number" min="0" value="${ficheOrthoInstance.ageDebut}" required=""
                 class="input-large"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'ageFin', 'error')} required">
    <label class="control-label" for="ageFin">
        <g:message code="ficheOrtho.ageFin.label" default="Age Fin"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:field name="ageFin" type="number" min="0" value="${ficheOrthoInstance.ageFin}" required=""
                 class="input-large"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'passationTxt', 'error')} ">
    <label class="control-label" for="passationTxt">
        <g:message code="ficheOrtho.passationTxt.label" default="Passation Txt"/>

    </label>

    <div class="controls">
        <g:textArea name="passationTxt" cols="40" rows="5" maxlength="255" value="${ficheOrthoInstance?.passationTxt}"
                    class="input-xxlarge"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'cotationTxt', 'error')} ">
    <label class="control-label" for="cotationTxt">
        <g:message code="ficheOrtho.cotationTxt.label" default="Cotation Txt"/>

    </label>

    <div class="controls">
        <g:textArea name="cotationTxt" cols="40" rows="5" maxlength="255" value="${ficheOrthoInstance?.cotationTxt}"
                    class="input-xxlarge"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'seuilPathoTxt', 'error')} ">
    <label class="control-label" for="seuilPathoTxt">
        <g:message code="ficheOrtho.seuilPathoTxt.label" default="Seuil Patho Txt"/>

    </label>

    <div class="controls">
        <g:textArea name="seuilPathoTxt" cols="40" rows="5" maxlength="255"
                    value="${ficheOrthoInstance?.seuilPathoTxt}" class="input-xxlarge"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'avantagesTxt', 'error')} ">
    <label class="control-label" for="avantagesTxt">
        <g:message code="ficheOrtho.avantagesTxt.label" default="Avantages Txt"/>

    </label>

    <div class="controls">
        <g:textArea name="avantagesTxt" cols="40" rows="5" maxlength="255" value="${ficheOrthoInstance?.avantagesTxt}"
                    class="input-xxlarge"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: ficheOrthoInstance, field: 'inconvenientsTxt', 'error')} ">
    <label class="control-label" for="inconvenientsTxt">
        <g:message code="ficheOrtho.inconvenientsTxt.label" default="Inconvenients Txt"/>

    </label>

    <div class="controls">
        <g:textArea name="inconvenientsTxt" cols="40" rows="5" maxlength="255"
                    value="${ficheOrthoInstance?.inconvenientsTxt}" class="input-xxlarge"/>
    </div>

</div>


