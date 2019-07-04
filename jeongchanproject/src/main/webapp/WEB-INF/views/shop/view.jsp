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

.gallery-wrap .img-big-wrap img {
	height: 500px;
	width: 600px;
	display: inline-block;
	cursor: zoom-in;
}

.gallery-wrap .img-small-wrap .item-gallery {
	width: 60px;
	height: 60px;
	border: 1px solid #ddd;
	margin: 7px 2px;
	display: inline-block;
	overflow: hidden;
}

.gallery-wrap .img-small-wrap {
	text-align: center;
}

.gallery-wrap .img-small-wrap img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
	border-radius: 4px;
	cursor: zoom-in;
}

section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.userInfo {
	
}

section.replyList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}
section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }

 div.replyModal { position:relative; z-index:1; display:none; }
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:550px; height:300px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }

</style>

<%@ include file="../include/head.jsp"%>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

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
					Jeong Chan Page.... <small>상품상세페이지</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>


			</section>

			<!-- Main content -->
			<section id="content" class="content container-fluid">
				<form role="form" method="post">
					<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
				</form>
				<div class="card">
					<div class="row">
						<aside class="col-sm-5 border-right">
							<article class="gallery-wrap">
								<div class="img-big-wrap">
									<div>
										<a href="#"><img src="${view.gdsImg}"></a>
									</div>
								</div>

								<!-- slider-nav.// -->
							</article>
							<!-- gallery-wrap .end// -->
						</aside>
						<aside class="col-sm-7">
							<article class="card-body p-5">
								<h3 class="title mb-3">${view.gdsName}</h3>

								<p class="price-detail-wrap">
									<span class="price h3 text-warning"> <span
										class="currency">KOR ￦</span><span class="num"><fmt:formatNumber
												pattern="###,###,###" value="${view.gdsPrice}"></fmt:formatNumber></span>
									</span> <span>/per kg</span>
								</p>
								<!-- price-detail-wrap .// -->
								<dl class="item-property">
									<dt>상품소개</dt>
									<dd>
										<p>${view.gdsDes}</p>
									</dd>
								</dl>
								<dl class="param param-feature">
									<dt>상품 수량#</dt>
									<dd>${view.gdsStock}</dd>
								</dl>

								<!-- item-property-hor .// -->
								<dl class="param param-feature">
									<dt>Delivery</dt>
									<dd>Russia, USA, and Europe</dd>
								</dl>
								<!-- item-property-hor .// -->

								<hr>
								<c:if test="${view.gdsStock !=0}">
										
										
								<div class="row">
									<div class="col-sm-5">
										<dl class="param param-inline">
										
											<dt>구입수량:</dt>
											<input type="number" id="numBox" cmin="1" max="${view.gdsStock}"
												value="1" />

										</dl>
										<!-- item-property .// -->
									</div>


								</div>
								<!-- row.// -->
								<hr>
								<a href="#" class="btn btn-lg btn-primary text-uppercase">
									구입 </a>
								<button type="button" class="btn btn-warning addCart_btn">장바구니에 담기
								
								</button>
								</c:if>
								<c:if test="${view.gdsStock == 0 }">
									<p>품절</p>
								</c:if>
								<script type="text/javascript">
									$(".addCart_btn").click(function(){
										var gdsNum =$("#gdsNum").val();
										var cartStock = $("#numBox").val();
										
										var data = {
												gdsNum : gdsNum,
												cartStock : cartStock
										};
										
										$.ajax({
											url:"/shop/view/addCart",
											type:"post",
											data:data,
											dataType: "json",
											success:function(result){
												if(result==1){
													alert("카트 담기 성공");
													$("#numBox").val("1");
												}else{
													alert("회원만 사용 가능합니다.");
													$("#numBox").val("1");

												}
												
											},
											error: function(){
												alert("카트 실패");
											}
											
										
										});
									});
								</script>
							</article>
							<!-- card-body.// -->

						</aside>
						<!-- col.// -->
					</div>
					<!-- row.// -->
				</div>
				<!-- card.// -->
				<div id="reply">
					<c:if test="${login == null }">
						<p>
							소감을 남기시려면 <a href="/user/login">로그인</a>해주세요
						</p>
					</c:if>
					<c:if test="${login !=null }">
						<section class="replyForm">
							<form role="form" method="post" autocomplete="off">
								<input type="hidden" id="gdsNum" name="gdsNum"
									value="${view.gdsNum}">
								<div class="input_area">
									<textarea name="repCon" id="repCon"></textarea>
								</div>

								<div class="input_area">
									<button type="button" id="reply_btn">소감 남기기</button>

								</div>
							</form>
						</section>
					</c:if>
					<section class="replyList">
						<ol>
							<!--<c:forEach items="${reply}" var="reply">
							<li>
								<div class="userInfo">
									<span class="userName">${reply.user_name}</span>
									<span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd"/></span>
								</div>
								<div class="replyContent">${reply.repCon}</div>
							</li>
							
							</c:forEach>-->

						</ol>
						<script type="text/javascript">
						function replyList() {
							var gdsNum = ${view.gdsNum};
							//ajax는 예외처리가 가능하고 getJson은 예외철 불가능 
							$.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data) {
								var str = "";

								$(data).each(
										function() {
											console.log(data);

											var repDate = new Date(this.repDate);
											repDate = repDate.toLocaleDateString("ko-US");

											str += "<li data-repNum='" + this.repNum + "'>"
													+ "<div class='userInfo'>"
													+ "<span class='userName'>"
													+ this.user_name + "</span>"
													+ "<span class='date'>" + repDate
													+ "</span>" + "</div>"
													+ "<div class='replyContent'>"
													+ this.repCon + "</div>" 
													+ "<c:if test='${login!=null}'>"
													+ "<div class='replyFooter'>"
													+ "<button type='button' class='modify' data-repNum='" + this.repNum + "'>수정</button>"
													+ "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
													+ "</div>"
													+ "</c:if>"
													+ "</li>";

										});

								$("section.replyList ol").html(str);
							});
						}
							replyList();
						</script>
						<script type="text/javascript">
						
							$(document).on("click",".delete",function(){
								var deleteConfirm = confirm("정말로 소감을 삭제하시겠습니까?");
								if(deleteConfirm){
								console.log($(this).attr("data-repNum"));
								var data = {repNum:$(this).attr("data-repNum")};
								$.ajax({
									url:"/shop/view/deleteReply",
									type:"post",
									data:data,
									dataType: "json",
									success:function(result){
										console.log("result : "+result);
										if(result == 1){
											console.log("if 통과");
											replyList();
										}else{
											alert("작성자 본인만 삭제가 가능합니다.");
										}
										
									},
									error: function(){
										alert("로그인을 하세요.");
									}
								});
								}
							});
							
						</script>
					</section>

				</div>



			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../include/main_footer.jsp"%>


	</div>

	<%@ include file="../include/plugin_js.jsp"%>
	<!-- 후기 수정 모달 창 -->
	<div class="replyModal">
		<div class="modalContent">
			<div>
				<textarea name="modal_repCon" class="modal_repCon">
				</textarea>
			</div>
			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancle">취소</button>
			</div>
		</div>
		<div class="modalBackground"></div>
	</div>
	<script type="text/javascript">
	$(document).on("click",".modify",function(){
		$(".replyModal").fadeIn(200);
		
		var repNum = $(this).attr("data-repNum");
		var repCon = $(this).parent().parent().children(".replyContent").text();
		
		$(".modal_repCon").val(repCon);
		$(".modal_modify_btn").attr("data-repNum",repNum);
	});
	$(".modal_cancle").click(function(){
		$(".replyModal").fadeOut(200);
	});
	$(".modal_modify_btn").click(function(){
		var modifyConfirm = confirm("정말로 수정하시겠습니까?");
		
		if(modifyConfirm){
			var data = {
					repNum : $(this).attr("data-repNum"),
					repCon : $(".modal_repCon").val()
			};
			$.ajax({
				url: "/shop/view/modifyReply",
				type:"post",
				data:data,
				dataType:"json",
				success:function(result){
					if(result==1){
						replyList();
						$(".replyModal").fadeOut(200);
						
					}else{
						alert("작성자 본인만 할 수 있습니다.");
					}
				},
				error:function(){
					alert("로그인을 하셔야합니다.");
				}
			});
		}
	});
	
	
	</script>
</body>

<script type="text/javascript">
			
		$("#reply_btn").click(function() {
			var formObj = $(".replyForm form[role='form']");
			var gdsNum = $("#gdsNum").val();
			var repCon = $("#repCon").val();

			var data = {
				gdsNum : gdsNum,
				repCon : repCon
			};

			$.ajax({
				url : "/shop/view/registReply",
				type : "post",
				data : data,
				success : function() {
					replyList();
					$("#repCon").val("");
				}
			});

		});
	</script>
</html>