var getNavigationURL = "http://localhost:8080/QuickXcessV1/Rest/quickXcessController/qxIformation";
/*var getProtocolsINURL = "http://45.59.232.236:7777/connectionInfo";*/

var getHistoryFeedURL = "http://localhost:8080/QuickXcessV1/Rest/quickXcessController/getChart";


var getConfigSettingsURL = "http://localhost:8080/QuickXcessV1/Rest/quickXcessController/configSettings";
var putConfigSettingsURL = "http://localhost:8080/QuickXcessV1/Rest/quickXcessController/propertiesSettings";


$(function() {
	$("#example1").DataTable({
		"paging" : true,
		"lengthChange" : false,
		"searching" : false,
		"ordering" : true,
		"info" : true,
		"autoWidth" : false
	});


	var data = [], totalPoints = 100;



	//debugger;
	var navResult = $(".navigationList").html();
	/*Step1*/
	if (navResult == "") {
		$.ajax({
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			url : getNavigationURL,
			success : function(response) {

				//debugger; urlPath
				for (var i = 0; i < response.length; i++) {
					$(".navigationList").append(
							"<li id='abc" + response[i].qxId + "' data-qxid='"+ response[i].qxId + "'  class='" + ((i == 0) ? "active" : "") + "'>"
									+ "<a href='#' class='navLink' data-qxid='"
									+ response[i].qxId + "' data-urlpath='" + response[i].urlPath + "'>"
									+ "<i class='fa fa-laptop'></i><span>"
									+ response[i].qxName + "</span></a></li>");

					if (i == 0) {
						GetProtocolsIN(response[i].urlPath);
						GetClients(response[i].urlPath);
						//GetHistory(response[i].qxId);
						//getGraphData(response[i].qxId);
						GetChart(response[i].qxId);
						
						qxId=response[i].qxId;
						urlPath=response[i].urlPath;
						if(!urlPath){
							$("#status").html("Down");
						}else{
							$("#status").html("Active");
						}
						if(!urlPath){
							$("#hostId").html("Not available");
						}else{
							$("#hostId").html(urlPath);
						}
					}

				}

			},
			error : function(xhr) {
				alert(xhr.responseText);
			}
		});
	} else {
		var qxIds = $('ul#navListUl').find('li.active').data('qxid');
		GetNavigationList(qxIds);
	}

	$(".navigationList").on("click", "a.navLink", function() {
		//debugger;
	    qxId = $(this).data("qxid");
	    urlPath = $(this).data("urlpath");
	    
		GetNavigationList(qxId);
		if(!urlPath){
			$("#connectInfo").html("Data not available.");
			$("#protocalOut").html("Data not available.");
		}else{
			GetProtocolsIN(urlPath);
		}
		
		if(!urlPath){
			$("#scorecard").html("");
		}else{
			GetClients(urlPath);
		}
		GetChart(qxId);
		//getGraphData(qxId);
		//GetHistory(qxId);
		if(!urlPath){
			$("#status").html("Down");
		}else{
			$("#status").html("Active");
		}
		
		if(!urlPath){
			$("#hostId").html("Not available");
		}else{
			$("#hostId").html(urlPath);
		}
		
		
	});

	function GetNavigationList(qxID) {
		$(".navigationList").html("");
		$.ajax({
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			url : getNavigationURL,
			success : function(response) {
				var myArray = JSON.stringify(response);
				for (var i = 0; i < response.length; i++) {
					$(".navigationList").append(
					"<li id='abc"+ response[i].qxId	+ "' data-qxid='"+ response[i].qxId	+ "'   class='"+ ((response[i].qxId == qxID) ? "active": "") + "'>"
									+ "<a href='#' class='navLink' data-qxid='"
									+ response[i].qxId + "' data-urlpath='" + response[i].urlPath + "'>"
									+ "<i class='fa fa-laptop'></i><span>"
									+ response[i].qxName + "</span></a></li>");

				}
			},
			error : function(xhr) {
				alert(xhr.responseText);
			}
		});
	}

		


	function GetProtocolsIN(urlPath) {
		$.ajax({ 
		    type: 'GET', 
		    url: urlPath, 
		    /*url: getProtocolsINURL + '/' + qxID, */
		    dataType: 'json',
		    success: function (data) { 
		        var connData=JSON.parse(JSON.stringify(data));
		         $("#connectInfo").html("");
		    		var html="</caption><tr><th>Connector</th><th>Listen Port</th><th>Byte per minute</th><th>Active Connections</th></div>";
		    		html+="</tr>";
		    		for(var i=0;i<data.length;i++){
		    			if(connData[i].activeConnections!=undefined){
		    			html+="<tr><td>"+connData[i].connectoinName+"</td><td>"+connData[i].port+"</td><td>"+connData[i].bytesPerMinute+"</td>";
		    			var msgCount=connData[i].activeConnections;
		    			if(msgCount<=0){
		    				html+="<td bgcolor='white'> "+connData[i].activeConnections+"</td></tr>";
		    			}else{
		    				html+="<td bgcolor='white'>"+connData[i].activeConnections+"</td></tr>";
		    			}
		    			}
		    			
		    		}
		    		html+="</table>";
		    		$("#connectInfo").html(html);
		    		 
		    		//Streaming Connectors
			        var connData=JSON.parse(JSON.stringify(data));
			         $("#packetsIn").html("");
			    		var html="</caption><tr><th>Connector</th><th>Listen Port</th><th>No.Of Packets</th></div>";
			    		html+="</tr>";
			    		for(var i=0;i<data.length;i++){
			    			if(connData[i].totalPacket!=undefined){
			    			html+="<tr><td>"+connData[i].connectoinName+"</td><td>"+connData[i].port+"</td>";
			    			var msgCount=connData[i].totalPacket;
			    			if(msgCount<=0){
			    				html+="<td bgcolor='white'> "+connData[i].totalPacket+"</td></tr>";
			    			}else{
			    				html+="<td bgcolor='white'>"+connData[i].totalPacket+"</td></tr>";
			    			}
			    		}
			    		}
			    		html+="</table>";
			    		$("#protocalOut").html(html);
			    
		    }
		});
		
	}
	
	//TOP Div
	function GetClients(urlPath) {
		//debugger;
		$.ajax({ 
		    type: 'GET', 
		    url: urlPath,
		    dataType: 'json',
		    success: function (data) { 
		        var clientsData=JSON.parse(JSON.stringify(data));
		         $("#noOfClients").html("");
		         var html="";
		    		for(var i=0;i<data.length;i++){
		    			if(clientsData[i].totalConnections!=undefined){
			    			html+="<div class='col-md-2'> <div class='small-box bg-white'><div class='inner' style='border: 1px #cecece solid; padding:20px;'>";
			    			html+="<h3><span id='tcp'>"+clientsData[i].activeConnections+"</span></h3><p><b>&nbsp;"+clientsData[i].connectoinName+"</b></p></div>";
			    			html+="<div class='icon'><i class='ion ion-ios-people-outline'></i></div></div></div>";
			    			
		    			}
		    		}
		    		$("#scorecard").html(html);
		    		
		    }
		});
		
	}
	
	
	function GetPlugInInfo(qxID) {
		$.ajax({ 
		    type: 'GET', 
		    url: getPlugInInfoURL + '/' + qxID, 
		    dataType: 'json',
		    success: function (data) { 
		        var plugInData=JSON.parse(JSON.stringify(data));
		         $("#plugInInfor").html("");
		         var html="</caption><tr><th>Name</th><th>Avg Process Time (ms)</th></div>";
		    		html+="</tr>";
		    		for(var i=0;i<data.length;i++){
		    			html+="<tr><td>"+plugInData[i].plugInName+"</td><td>";
		    			html+=plugInData[i].avgProcessTimeInMS+"</td></tr>";
		    			
		    		}
		    		html+="</table>";
		    		$("#plugInInfor").html(html);
		    		 
		    	
		    }
		});
		
	}
	
	/*function GetHistory(qxID) {
		//debugger;
		$.ajax({ 
		    type: 'GET', 
		    url: getHistoryURL + '/' + qxID, 
		    dataType: 'json',
		    success: function (data) { 
		        var histData=JSON.parse(JSON.stringify(data));
		         $("#historyTbl").html("");
		    		var html="</caption><tr><th>CONNECTOR Name</th><th>No.Of Packets</th><th>Time</th></div>";
		    		html+="</tr>";
		    		for(var i=0;i<data.length;i++){
		    			html+="<tr><td>"+histData[i].connectorName+"</td><td>"+histData[i].activeConnectrosCount+"</td><td>";
		    			html+=histData[i].time+"</td></tr>";
		    			
		    		}
		    		html+="</table>";
		    		$("#historyTbl").html(html);
		    }
		});
	}*/
	
	$('#btnUpdate').click(function() {
		updateConfigSetting();
		return false;
	});
	
	
	function updateConfigSetting() {
		debugger;
		$.ajax({
			type: 'POST',
			contentType: 'application/json',
			url: putConfigSettingsURL,
			dataType: "json",
			data: formToJSON(),
			success: function(data, textStatus, jqXHR){
				//alert('Configuration Settings updated successfully');
			},
			error: function(jqXHR, textStatus, errorThrown){
				//alert('updateConfigSetting error: ' + textStatus);
			}
		});
	}
	
	function formToJSON() {
		debugger;
		var qxId = qxId;
		var test= {	
				        "qxId": $('#qxIdId').val(),
						"tcpEngine": ($('#tcpEngineID').val()=="on"?"true":"false"),
						"wsEngine": $('#wsEngineID').val()=="on"?"true":"false",
						"mcastEngine": $('#mcastEngineID').val()=="on"?"true":"false",
						"udpEngine": $('#udpEngineID').val()=="on"?"true":"false",
						"queryEngine": $('#queryEngineID').val()=="on"?"true":"false",
						"udpEngineMulticast": $('#udpEngineMulticastID').val()=="on"?"true":"false",
						"jms": $('#jmsID').val()=="on"?"true":"false",
						"history": $('#historyID').val()=="on"?"true":"false",
						"wsDISABLEHOSTNAMEVERIFICATION": $('#wsDISABLEHOSTNAMEVERIFICATIONID').val()=="on"?"true":"false",
						"fixClientEngines": $('#fixClientEnginesID').val()=="on"?"true":"false", 
						"fixEngine": $('#fixEngineID').val()=="on"?"true":"false",
						"adminEngineListener": $('#adminEngineListenerID').val(),
						"tcpEngineListener": $('#tcpEngineListenerID').val(),
						"wsEngineListener": $('#wsEngineListenerID').val(),
						"wsSSLEngineListener": $('#wsSSLEngineListenerID').val(),
						"mcastEngineListener": $('#mcastEngineListenerID').val(),
						"udpEngineListener": $('#udpEngineListenerID').val(),
						"queryEngineListener": $('#queryEngineListenerID').val(),
						"httpTunnelEngineListener": $('#httpTunnelEngineListenerID').val(),
						"userRestrictionSize": $('#userRestrictionSizeID').val(), 
						"tcpMaxThreadPool": $('#tcpMaxThreadPoolID').val(),
						"wsMaxThreadPool": $('#wsMaxThreadPoolID').val(),
						"wsSSLKeyStore": $('#wsSSLKeyStoreID').val(),
						"wsMaxFrameSize": $('#wsMaxFrameSizeID').val(),
						"wsTimeout": $('#wsTimeoutID').val(),
						"mcastGroupPort": $('#mcastGroupPortID').val(),
						"udpEngineMutlicastGroup": $('#udpEngineMutlicastGroupID').val(),
						"jmsQueues": $('#jmsQueuesID').val(),
						"jmsQueuesDBTradeAddress": $('#jmsQueuesDBTradeAddressID').val(),
						"jmsQueuesDBTradePlugIn": $('#jmsQueuesDBTradePlugInID').val(), 
						"wsPlugIns": $('#wsPlugInsID').val(),
						"udpMessageHandlerPlugIns": $('#udpMessageHandlerPlugInsID').val(),
						"queryPlugIns": $('#queryPlugInsID').val(),
						"udpEngineBindAddress": $('#udpEngineBindAddressID').val(),
						"wsSSLKeyStorePassword": $('#wsSSLKeyStorePasswordID').val(),
						"wsDomains": $('#wsDomainsID').val(),
						"fixClientsConnectionId": $('#fixClientsConnectionIdID').val(),
						"connection1": $('#connection1ID').val(),
						"watcherProperties": $('#watcherPropertiesID').val(),
						"mcastGroupName": $('#mcastGroupNameID').val(), 
						"mcastGroupAddress": $('#mcastGroupAddressID').val(),
						"mcastEthernetAddress": $('#mcastEthernetAddressID').val()
				};
		
		console.log("form to json data"+JSON.stringify(test));
		return JSON.stringify(test);
	}
	
	
	
	$("#btnConfig").click(function(){
		//debugger;
		$.ajax({ 
		    type: 'GET', 
		    url: getConfigSettingsURL + '/' + qxId, 
		    dataType: 'json',
		    success: function (data) { 
		        var configData=JSON.parse(JSON.stringify(data));
		        /*used to clear all field values from entire current page
		        $('input[type=text],select').each(function() {
		        	$(this).val("");
		        })*/
		        
		        //-----------------------
		        //clears current div field values 
		        /*$("#div").find('input[type=text],select,checkbox').each(function() {
		        	
		        	$(this).val("");
		        })
		        --------------------------------
		        */
		        	$("#popupDiv").find('input[type=text],input[type=checkbox]').each(function() {
		        		if($(this).attr("type")=="text"){
		        			$(this).val("");
			        	}
		        		if($(this).attr("type")=="checkbox"){
		        			$(this).prop("checked",false);
		        		}
		        })
		        
		        	//if(configData.length>0){
		        	$("#psIdId").val(configData.psId);
		        	$("#qxIdId").val(configData.qxId);
		        	
		        	configData["TCP.Engine"]!=null &&configData["TCP.Engine"]==true?$("#tcpEngineID").prop("checked",true):$("#tcpEngineID").prop("checked",false);
		        	configData["WS.Engine"]!=null &&configData["WS.Engine"]==true?$("#wsEngineID").prop("checked",true):$("#wsEngineID").prop("checked",false);
		        	configData["MCAST.Engine"]!=null &&configData["MCAST.Engine"]==true?$("#mcastEngineID").prop("checked",true):$("#mcastEngineID").prop("checked",false);
		        	configData["UDP.Engine"]!=null &&configData["UDP.Engine"]==true?$("#udpEngineID").prop("checked",true):$("#udpEngineID").prop("checked",false);
		        	configData["Query.Engine"]!=null &&configData["Query.Engine"]==true?$("#queryEngineID").prop("checked",true):$("#queryEngineID").prop("checked",false);
		        	configData["UDP.EngineMulticast"]!=null &&configData["UDP.EngineMulticast"]==true?$("#udpEngineMulticastID").prop("checked",true):$("#udpEngineMulticastID").prop("checked",false);
		        	configData["JMS"]!=null &&configData["JMS"]==true?$("#jmsID").prop("checked",true):$("#jmsID").prop("checked",false);
		        	configData["history"]!=null &&configData["history"]==true?$("#historyID").prop("checked",true):$("#historyID").prop("checked",false);
		        	configData["WS.DISABLEHOSTNAMEVERIFICATION"]!=null &&configData["WS.DISABLEHOSTNAMEVERIFICATION"]==true?$("#wsDISABLEHOSTNAMEVERIFICATIONID").prop("checked",true):$("#wsDISABLEHOSTNAMEVERIFICATIONID").prop("checked",false);
		        	configData["FIX.Client.Engines"]!=null &&configData["FIX.Client.Engines"]==true?$("#fixClientEnginesID").prop("checked",true):$("#fixClientEnginesID").prop("checked",false);
		        	configData["FIX.Engine"]!=null &&configData["FIX.Engine"]==true?$("#fixEngineID").prop("checked",true):$("#fixEngineID").prop("checked",false);
		        	
		        	$("#adminEngineListenerID").val(configData["Admin.EngineListener"]);
		        	$("#tcpEngineListenerID").val(configData["TCP.EngineListener"]);
		        	$("#wsEngineListenerID").val(configData["WS.EngineListener"]);
		        	$("#wsSSLEngineListenerID").val(configData["wsSSLEngineListener"]);
		        	$("#mcastEngineListenerID").val(configData["WS.SSLEngineListener"]);
		        	$("#udpEngineListenerID").val(configData["UDP.EngineListener"]);
		        	$("#queryEngineListenerID").val(configData["Query.EngineListener"]);
		        	$("#httpTunnelEngineListenerID").val(configData["HTTPTunnel.EngineListener"]);
		        	$("#userRestrictionSizeID").val(configData["UserRestrictionSize"]);
		        	$("#tcpMaxThreadPoolID").val(configData["TCP.MaxThreadPool"]);
		        	$("#wsMaxThreadPoolID").val(configData["WS.MaxThreadPool"]);
		        	$("#wsSSLKeyStoreID").val(configData["WS.SSLKeyStore"]);
		        	$("#wsMaxFrameSizeID").val(configData["WS.MaxFrameSize"]);
		        	$("#wsTimeoutID").val(configData["WS.Timeout"]);
		        	$("#mcastGroupPortID").val(configData["MCAST.GroupPort"]);
		        	$("#udpEngineMutlicastGroupID").val(configData["UDP.EngineMutlicastGroup"]);
		        	$("#jmsQueuesID").val(configData["JMS.Queues"]);
		        	$("#jmsQueuesDBTradeAddressID").val(configData["JMS.Queues.DBTrade.Address"]);
		        	$("#jmsQueuesDBTradePlugInID").val(configData["JMS.Queues.DBTrade.PlugIn"]);
		        	$("#wsPlugInsID").val(configData["WS.PlugIns"]);
		        	$("#udpMessageHandlerPlugInsID").val(configData["UDP.MessageHandlerPlugIns"]);
		        	$("#queryPlugInsID").val(configData["Query.PlugIns"]);
		        	$("#udpEngineBindAddressID").val(configData["UDP.EngineBindAddress"]);
		        	$("#wsSSLKeyStorePasswordID").val(configData["WS.SSLKeyStorePassword"]);
		        	$("#wsDomainsID").val(configData["WS.Domains"]);
		        	$("#fixClientsConnectionIdID").val(configData["FIX.Clients.ConnectionId"]);
		        	$("#connection1ID").val(configData["CONNECTION1"]);
		        	$("#watcherPropertiesID").val(configData["Watcher.Properties"]);
		        	$("#mcastGroupNameID").val(configData["MCAST.GroupName"]);
		        	$("#mcastGroupAddressID").val(configData["MCAST.GroupAddress"]);
		        	$("#mcastEthernetAddressID").val(configData["MCAST.EthernetAddress"]);
		        	//}
		    }
		});
	})
	
	setInterval(function(){
		//alert("refreshurl..."+urlPath); 
		GetProtocolsIN(urlPath);
		GetClients(urlPath);
		}, 60000);
	

	function GetChart(qxID,callback) {
		$.ajax({ 
		    type: 'GET', 
		    url: getHistoryFeedURL + '/' + qxID, 
		    dataType: 'json',
		    success: function (data) { 
		    	callback(data);
		    }
		});
		
	}
	
	//chart.js graph
	var ctx = document.getElementById('myChart').getContext('2d');
	var chartData;
	 GetChart(1, function(data){
		 chartData= data;
		 console.log("mahi...."+data);
		 var myChart = new Chart(ctx, {
			  type: 'line',
			  data: chartData
			  
			});
	})
	

});