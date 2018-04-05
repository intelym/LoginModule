<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>QuickXcess | Streams</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/_all-skins.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/blue.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/matrix-style.css">



</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="index2.html" class="logo"> <span class="logo-mini"><b>I</b>QS</span>
				<span class="logo-lg"><b>Quick </b>Streams</span>
			</a>
							<button type="button" id="btnConfig"
									class="btn btn-info btn-mini configSet" data-toggle="modal"
									data-target="#conSetting">Configuration
									Setting</button>
							<button type="button" id="btnUser"
									class="btn btn-info btn-mini newUser" data-toggle="modal"
									data-target="#userCreate">New User</button>

			<nav class="navbar navbar-static-top">
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<h3>
					<a onclick="document.forms['logoutForm'].submit()">Logout</a>
				</h3>
			</nav>
		</header>
		<aside class="main-sidebar">
			<section class="sidebar">
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group"></div>
				</form>
				<ul id="navListUl" class="sidebar-menu navigationList"></ul>
			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- Content Wrapper. Contains page content -->
		<div>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</c:if>
		</div>
		<!-- top lyer logout layer finished -->

		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			<!-- Main content -->
			<section class="content">
				<div  class="row">
					<div class="col-md-4" id="sysStatus">
						<div class="box box-widget widget-user-2" style="border: 1px #cecece solid;">
							<div class="widget-user-header bg-white"
								style="padding: 3px;">
								<legend style="margin-bottom: -13px;"><h3 class="widget-user-username" style="margin-left: 11px;">System Status
								<small class="label pull-right bg-blue" id="status"></small></h3></legend>
							</div>
							<div class="clearfix" style="margin: 5px;">
								<output><b>Date: </b><small id="currentDate"></small></output>
								<output><b>Host: </b><small id="hostId"></small></output>
								<output><b>Expiration: </b><small>Not Available</small></output>
							</div>
						</div>
					</div>
					
					<div id="scorecard">
					
					</div>
				</div>
			
				<div class="row">
					<div class="col-md-4" id="pInDiv">
						<div class="box box-widget widget-user-2" style="border: 1px #cecece solid;">
							<div class="widget-user-header bg-white"
								style="padding: 3px;">
								<h3 class="widget-user-username" style="margin-left: 11px;">Client Connectors</h3>
							</div>
							
							<table class="table" id="connectInfo">
								
							</table>
						</div>
					</div>
					<div class="col-md-4">
						<div class="box box-widget widget-user-2" style="border: 1px #cecece solid;">
							<div class="widget-user-header bg-white"
								style="padding: 3px;">
								<h3 class="widget-user-username" style="margin-left: 11px;">Streaming Connectors</h3>
							</div>
							<table class="table" id="protocalOut">
								
							</table>
						</div>
					</div>
					
					<div class="row-fluid">
						
					
					<div class="col-md-4">
						<div class="box box-widget widget-user-2" style="border: 1px #cecece solid;">
							<div class="widget-user-header bg-white"
								style="padding: 3px;">
								<legend style="margin-bottom: -5px;">
									<h3 class="widget-user-username" style="margin-left: 11px;">Past 3 hours chart</h3>
								</legend>
							</div>
							<canvas id="myChart"></canvas>
						</div>
					</div>
					
					</div>
					
				
				</div>

				<div class="row">
					
				</div>
				
				<div class="row">
					
				</div>
				
			
			</section>
		</div>

		<div class="control-sidebar-bg"></div>
	</div>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/jquery-2.2.3.min.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="${contextPath}/resources/js/jquery.sparkline.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script
		src="${contextPath}/resources/js/bootstrap3-wysihtml5.all.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.slimscroll.min.js"></script>
	<script src="${contextPath}/resources/js/fastclick.js"></script>
	<script src="${contextPath}/resources/js/app.min.js"></script>
	<script src="${contextPath}/resources/js/demo.js"></script>

	<script src="${contextPath}/resources/js/Chart.js"></script>
	<script src="${contextPath}/resources/js/Chart.min.js"></script>
	<script src="${contextPath}/resources/js/Chart.bundle.js"></script>
	<script src="${contextPath}/resources/js/Chart.bundle.min.js"></script>
	<script src="${contextPath}/resources/js/Common.js"></script>
	<script src="${contextPath}/resources/js/jquery.ui.custom.js"></script>

</body>
</html>
