<%@ page import="bilan.DomaineOrtho" %>



<div class="fieldcontain ${hasErrors(bean: domaineOrthoInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="domaineOrtho.nom.label" default="Nom" />
		
	</label>
	<g:textField name="nom" maxlength="50" value="${domaineOrthoInstance?.nom}"/>
</div>
