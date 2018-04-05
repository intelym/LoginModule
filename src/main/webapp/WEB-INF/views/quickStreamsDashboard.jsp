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
	
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
<link rel="stylesheet" href="plugins/morris/morris.css">
<link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet" href="dist/css/matrix-style.css">

<script type="text/javascript">
var qxId=" ";
</script>



</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="index2.html" class="logo"> <span class="logo-mini"><b>I</b>QS</span>
				<span class="logo-lg"><b>Quick </b>Streams</span>
			</a>
			<nav class="navbar navbar-static-top">
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
						<form action="Logout" method="post">
							<input type="submit" value="Logout" style="right: 21px;width: 84px;position: absolute;top: 14px;background-color: #00c0ef;border-color: #00acd6;">
						</form>
				<button type="button" id="btnConfig" class="btn btn-info btn-mini" data-toggle="modal" data-target="#conSetting" 
						style="    align-content: center;position: absolute; right: 130px; top: 10px; width: 147px;height: 35px;" >Configuration Setting</button>
					
				</div>
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
		<div class="content-wrapper">
			
			<!-- Main content -->
			<section class="content">
				<div  class="row">
					<div class="col-md-6" id="sysStatus">
						<div class="box box-widget widget-user-2" style="border: 1px #cecece solid;">
							<div class="widget-user-header bg-white"
								style="padding: 3px;">
								<h3 class="widget-user-username" style="margin-left: 11px;">System Status
								<small class="label pull-right bg-blue" id="status"></small></h3>
							</div>
							<div class="clearfix">
								<output><b>Date/Time: </b><small id="currentDate"></small></output>
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
								<!-- <tr>
									<th>Connector</th>
									<th>Listen Port</th>
									<th>Byte per minute</th>
									<th>Active Connections</th>
								</tr> -->
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
								<!-- <tr>
									<th>Connector</th>
									<th>Listen Port</th>
									<th>No.Of Packets</th>
								</tr> -->
							</table>
						</div>
					</div>
					
					<div class="row-fluid">
						<!-- <div class="col-md-4" style="border: 1px #cecece solid;">
								<div class="widget-box">
									<div class="widget-title">
										<span class="icon"> <i class="icon-signal"></i>
										</span>
										<h3 style="font-weight: 300;">Past 3 hours chart:</h3>
									</div>
									<div class="widget-content">
										<div id="placeholder"></div>
										<p id="choices"></p>
									</div>
								</div>
						</div> -->
						<!-- <div class="col-md-4" style="border: 1px #cecece solid;">
						<h3 style="font-weight: lighter;">Past 3 hours chart</h3>
						<div>
							<canvas id="myChart"></canvas>
						</div>
					</div> -->
					
					<div class="col-md-4">
						<div class="box box-widget widget-user-2" style="border: 1px #cecece solid;">
							<div class="widget-user-header bg-white"
								style="padding: 3px;">
								<h3 class="widget-user-username" style="margin-left: 11px;">Past 3 hours chart</h3>
							</div>
							<canvas id="myChart"></canvas>
						</div>
					</div>
					
					</div>
					
				
				</div>

				<div class="row">
					<!-- <div class="col-md-4">
						<h2>Past 3 hours chart</h2>
						<div>
							<canvas id="myChart"></canvas>
						</div>
					</div> -->
				</div>
				
				<div class="row">
					<!-- div class="col-md-6">
						<div class="box box-widget widget-user-2">
							<div class="widget-user-header bg-yellow"
								style="padding: 3px; background-color: #00c0ef !important">
								<h3 class="widget-user-username" style="margin-left: 11px;">Streaming Connectors</h3>
							</div>
							<table class="table" id="historyTbl">
								<tr>
									<th>CONNECTOR Name</th>
									<th>No.Of Packets</th>
									<th>Time</th>
								</tr>
							</table>
						</div>
					</div> -->
				</div>
				
			
			</section>
		</div>
		
		<div class="control-sidebar-bg"></div>
	</div>
	
	
	<div class="modal fade" id="conSetting" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content col-md-12" id="popupDiv">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Configuration Setting</h4>
        </div>
        <div class="modal-body">
          <form>
      
       <section class="content">
                <div class="box box-default" id="popupDiv">
                    <div class="box-header with-border">
                        <h3 class="box-title">Sender</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                        	<div>
                               <input id="psIdId" value=" " hidden="true">
                            </div>
                            <div>
                               <input id="qxIdId" value=" " hidden="true">
                            </div>
                        
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="tcpEngineID" class="flat-red">
                                        TCP.Engine
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="udpEngineID" class="flat-red">
                                        UDP.Engine
                                    </label>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="wsEngineID" class="flat-red">
                                        WS.Engine
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="queryEngineID" class="flat-red">
                                        Query.Engine
                                    </label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="mcastEngineID" class="flat-red">
                                        MCAST.Engine
                                    </label>
                                </div>
                               
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Admin.EngineListener: </label>
                                    <input type="text" id="adminEngineListenerID" class="form-control" value=" ">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Listener</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>TCP.EngineListener: </label>
                                    <input type="text" id="tcpEngineListenerID" class="form-control" value=" ">
                                </div>
                                <div class="form-group">
                                    <label>UDP.EngineListener: </label>
                                    <input type="text" id="udpEngineListenerID" class="form-control" value=" ">
                                </div>
                                <div class="form-group">
                                    <label>UDP.EngineBindAddress: </label>
                                    <input type="text" id="udpEngineBindAddressID" class="form-control" value="">
                                </div>
                                <div class="form-group">
                                    <label>MCAST.EngineListener: </label>
                                    <input type="text" id="mcastEngineListenerID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>WS.EngineListener: </label>
                                    <input type="text" id="wsEngineListenerID" class="form-control" value=" ">
                                </div>
                                <div class="form-group">
                                    <label>Query.EngineListener: </label>
                                    <input type="text" id="queryEngineListenerID" class="form-control" value=" ">
                                </div>
                                <div class="form-group" style="width: 150px;">
                                    <label style="margin-top: 29px;">
                                        <input type="checkbox" id="udpEngineMulticastID" class="flat-red">
                                        UDP.EngineMulticast
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>UDP.EngineMutlicastGroup: </label>
                                    <input type="text" id="udpEngineMutlicastGroupID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>WS.SSLEngineListener: </label>
                                    <input type="text" id="wsSSLEngineListenerID" class="form-control" value=" ">
                                </div>
                                <div class="form-group">
                                    <label>HTTPTunnel.EngineListener: </label>
                                    <input type="text" id="httpTunnelEngineListenerID" class="form-control" value=" ">
                                </div>
                                <div class="form-group">
                                    <label>UserRestrictionSize: </label>
                                    <input type="text" id="userRestrictionSizeID" class="form-control" value=" ">
                                </div>
                                 <div class="form-group">
                                    <label>TCP.MaxThreadPool: </label>
                                    <input type="text" id="tcpMaxThreadPoolID" class="form-control" value=" ">
                                </div>
                            </div>
                          
                        </div>
                    </div>
                </div>
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">JMS</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="jmsID" class="flat-red">
                                        JMS
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="historyID" class="flat-red">
                                        history
                                    </label>
                                </div>
                                 <div class="form-group">
                                    <label>Queues.DBTrade.PlugIn: </label>
                                    <input type="text" id="jmsQueuesDBTradePlugInID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Queues: </label>
                                    <input type="text" id="jmsQueuesID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Queues.DBTrade.Address: </label>
                                    <input type="text" id="jmsQueuesDBTradeAddressID" class="form-control" value=" ">
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>

                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">PlugIns</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>WS: </label>
                                    <input type="text" id="wsPlugInsID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>UDP.MessageHandler: </label>
                                    <input type="text" id="udpMessageHandlerPlugInsID" class="form-control" value=" ">
                                </div>
                            </div>
                            
                        </div>
                        <div class="row">
                        	<div class="col-md-4">
                                <div class="form-group">
                                    <label>Query: </label>
                                    <input type="text" id="queryPlugInsID" class="form-control" value=" ">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">WS</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>MaxThreadPool: </label>
                                    <input type="text" id="wsMaxThreadPoolID" class="form-control" value=" ">
                                </div>
                                <div class="form-group">
                                    <label>Timeout: </label>
                                    <input type="text" id="wsTimeoutID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>SSLKeyStore: </label>
                                    <input type="text" id="wsSSLKeyStoreID" class="form-control" value=" ">
                                </div>
                                <div class="form-group">
                                    <label>Domains: </label>
                                    <input type="text" id="wsDomainsID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>SSLKeyStorePassword: </label>
                                    <input type="text" id="wsSSLKeyStorePasswordID" class="form-control" value="">
                                </div>
                                <div class="form-group">
                                	<div class="form-group">
	                                    <label>MaxFrameSize: </label>
	                                    <input type="text" id="wsMaxFrameSizeID" class="form-control" value=" ">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <label style="margin-top: 29px;">
                                        <input type="checkbox" id="wsDISABLEHOSTNAMEVERIFICATIONID" class="flat-red">
                                        DISABLEHOSTNAMEVERIFICATION
                                    </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">FIX</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="fixClientEnginesID" class="flat-red">
                                        Client.Engines
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" id="fixEngineID" class="flat-red">
                                        Engine
                                    </label>
                                </div>
                                 <div class="form-group">
                                    <label>Watcher.Properties: </label>
                                    <input type="text" id="watcherPropertiesID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Clients.ConnectionId: </label>
                                    <input type="text" id="fixClientsConnectionIdID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>CONNECTION1: </label>
                                    <input type="text" id="connection1ID" class="form-control" value=" ">
                                </div>
                            </div>
                          
                        </div>
                    </div>
                </div>

                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">MCAST</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>GroupName: </label>
                                    <input type="text" id="mcastGroupNameID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>GroupAddress: </label>
                                    <input type="text" id="mcastGroupAddressID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>GroupPort: </label>
                                    <input type="text" id="mcastGroupPortID" class="form-control" value=" ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>EthernetAddress: </label>
                                    <input type="text" id="mcastEthernetAddressID" class="form-control" value="">
                                </div>                                
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>EthernetAddress: </label>
                                    <input type="text" id="mcastEthernetAddressID" class="form-control" value="">
                                </div>                                
                            </div>
                            
                        </div>
                        
                    </div>
                </div>
            </section>
            
        <div class="modal-footer">
          <button type="button" id="btnUpdate" class="btn btn-info">Update</button>	
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        
    </form>
        </div>
      </div>
     </div>
    </div>  
	
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="plugins/knob/jquery.knob.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script	src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="plugins/fastclick/fastclick.js"></script>
	<script src="dist/js/app.min.js"></script>
	<script src="dist/js/demo.js"></script>
	
	<!-- <script src="plugins/flot/jquery.flot.min.js"></script>
	<script src="plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="plugins/flot/jquery.flot.categories.min.js"></script> -->
	
	<script src="UserDefinedScripts/Chart.js"></script>
	<script src="UserDefinedScripts/Chart.min.js"></script>
	<script src="UserDefinedScripts/Chart.bundle.js"></script>
	<script src="UserDefinedScripts/Chart.bundle.min.js"></script>
	<script src="UserDefinedScripts/Common.js"></script>
	<script src="UserDefinedScripts/jquery.ui.custom.js"></script>

	<script>
			var dNow = new Date();
			var utc = new Date(dNow.getTime() + dNow.getTimezoneOffset()
					* 60000)
			var utcdate = (utc.getMonth() + 1) + '/' + utc.getDate() + '/'
					+ utc.getFullYear() + ' ' + utc.getHours() + ':'
					+ utc.getMinutes();
			$('#currentDate').text(utcdate)
	</script>
	<script>
	/*  var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: ['-30Min', '-60Min', '-90Min', '-120Min', '-180Min'],
	    datasets: [{
	      label: 'TCP',
	      data: [12, 19, 3, 17, 6],
	      backgroundColor: "rgba(153,255,51,0.6)"
	    }, {
	      label: 'MQ',
	      data: [2, 29, 5, 5, 2],
	      backgroundColor: "rgba(255,153,0,0.6)"
	    }]
	  }
	});  */
</script>

</body>
</html>
