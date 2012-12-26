<%@ page import="bilan.FicheOrtho" %>



<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'titre', 'error')} ">
	<label for="titre">
		<g:message code="ficheOrtho.titre.label" default="Titre" />
		
	</label>
	<g:textField name="titre" maxlength="50" value="${ficheOrthoInstance?.titre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'ageDebut', 'error')} required">
	<label for="ageDebut">
		<g:message code="ficheOrtho.ageDebut.label" default="Age Debut" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ageDebut" type="number" min="0" value="${ficheOrthoInstance.ageDebut}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'ageFin', 'error')} required">
	<label for="ageFin">
		<g:message code="ficheOrtho.ageFin.label" default="Age Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ageFin" type="number" min="0" value="${ficheOrthoInstance.ageFin}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'passationTxt', 'error')} ">
	<label for="passationTxt">
		<g:message code="ficheOrtho.passationTxt.label" default="Passation Txt" />
		
	</label>
	<g:textArea name="passationTxt" cols="40" rows="5" maxlength="255" value="${ficheOrthoInstance?.passationTxt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'cotationTxt', 'error')} ">
	<label for="cotationTxt">
		<g:message code="ficheOrtho.cotationTxt.label" default="Cotation Txt" />
		
	</label>
	<g:textArea name="cotationTxt" cols="40" rows="5" maxlength="255" value="${ficheOrthoInstance?.cotationTxt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'seuilPathoTxt', 'error')} ">
	<label for="seuilPathoTxt">
		<g:message code="ficheOrtho.seuilPathoTxt.label" default="Seuil Patho Txt" />
		
	</label>
	<g:textArea name="seuilPathoTxt" cols="40" rows="5" maxlength="255" value="${ficheOrthoInstance?.seuilPathoTxt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'avantagesTxt', 'error')} ">
	<label for="avantagesTxt">
		<g:message code="ficheOrtho.avantagesTxt.label" default="Avantages Txt" />
		
	</label>
	<g:textArea name="avantagesTxt" cols="40" rows="5" maxlength="255" value="${ficheOrthoInstance?.avantagesTxt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'inconvenientsTxt', 'error')} ">
	<label for="inconvenientsTxt">
		<g:message code="ficheOrtho.inconvenientsTxt.label" default="Inconvenients Txt" />
		
	</label>
	<g:textArea name="inconvenientsTxt" cols="40" rows="5" maxlength="255" value="${ficheOrthoInstance?.inconvenientsTxt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'domaines', 'error')} ">
	<label for="domaines">
		<g:message code="ficheOrtho.domaines.label" default="Domaines" />
		
	</label>

    <g:select name="domaines" from="${bilan.DomaineOrtho.list()}" multiple="multiple" optionKey="id" optionValue="nom" size="5" value="${ficheOrthoInstance?.domaines*.id}" class="many-to-many"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: ficheOrthoInstance, field: 'versant', 'error')} required">
	<label for="versant">
		<g:message code="ficheOrtho.versant.label" default="Versant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="versant" from="${bilan.Versant?.values()}" keys="${bilan.Versant.values()*.name()}" required="" value="${ficheOrthoInstance?.versant?.name()}"/>
</div>

