<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <g:layoutHead/>

    <r:require modules="bootstrap-responsive-css, application"/>

    <r:layoutResources/>
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <g:link class="brand" controller="home">Bilan</g:link>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><g:link controller="domaineOrtho">Domaines</g:link></li>
                    <li><g:link controller="ficheOrtho">Fiches</g:link></li>
                    <li><g:link controller="themeDeveloppemental">Themes</g:link></li>
                    <li><g:link controller="repereDeveloppemental">Repères</g:link></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container-fluid">
    <g:layoutBody/>
</div>

<footer>
    <hr/>
    <p>Valentine Maury</p>
</footer>

<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>
