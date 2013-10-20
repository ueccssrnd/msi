<!doctype html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Management System for Interns</title>
  <link rel="stylesheet" href="public/vendors/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="public/vendors/fontawesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="public/css/style.css">
  <style>
    @media (min-width: 768px) {
      .container {
      width: 100% !important;
      }
    }
  </style>
</head>
<body>
  <div id="wrapper">
    <nav id="top-nav" class="fixed-top">
      <div class="container">
        <section class="branding col-md-6">
          Management System for Interns
        </section>
        <ul id="primary-nav" class="col-md-6" ng-app="navApp" ng-controller="navCtrl">
          <li class="search subnav">
            <input type="search" id="txtSearch" placeholder="search">
            <button id="btnSearch"><i class="icon-search"></i></button>
          <li class="subnav"><i class="icon-home"></i>
          <li class="subnav"><i class="icon-calendar"></i>
          <li id="secondary-nav" class="subnav">
            <i class="icon-user"></i>
            Hi <span class="user">Guest</span>!
        </ul>
      </div>
    </nav>
    <section class="page-info spacer">
      <h1 class="page-title"><i class="icon-code-fork"></i>Management System for Interns</h1>
    </section>
    <nav id="breadcrumbs">
      <ul>
        <li><i class="icon-home"></i>Home
        <li><i class="icon-double-angle-right"></i>Login
      </ul>
    </nav>
    <div id="content">
    </div>
  </div>
  <div class="overlay"></div>
  <script src="public/vendors/jquery/jquery.js"></script>
  <script src="public/js/core.js"></script>
</body>
</html>