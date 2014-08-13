<!DOCTYPE html>
<html class="no-js">
<head>
  <!-- meta -->
  <meta charset="utf-8" />

  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <meta name="viewport" content="width=device-width" />

  <meta name="description" content="<%= ''/*  @getPreparedDescription()  */ %>" />
  <meta name="keywords" content="<%= ''/*  @getPreparedKeywords()  */ %>" />
  <meta name="author" content="<%= ''/*  @site.author or ''  */ %>" />

  <title><%= ''/*  @getPreparedTitle()  */ %></title>

  <%- ''/*  @getBlock('meta').toHTML()  */ %>

  <!-- ie6-8 support of html5 elements -->
  <!--[if lt IE 9]>
    <script async src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

  <base href="<%- page.basePath %>">

  <!-- styles -->
  <link  rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css" />
  <link  rel="stylesheet" href="/assets/vendor/google-code-prettify/prettify.css" />
  <link  rel="stylesheet" href="/assets/vendor/camunda/cabpmn/cabpmn.css" />
  <link  rel="stylesheet" href="/assets/vendor/highlight.js/github.css" />

  <link rel="stylesheet" href="/styles/style.css">

  <!-- favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="/app/img/favicon.ico" />
</head>
<body data-spy="scroll" data-target=".docs-sidebar" >

  <%= page.body %>u

  <%= page.footer %>
</body>
</html>
