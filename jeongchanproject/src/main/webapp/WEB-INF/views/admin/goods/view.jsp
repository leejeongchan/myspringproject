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
.oriImg{width:500px; height:auto;}
.thumbImg{}
.gdsDes img { max-width:600px; height:auto; }

</style>
<%@ include file="../../include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="../../include/main_header.jsp"%>

		<%@ include file="../../include/left_column.jsp"%>


		<!-- 여기만 잇으면됨 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Jeong Chan Page.... <small>상품관리자 상품조회페이지</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
				
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box" >
          
            <span class="info-box-icon bg-aqua"><i class="glyphicon glyphicon-shopping-cart"></i></span>
		  
          
          
            <div class="info-box-content">
              <a href="/admin/goods/register"><span class="info-box-text">상품 등록</span></a>
              <span class="info-box-number"><small>상품을 등록하세요</small></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
        
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="glyphicon glyphicon-list-alt"></i></span>

            <div class="info-box-content">
              <a href="/admin/goods/list"><span class="info-box-text">상품 목록</span></a>
              <span class="info-box-number"><small>상품 목록입니다</small></span>
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
            <span class="info-box-icon bg-green"><i class="glyphicon glyphicon-bullhorn"></i></span>

            <div class="info-box-content">
              <a href="/admin/shop/allReply"><span class="info-box-text">상품 소감</span> </a>
              <span class="info-box-number"><small>유저들의 상품 소감들 입니다.</small></span>
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
   
				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="n" value="${goods.gdsNum}"/>
					<div class="col-md-6">

						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">상품 등록</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->

							<div class="box-body">
								<div class="form-group">
									<label>1차 분류</label> 
									<span class="category1"></span>
									<label>2차 분류</label> 
									<span class="category2">${goods.cateCode}</span>
									<br>

								</div>
								
								<div class="form-group inputArea">
									<label for="gdsName">상품명</label> 
									<span>${goods.gdsName}</span>
								</div>
								<div class="form-group inputArea">
									<label for="gdsPrice">상품가격</label> 
									<span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
								</div>
								<div class="form-group inputArea">
									<label for="gdsStock">상품수량</label> 
									<span>${goods.gdsStock}</span>
								</div>
								<!-- <div class="form-group">
									<label for="exampleInputFile">File input</label> <input
										type="file" id="exampleInputFile">

									<p class="help-block">Example block-level help text here.</p>
								</div> -->
								<div class="form-group inputArea">
									<label for="gdsDes">상품소개</label>
									<div class="gdsDes">${goods.gdsDes}</div>
								</div>
								<div class="form-group inputArea">
									<label for="gdsImg">상품이미지</label>
									<p>원본 이미지</p>
									<img src="${goods.gdsImg}" class="oriImg"/>
									
									<p>썸네일</p>
									<img src="${goods.gdsThumbImg }" class="thumbImg"/>
								</div>
							
							</div>
							<!-- /.box-body -->

							<div class="box-footer inputArea">
								<button type="button" id="modify_Btn" class="btn btn-primary">수정</button>
								<button type="button" id="delete_Btn" class="btn btn-warning">삭제</button>
								<button type="button" id="back_Btn" class="btn btn-danger">취소</button>
								
							</div>

						</div>
						<!-- /.box -->
					</div>

				</form>
			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../../include/main_footer.jsp"%>


	</div>

	<%@ include file="../../include/plugin_js.jsp"%>
	<script type="text/javascript">
		
		$("#back_Btn").click(function(){
			location.href="/admin/goods/list";
		});
	
		var formObj = $("form[role='form']");
		$("#modify_Btn").click(function(){
			formObj.attr("action","/admin/goods/modify");
			formObj.attr("method","get");
			formObj.submit();
		});
		$("#delete_Btn").click(function(){
			var con =confirm("정말로 삭제하실겁니까?");
			if(con){
				formObj.attr("action","/admin/goods/delete");
				formObj.submit();
			}
			
		});
									
	</script>
</body>
</html>