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
div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
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
          <div class="info-box" >
          
            <span class="info-box-icon bg-aqua"><i class="glyphicon glyphicon glyphicon-barcode"></i></span>
		  
          
          
            <div class="info-box-content">
              <a href="/admin/shop/orderList"><span class="info-box-text">주문 목록</span></a>
              <span class="info-box-number"><small>주문 목록입니다.</small></span>
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
				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
						<li>
							<div>
								<p>
									<span>주문번호</span><a
										href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
								</p>
								<p>
									<span>주문자</span>${orderList.userId}</p>
								<p>
									<span>수령인</span>${orderList.orderRec}</p>
								<p>
									<span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2}
									${orderList.userAddr3}
								</p>
								<p>
									<span>가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${orderList.amount}" />
									원
								</p>
								<p><span>상태</span> ${orderList.delivery}</p>
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