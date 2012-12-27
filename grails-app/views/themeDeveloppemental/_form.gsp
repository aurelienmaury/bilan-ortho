<%@ page import="bilan.ThemeDeveloppemental" %>



<div class="fieldcontain ${hasErrors(bean: themeDeveloppementalInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="themeDeveloppemental.nom.label" default="Nom" />
		
	</label>
	<g:textField name="nom" value="${themeDeveloppementalInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: themeDeveloppementalInstance, field: 'reperes', 'error')} ">
	<label for="reperes">
		<g:message code="themeDeveloppemental.reperes.label" default="Reperes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${themeDeveloppementalInstance?.reperes?}" var="r">
    <li><g:link controller="repereDeveloppemental" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="repereDeveloppemental" action="create" params="['themeDeveloppemental.id': themeDeveloppementalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental')])}</g:link>
</li>
</ul>

</div>

