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

<%@ include file="../../include/head.jsp"%>
<style>
#container_box table {
	width: 1600px;
}

#container_box table th {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding: 10px;
	border-bottom: 2px solid #666;
}

#container_box table img {
	width: 150px;
	height: auto;
}

#container_box table td {
	padding: 10px;
	text-align: center;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
}

.orderInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}

.orderView li {
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999;
}

.orderView li::after {
	content: "";
	display: block;
	clear: both;
}

.thumb {
	float: left;
	width: 200px;
}

.thumb img {
	width: 200px;
	height: 200px;
}

.gdsInfo {
	float: right;
	width: calc(100% - 220px);
	line-height: 2;
}

.gdsInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 100px;
	margin-right: 10px;
}

.deliveryChange {
	text-align: right;
}

.delivery1_btn, .delivery2_btn {
	font-size: 16px;
	background: #fff;
	border: 1px solid #999;
	margin-left: 10px;
}
</style>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="../../include/main_header.jsp"%>

		<%@ include file="../../include/left_column.jsp"%>


		<!-- 여기만 잇으면됨 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Jeong Chan Page.... <small>상품관리자 목록페이지</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">

						<span class="info-box-icon bg-aqua"><i
							class="glyphicon glyphicon-shopping-cart"></i></span>



						<div class="info-box-content">
							<a href="/admin/goods/register"><span class="info-box-text">상품
									등록</span></a> <span class="info-box-number"><small>상품을
									등록하세요</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-sm-6 col-xs-12">

					<div class="info-box">
						<span class="info-box-icon bg-red"><i
							class="glyphicon glyphicon-list-alt"></i></span>

						<div class="info-box-content">
							<a href="/admin/goods/list"><span class="info-box-text">상품
									목록</span></a> <span class="info-box-number"><small>상품 목록입니다</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>

					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">

						<span class="info-box-icon bg-aqua"><i
							class="glyphicon glyphicon glyphicon-barcode"></i></span>



						<div class="info-box-content">
							<a href="/admin/shop/orderList"><span class="info-box-text">주문
									목록</span></a> <span class="info-box-number"><small>주문
									목록입니다.</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- fix for small devices only -->
				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-green"><i
							class="glyphicon glyphicon-bullhorn"></i></span>

						<div class="info-box-content">
							<a href="/admin/shop/allReply"><span class="info-box-text">상품 소감</span> </a> <span
								class="info-box-number"><small>유저들의 상품 소감들 입니다.</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
        <!--  <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="glyphicon glyphicon-user"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">유저 목록</span>
              <span class="info-box-number"><small>유저 목록입니다.</small></span>
            </div>
            
          </div>
          
		</div>-->
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
				<!-- Info boxes -->
				<div class="orderInfo">
					<c:forEach items="${orderView}" var="orderView" varStatus="status">

						<c:if test="${status.first}">
							<p>
								<span>주문자</span>${orderView.userId}</p>
							<p>
								<span>수령인</span>${orderView.orderRec}</p>
							<p>
								<span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2}
								${orderView.userAddr3}
							</p>
							<p>
								<span>가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.amount}" />
								원
							</p>
							<p>
								<span>상태</span> ${orderView.delivery}</p>

							<div class="deliveryChange">
								<form role="form" method="post" class="deliveryForm">

									<input type="hidden" name="orderId"
										value="${orderView.orderId}" /> <input type="hidden"
										name="delivery" class="delivery" value="" />

									<button type="button" class="delivery1_btn">배송 중</button>
									<button type="button" class="delivery2_btn">배송 완료</button>

									<script>
										$(".delivery1_btn").click(function() {
											$(".delivery").val("배송 중");
											run();
										});

										$(".delivery2_btn").click(function() {
											$(".delivery").val("배송 완료");
											run();

										});

										function run() {
											$(".deliveryForm").submit();
										}
									</script>
								</form>
							</div>
						</c:if>

					</c:forEach>
				</div>

				<ul class="orderView">
					<c:forEach items="${orderView}" var="orderView">
						<li>
							<div class="thumb">
								<img src="${orderView.gdsThumbImg}" />
							</div>
							<div class="gdsInfo">
								<p>
									<span>상품명</span>${orderView.gdsName}<br /> <span>개당 가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${orderView.gdsPrice}" />
									원<br /> <span>구입 수량</span>${orderView.cartStock} 개<br /> <span>최종
										가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${orderView.gdsPrice * orderView.cartStock}" />
									원
								</p>
							</div>
						</li>
					</c:forEach>
				</ul>





			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../../include/main_footer.jsp"%>


	</div>

	<%@ include file="../../include/plugin_js.jsp"%>

</body>
</html>