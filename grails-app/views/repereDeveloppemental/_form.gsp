<%@ page import="bilan.RepereDeveloppemental" %>

<div class="fieldcontain ${hasErrors(bean: repereDeveloppementalInstance, field: 'theme', 'error')} required">
    <label for="theme">
        <g:message code="repereDeveloppemental.theme.label" default="Theme" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="theme" name="theme.id" from="${bilan.ThemeDeveloppemental.list()}" optionKey="id" optionValue="nom" required="" value="${repereDeveloppementalInstance?.theme?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: repereDeveloppementalInstance, field: 'ageDebut', 'error')} required">
	<label for="ageDebut">
		<g:message code="repereDeveloppemental.ageDebut.label" default="Age Debut" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ageDebut" type="number" value="${repereDeveloppementalInstance.ageDebut}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: repereDeveloppementalInstance, field: 'ageFin', 'error')} required">
	<label for="ageFin">
		<g:message code="repereDeveloppemental.ageFin.label" default="Age Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ageFin" type="number" value="${repereDeveloppementalInstance.ageFin}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: repereDeveloppementalInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="repereDeveloppemental.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${repereDeveloppementalInstance?.description}"/>
</div>



