<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="keywords" content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>陕西省民政办公系统</title>
  <!--icheck-->
  <link href="${wwwroot}/resources/ui2/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
  <link href="${wwwroot}/resources/ui2/js/iCheck/skins/square/square.css" rel="stylesheet">
  <link href="${wwwroot}/resources/ui2/js/iCheck/skins/square/red.css" rel="stylesheet">
  <link href="${wwwroot}/resources/ui2/js/iCheck/skins/square/blue.css" rel="stylesheet">

  <!--dashboard calendar-->
  <link href="${wwwroot}/resources/ui2/css/clndr.css" rel="stylesheet">

  <!--Morris Chart CSS -->
  <link rel="stylesheet" href="${wwwroot}/resources/ui2/js/morris-chart/morris.css">

  <!--common-->
  <link href="${wwwroot}/resources/ui2/css/style.css" rel="stylesheet">
  <link href="${wwwroot}/resources/ui2/css/style-responsive.css" rel="stylesheet">




  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="${wwwroot}/resources/ui2/js/html5shiv.js"></script>
  <script src="${wwwroot}/resources/ui2/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a href="index.html"><img src="${wwwroot}/resources/ui2/images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href="index.html"><img src="${wwwroot}/resources/ui2/images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->

        <div class="left-side-inner">

            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="${wwwroot}/resources/ui2/images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#">个人信息</a></h4>
                        <span>"欢迎进入"</span>
                    </div>
                </div>

                <h5 class="left-nav-title">账户信息</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                  <li><a href="#"><i class="fa fa-user"></i> <span>简介</span></a></li>
                  <li><a href="#"><i class="fa fa-cog"></i> <span>设置</span></a></li>
                  <li><a href="#"><i class="fa fa-sign-out"></i> <span>退出</span></a></li>
                </ul>
            </div>

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <@menuList pid="root">
					<#list resources as topRes>
								<li  class="menu-list" data-id="${(topRes.id)!}" data-pid="0" ><a href=""><i class="fa fa-book"></i> <span>${(topRes.name)!}</span></a>
						<@menuList pid=topRes.id>
							<#list resources as res>
								<ul class="sub-menu-list">
									<li data-id="${(res.id)!}" data-pid="${(res.pid)!}"				 data-url="${wwwroot}/${(res.url)!}"data-tabid="main" ><a href="${wwwroot}/${(res.url)!}">${(res.name)!}</a></li>
								</ul>
							</#list>
						 </@menuList>	
						</li>										
					</#list>
				</@menuList>
                <!--
                <li class="menu-list"><a href=""><i class="fa fa-cogs"></i> <span>Components</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="grids.html"> Grids</a></li>
                        <li><a href="gallery.html"> Media Gallery</a></li>
                        <li><a href="calendar.html"> Calendar</a></li>
                        <li><a href="tree_view.html"> Tree View</a></li>
                        <li><a href="nestable.html"> Nestable</a></li>
                        

                    </ul>
                </li>

                <li><a href="fontawesome.html"><i class="fa fa-bullhorn"></i> <span>Fontawesome</span></a></li>

                <li class="menu-list"><a href=""><i class="fa fa-envelope"></i> <span>Mail</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="mail.html"> Inbox</a></li>
                        <li><a href="mail_compose.html"> Compose Mail</a></li>
                        <li><a href="mail_view.html"> View Mail</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href=""><i class="fa fa-tasks"></i> <span>Forms</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="form_layouts.html"> Form Layouts</a></li>
                        <li><a href="form_advanced_components.html"> Advanced Components</a></li>
                        <li><a href="form_wizard.html"> Form Wizards</a></li>
                        <li><a href="form_validation.html"> Form Validation</a></li>
                        <li><a href="editors.html"> Editors</a></li>
                        <li><a href="inline_editors.html"> Inline Editors</a></li>
                        <li><a href="pickers.html"> Pickers</a></li>
                        <li><a href="dropzone.html"> Dropzone</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-bar-chart-o"></i> <span>Charts</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="flot_chart.html"> Flot Charts</a></li>
                        <li><a href="morris.html"> Morris Charts</a></li>
                        <li><a href="chartjs.html"> Chartjs</a></li>
                        <li><a href="c3chart.html"> C3 Charts</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="fa fa-th-list"></i> <span>Data Tables</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="basic_table.html"> Basic Table</a></li>
                        <li><a href="dynamic_table.html"> Advanced Table</a></li>
                        <li><a href="responsive_table.html"> Responsive Table</a></li>
                        <li><a href="editable_table.html"> Edit Table</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href="#"><i class="fa fa-map-marker"></i> <span>Maps</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="google_map.html"> Google Map</a></li>
                        <li><a href="vector_map.html"> Vector Map</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-file-text"></i> <span>Extra Pages</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="profile.html"> Profile</a></li>
                        <li><a href="invoice.html"> Invoice</a></li>
                        <li><a href="pricing_table.html"> Pricing Table</a></li>
                        <li><a href="timeline.html"> Timeline</a></li>
                        <li><a href="blog_list.html"> Blog List</a></li>
                        <li><a href="blog_details.html"> Blog Details</a></li>
                        <li><a href="directory.html"> Directory </a></li>
                        <li><a href="chat.html"> Chat </a></li>
                        <li><a href="404.html"> 404 Error</a></li>
                        <li><a href="500.html"> 500 Error</a></li>
                        <li><a href="registration.html"> Registration Page</a></li>
                        <li><a href="lock_screen.html"> Lockscreen </a></li>
                    </ul>
                </li>
                <li><a href="login.html"><i class="fa fa-sign-in"></i> <span>Login Page</span></a></li>
			-->
            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
   
    <!-- main content start-->
    <div class="main-content" >
     <iframe height="100%" width="100%" border="0" frameborder="0" src="${wwwroot}/admin/recform/listdraft" name="rightFrame" id="rightFrame" title="rightFrame">
   </iframe>
    </div>
    
    <!-- main content end-->
    
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${wwwroot}/resources/ui2/js/jquery-1.10.2.min.js"></script>
<script src="${wwwroot}/resources/ui2/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${wwwroot}/resources/ui2/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${wwwroot}/resources/ui2/js/bootstrap.min.js"></script>
<script src="${wwwroot}/resources/ui2/js/modernizr.min.js"></script>
<script src="${wwwroot}/resources/ui2/js/jquery.nicescroll.js"></script>

