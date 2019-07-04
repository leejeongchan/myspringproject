<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->

<html>

<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="../../../web/css/custom.css?after">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/head.jsp" %>
<script type="text/javascript">
var lastID = 0;
function submitFunction() {
	console.log("1");

	var chatName = $('#chatName').val();
	var chatContent = $('#chatContent').val();
	console.log(chatName);
	console.log(chatContent);
	$.ajax({
		type : "POST",
		url : "/ChatSubmit",
		data : {
			chatName : encodeURIComponent(chatName),
			chatContent : encodeURIComponent(chatContent)
		},
		success : function(result) {
			if (result == 1) {
				autoClosingAlert('#successMessage', 2000);
			} else if (result == 0) {
				autoClosingAlert('#dangerMessage', 2000);
			} else {
				autoClosingAlert('#warningMessage', 2000);
			}

		}

	});
	$('#chatContent').val('');
}
function autoClosingAlert(selector, delay) {

	var alert = $(selector).alert();
	alert.show();
	window.setTimeout(function() {
		alert.hide()
	}, delay);
}

function chatListFunction(type) {

	$.ajax({
		type : "POST",
		url : "/ChatList",
		data : {
			listType : type,
		},
		success : function(data) {
			if(data == "") return;
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for (var i = 0; i < result.length; i++) {
				addChat(result[i][0].value, result[i][1].value,
						result[i][2].value);

			}
			lastID = Number(parsed.last);

		}

	});

}
function addChat(chatName, chatContent, chatTime) {
	$('#chatList')
			.append(
					'<div class="row">'
							+ '<div class="col-lg-12">'
							+ '<div class="media">'
							+ '<a class="pull-left" href="#">'
							+ '<img src="http://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="ui-w-100 rounded-circle" width="52" height="52">'
							+ '</a>' + '<div class="media-bdoy">'
							+ '<h4 class="media-heading">' + chatName
							+ '<span class="small pull-right">' + chatTime
							+ '</span>' + '</h4>' + '<p>' + chatContent
							+ '</p>' + '</div>' + '</div>' + '</div>'
							+ '</div>' + '<hr>');
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
}
function getInfiniteChat(){
	setInterval(function(){
		chatListFunction(lastID);
	},1000);
}
</script>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@ include file="../include/main_header.jsp" %>
  
  <%@ include file="../include/left_column.jsp" %>
  
  
  <!-- 여기만 잇으면됨 -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Jeong Chan Page....
        <small>익명 채팅방</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>
		
    <!-- Main content -->
    <section class="content container-fluid">
		
          <!-- Direct Chat -->
      
        
        <div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-md-8">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green"></i>실시간 채팅방
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse in">
							<div id="chatList" class="portlet-body chat-widget"
								style="overflow-y: auto; width: auto; height: 600px;"></div>
							<!-- 입력 하는 부분 -->
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										<input style="height: 40px;" type="text" id="chatName"
											class="form-control ml-3" placeholder="이름" maxlength="8">

									</div>

								</div>
								<div class="row" style="height: 90px;">
									<div class="form-group col-xs-10">
										<textarea style="height: 80px; width: 600px" id="chatContent"
											class="form-control ml-3" placeholder="메시지를 입력하세요."
											maxlength="1000"></textarea>
									</div>
									<div class="form-gorup col-xs-2">
										<button type="button" class="btn btn-success pull-rigth ml-2"
											onclick="submitFunction();">전송</button>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
          
        
		

    </section>
    <!-- /.content -->
  </div>
  

<%@ include file="../include/main_footer.jsp" %>
  
<%@ include file="../include/plugin_js.jsp" %>

<script type="text/javascript">
		$(document).ready(function() {
			console.log("documentready");
			chatListFunction('ten');
			getInfiniteChat();
		});
</script> 
</div>

</body>
</html>