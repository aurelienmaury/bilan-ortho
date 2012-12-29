<div class="span3">
    <div class="well sidebar-nav">
        <ul class="nav nav-list">
            <li class="nav-header">Actions</li>
            <li class="${active == 'search' ? 'active' : ''}">
                <g:link action="search">Rechercher</g:link>
            </li>
            <li class="${active == 'list' ? 'active' : ''}">
                <g:link action="list">List</g:link>
            </li>
            <li class="${active == 'create' ? 'active' : ''}">
                <g:link class="create" action="create">
                    <g:message
                            code="default.new.label"
                            args="[entityName]"/>
                </g:link>
            </li>
        </ul>
    </div>
</div>