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
<style>
section#content ul li {
	display: inline-block;
	margin: 10px;
}

section#content div.goodsThumb img {
	width: 200px;
	heigth: 200px;
}

section#content div.goodsName {
	padding: 10px 0;
	text-align: center;
}

section#content div.goodsName a {
	color: #000;
}

@import
	url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css)
	;

.col-item {
	border: 1px solid #E1E1E1;
	border-radius: 10px;
	background: #FFF;
}

.col-item:hover {
	box-shadow: 0px 2px 5px -1px #000;
	-moz-box-shadow: 0px 2px 5px -1px #000;
	-webkit-box-shadow: 0px 2px 5px -1px #000;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 10px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	border-bottom: 2px solid #52A1D5;
}

.col-item .photo img {
	margin: 0 auto;
	width: 100%;
	padding: 1px;
	border-radius: 10px 10px 0 0;
}

.col-item .info {
	padding: 10px;
	border-radius: 0 0 5px 5px;
	margin-top: 1px;
}

.col-item .price {
	/*width: 50%;*/
	float: left;
	margin-top: 5px;
}

.col-item .price h5 {
	line-height: 20px;
	margin: 0;
}

.price-text-color {
	color: #219FD1;
}

.col-item .info .rating {
	color: #777;
}

.col-item .rating {
	/*width: 50%;*/
	float: left;
	font-size: 17px;
	text-align: right;
	line-height: 52px;
	margin-bottom: 10px;
	height: 52px;
}

.col-item .separator {
	border-top: 1px solid #E1E1E1;
}

.clear-left {
	clear: left;
}

.col-item .separator p {
	line-height: 20px;
	margin-bottom: 0;
	margin-top: 10px;
	text-align: center;
}

.col-item .separator p i {
	margin-right: 5px;
}

.col-item .btn-add {
	width: 50%;
	float: left;
}

.col-item .btn-add {
	border-right: 1px solid #E1E1E1;
}

.col-item .btn-details {
	width: 50%;
	float: left;
	padding-left: 10px;
}

.controls {
	margin-top: 20px;
}

[data-slide="prev"] {
	margin-right: 10px;
}

/*
Hover the image
*/
.post-img-content {
	height: 196px;
	position: relative;
}

.post-img-content img {
	position: absolute;
	padding: 1px;
	border-radius: 10px 10px 0 0;
}

.post-title {
	display: table-cell;
	vertical-align: bottom;
	z-index: 2;
	position: relative;
}

.post-title b {
	background-color: rgba(51, 51, 51, 0.58);
	display: inline-block;
	margin-bottom: 5px;
	margin-left: 2px;
	color: #FFF;
	padding: 10px 15px;
	margin-top: 10px;
	font-size: 12px;
}

.post-title b:first-child {
	font-size: 14px;
}

