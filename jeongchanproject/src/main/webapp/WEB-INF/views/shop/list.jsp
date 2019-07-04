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
					Jeong Chan Page.... <small>상품목록</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>


			</section>

			<!-- Main content -->
			<section id="content" class="content container-fluid">
				<!-- Info boxes -->

				<div class="container" style="margin-top: 50px;">
					<div class="row">
						<c:forEach items="${list}" var="list">
							<div class="col-xs-12 col-sm-6 col-md-3">
								<div class="col-item">
									<div class="post-img-content">
										<img src="${list.gdsThumbImg}" class="img-responsive" />
										<!--  <span class="post-title"> <b>Perfumes</b><br> <b>Clássico</b>
									</span> <span class="round-tag">-15%</span>-->
									</div>
									<div class="info">
										<div class="row">
											<div class="price col-md-6">
												<h5>${list.gdsName}</h5>
												<h5 class="price-text-color">${list.gdsPrice }</h5>
											</div>

										</div>
										<div class="separator clear-left">
											
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
						</c:forEach>


					</div>
				</div>







			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../include/main_footer.jsp"%>


	</div>

	<%@ include file="../include/plugin_js.jsp"%>

</body>

</html>