<!--easy pie chart-->
<script src="${wwwroot}/resources/ui2/js/easypiechart/jquery.easypiechart.js"></script>
<script src="${wwwroot}/resources/ui2/js/easypiechart/easypiechart-init.js"></script>

<!--Sparkline Chart-->
<script src="${wwwroot}/resources/ui2/js/sparkline/jquery.sparkline.js"></script>
<script src="${wwwroot}/resources/ui2/js/sparkline/sparkline-init.js"></script>

<!--icheck -->
<script src="${wwwroot}/resources/ui2/js/iCheck/jquery.icheck.js"></script>
<script src="${wwwroot}/resources/ui2/js/icheck-init.js"></script>

<!-- jQuery Flot Chart-->
<script src="${wwwroot}/resources/ui2/js/flot-chart/jquery.flot.js"></script>
<script src="${wwwroot}/resources/ui2/js/flot-chart/jquery.flot.tooltip.js"></script>
<script src="${wwwroot}/resources/ui2/js/flot-chart/jquery.flot.resize.js"></script>


<!--Morris Chart-->
<script src="${wwwroot}/resources/ui2/js/morris-chart/morris.js"></script>
<script src="${wwwroot}/resources/ui2/js/morris-chart/raphael-min.js"></script>

<!--Calendar-->
<script src="${wwwroot}/resources/ui2/js/calendar/clndr.js"></script>
<script src="${wwwroot}/resources/ui2/js/calendar/evnt.calendar.init.js"></script>
<script src="${wwwroot}/resources/ui2/js/calendar/moment-2.2.1.js"></script>
<script src="${wwwroot}/resources/ui2/http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>

<!--common scripts for all pages-->
<script src="${wwwroot}/resources/ui2/js/scripts.js"></script>

<!--Dashboard Charts-->
<script src="${wwwroot}/resources/ui2/js/dashboard-chart-init.js"></script>


</body>
</html>