.round-tag {
	width: 60px;
	height: 60px;
	border-radius: 50% 50% 50% 0;
	border: 4px solid #FFF;
	background: #37A12B;
	position: absolute;
	bottom: 0px;
	padding: 15px 6px;
	font-size: 17px;
	color: #FFF;
	font-weight: bold;
}
.listResult { padding:20px; background:#bebebe; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }
.orderInfo { border:5px solid #eee; padding:20px;  }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}

</style>
<%@ include file="../include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="/board/list" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>JC</b>P</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>JeongChan</b>Project</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="/shop/list?c=200&l=1">상의 <span
								class="sr-only">(current)</span></a></li>
						<li><a href="/shop/list?c=300&l=1">하의</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">악세서리 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/shop/list?c=100&l=1">전체</a></li>
								<li><a href="/shop/list?c=101&l=2">목걸이</a></li>
								<li><a href="/shop/list?c=102&l=2">팔찌</a></li>
								<li><a href="/shop/list?c=103&l=2">벨트</a></li>
								<li><a href="/shop/list?c=104&l=2">반지</a></li>
							</ul></li>
						<li><a href="/shop/list?c=400&l=1">신발</a></li>
						<li><a href="/shop/cartList">장바구니</a></li>
						<li><a href="/shop/orderList">주문목록</a></li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" id="navbar-search-input"
								placeholder="Search">
						</div>
					</form>
				</div>

				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<c:if test="${not empty login}">
							<!-- Messages: style can be found in dropdown.less-->
							<li class="dropdown user user-menu">
								<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <img
									src="../../resources/dist/img/user2-160x160.jpg"
									class="user-image" alt="User Image"> <span
									class="hidden-xs">${login.userName}</span>
							</a>
								<ul class="dropdown-menu">
									<li class="user-header"><img
										src="../../resources/dist/img/user2-160x160.jpg"
										class="user-image" alt="User Image">
										<p>${login.userName}
											<small> 가입일자: <fmt:formatDate
													value="${login.userJoinDate}" pattern="yyyy-MM-dd" /><br>
												직위: <c:if test="${login.userAdmin eq 1}">상품관리자</c:if> <c:if
													test="${login.userAdmin ne 1}">일반사용자</c:if>
											</small>
										</p></li>


									<!-- Menu Body -->
									<li class="user-body">
										<div class="row">
											<div class="col-xs-4 text-center">
												<a href="#">게시글</a>
											</div>
											<c:if test="${login.userAdmin eq 1}">
												<div class="col-xs-4 text-center">
													<a href="/admin/adminview">관리자페이지</a>
												</div>
											</c:if>

											<div class="col-xs-4 text-center">
												<a href="#">북마크</a>
											</div>
										</div> <!-- /.row -->
									</li>
									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a href="/user/info" class="btn btn-default btn-flat">나의
												정보</a>
										</div>
										<div class="pull-right">
											<a href="/user/logout" class="btn btn-default btn-flat">로그아웃</a>
										</div>
									</li>
								</ul>
							</li>
						</c:if>
						<c:if test="${empty login}">
							<li class="dropdown user user-menu">
								<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <img
									src="../../resources/dist/img/user2-160x160.jpg"
									class="user-image" alt="User Image"> <span
									class="hidden-xs">회원가입 또는 로그인</span>
							</a>
								<ul class="dropdown-menu">
									<li class="user-header"><img
										src="../../resources/dist/img/user2-160x160.jpg"
										class="user-image" alt="User Image">
										<p>
											<b>회원가입 또는 로그인 해주세요!!</b> <small> </small>
										</p></li>

									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a href="/user/register" class="btn btn-default btn-flat"><i
												class="fa fa-user-plus"></i><b>회원가입</b></a>
										</div>
										<div class="pull-right">
											<a href="/user/login" class="btn btn-default btn-flat"><i
												class="glyphicon glyphicon-log-in"></i><b>로그인</b></a>
										</div>
									</li>
								</ul>
							</li>
						</c:if>
					</ul>
				</div>
			</nav>
		</header>

		<%@ include file="../include/left_column.jsp"%>


		<!-- 여기만 잇으면됨 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Jeong Chan Page.... <small>장바구니</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>


			</section>

			<!-- Main content -->
			<section id="content" class="content container-fluid">
				<!-- Info boxes -->
				<ul>
					<li>
						<div class="allCheck">
							<input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">모두 선택</label>
							<script type="text/javascript">
								$("#allCheck").click(function(){
									var chk = $("#allCheck").prop("checked");
									if(chk){
										$(".chBox").prop("checked",true);
									}else{
										$(".chBox").prop("checked",false);
										
									}
								});
							</script>
						</div>
						<div class="delBtn">
							<button type="button" class="selectDelete_btn btn-danger">선택삭제</button>
							<script type="text/javascript">
								$(".selectDelete_btn").click(function(){
									
									var confirm_val = confirm("정말로 삭제하시겠습니까?");
									if(confirm_val){
										var checkArr = new Array();
										
										$("input[class='chBox']:checked").each(function(){
											
											checkArr.push($(this).attr("data-cartNum"));
										});
										$.ajax({
											url:"/shop/deleteCart",
											type:"post",
											data:{chbox: checkArr},
											dataType:"json",
											success:function(result){
												if(result == 1){
													location.href="/shop/cartList";
												}else{
													alert("삭제실패");
												}
												
											}
										});
										
									}
								});
								
							
							</script>
						</div>
					</li>
				</ul>

				<div class="container" style="margin-top: 50px;">
					<div class="row">
						<c:set var="sum" value="0"/>
						<c:forEach items="${cartList}" var="list">
							<div class="col-xs-12 col-sm-6 col-md-3">
								<div class="col-item">
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox" data-cartNum="${list.cartNum}"/>
										<script type="text/javascript">
											$(".chBox").click(function(){
												$("#allCheck").prop("checked",false);
											});
										</script>
									</div>
									<div class="post-img-content">
										<img src="${list.gdsThumbImg}" class="img-responsive" />
										<!--  <span class="post-title"> <b>Perfumes</b><br> <b>Clássico</b>
									</span> <span class="round-tag">-15%</span>-->
									</div>
									<div class="info">
										<div class="row">
											<div class="price col-md-6">
												<h5>${list.gdsName}</h5>
												<h5 class="price-text-color">${list.gdsPrice}원</h5>
												<h5>수량:${list.cartStock}개</h5>
												<h5>총계:<fmt:formatNumber pattern="###,###,###" value="${list.gdsPrice * list.cartStock}"/>원</h5>
											</div>

										</div>
										<div class="separator clear-left">
											<!--<p class="btn-add">
												<i class="fa fa-shopping-cart"></i><a href="#"
													class="hidden-sm">삭제</a>
											</p>-->
											<button type="button" class="delete_${list.cartNum}_btn btn-danger" data-cartNum="${list.cartNum}">삭제</button>
											<script type="text/javascript">
												$(".delete_${list.cartNum}_btn").click(function(){
													
													var confirm_val = confirm("정말로 삭제하시겠습니까?");
													if(confirm_val){
														var checkArr = new Array();
														
														checkArr.push($(this).attr("data-cartNum"));
														
														$.ajax({
															url:"/shop/deleteCart",
															type:"post",
															data:{chbox: checkArr},
															dataType:"json",
															success:function(result){
																if(result == 1){
																	location.href="/shop/cartList";
																}else{
																	alert("삭제실패");
																}
																
															}
														});
														
													}
												});
												
							
											</script>
											<p class="btn-details">
												<i class="fa fa-list"></i><a
													href="/shop/view?n=${list.gdsNum}" class="hidden-sm">More
													details</a>
											</p>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							<c:set var="sum" value="${sum + (list.gdsPrice * list.cartStock)}"/>
						</c:forEach>


					</div>
				</div>
				
				<div class="listResult">
					<div class="sum">
						총 합계: <fmt:formatNumber pattern="###,###,###" value="${sum}"/>원
						
					</div>
					<div class="orderOpne">
						<button type="button" class="orderOpne_but">주문 정보 입력</button>
						<script>
							 $(".orderOpne_bnt").click(function(){
								 console.log("1");
							  $(".orderInfo").slideDown();
							  $(".orderOpne_bnt").slideUp();
							 });      
						</script>
					
					</div>
				
				</div>
				
				<div class="orderInfo">
					 <form role="form" method="post" autocomplete="off">
					    
					  <input type="hidden" name="amount" value="${sum}" />
					    
					  <div class="inputArea">
					   <label for="">수령인</label>
					   <input type="text" name="orderRec" id="orderRec" required="required" />
					  </div>
					  
					  <div class="inputArea">
					   <label for="orderPhon">수령인 연락처</label>
					   <input type="text" name="orderPhon" id="orderPhon" required="required" />
					  </div>
					  <div class="form-group">                   
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="userAddr1" id="userAddr1" type="text" readonly="readonly" >
				    	<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
					  </div>
					  <div class="form-group">
					    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="userAddr2" id="userAddr2" type="text" readonly="readonly" />
					  </div>
					  <div class="form-group">
					    <input class="form-control" placeholder="상세주소" name="userAddr3" id="userAddr3" type="text"  />
				   	  </div>
				   	  
					  <!--  <div class="inputArea">
					   <label for="userAddr1">우편번호</label>
					   <input type="text" name="userAddr1" id="userAddr1" value="${login.addr1}" required="required" />
					  </div>
					  
					  <div class="inputArea">
					   <label for="userAddr2">1차 주소</label>
					   <input type="text" name="userAddr2" id="userAddr2" value="${login.addr2}" required="required" />
					  </div>
					  
					  <div class="inputArea">
					   <label for="userAddr3">2차 주소</label>
					   <input type="text" name="userAddr3" id="userAddr3" value="${login.addr3}" required="required" />
					  </div>
					  -->
					  <div class="inputArea">
					   <button type="submit" class="order_btn">주문</button>
					   <button type="button" class="cancel_btn">취소</button>
					 
					  </div>
					  
					 </form> 
				</div>

			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../include/main_footer.jsp"%>


	</div>

	<%@ include file="../include/plugin_js.jsp"%>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	function execPostCode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	               extraRoadAddr += data.bname;
	           }
	           // 건물명이 있고, 공동주택일 경우 추가한다.
	           if(data.buildingName !== '' && data.apartment === 'Y'){
	              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	           }
	           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	           if(extraRoadAddr !== ''){
	               extraRoadAddr = ' (' + extraRoadAddr + ')';
	           }
	           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	           if(fullRoadAddr !== ''){
	               fullRoadAddr += extraRoadAddr;
	           }

	           // 우편번호와 주소 정보를 해당 필드에 넣는다.
	           console.log(data.zonecode);
	           console.log(fullRoadAddr);
	           
	           
	           $("[name=userAddr1]").val(data.zonecode);
	           $("[name=userAddr2]").val(fullRoadAddr);
	           
	           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	       }
	    }).open();
	}
	
	</script>
</body>

</html>