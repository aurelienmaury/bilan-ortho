<%@ page import="bilan.DomaineOrtho" %>



<div class="fieldcontain ${hasErrors(bean: domaineOrthoInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="domaineOrtho.nom.label" default="Nom" />
		
	</label>
	<g:textField name="nom" maxlength="50" value="${domaineOrthoInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domaineOrthoInstance, field: 'fiches', 'error')} ">
	<label for="fiches">
		<g:message code="domaineOrtho.fiches.label" default="Fiches" />
		
	</label>
	<g:select name="fiches" from="${bilan.FicheOrtho.list()}" multiple="multiple" optionKey="id" size="5" value="${domaineOrthoInstance?.fiches*.id}" class="many-to-many"/>
</div>

