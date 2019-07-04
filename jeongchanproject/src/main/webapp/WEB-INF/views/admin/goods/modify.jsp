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
</style>
<%@ include file="../../include/head.jsp"%>
<script src="../../../../resources/ckeditor/ckeditor.js"></script>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="../../include/main_header.jsp"%>

		<%@ include file="../../include/left_column.jsp"%>


		<!-- 여기만 잇으면됨 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Jeong Chan Page.... <small>상품관리자 수정페이지</small>
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
   
      
				<form role="form" action="/admin/goods/modify" method="post" enctype="multipart/form-data" autocomplete="off">
					<input type="hidden" name="gdsNum" value="${goods.gdsNum}">
					
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
									<select class="select2 category1"
										style="width: 20%;">
										<option value="">전체</option>
									</select> 
									<label>2차 분류</label>
									 <select class="select2 category2" name="cateCode"
										style="width: 20%;">
										<option value="">전체</option>
									</select> <br>

								</div>
								<div class="form-group inputArea">
									<label for="gdsName">상품명</label> <input type="text"
										class="form-control" id="gdsName" name="gdsName"
										value="${goods.gdsName }"/>
								</div>
								<div class="form-group inputArea">
									<label for="gdsPrice">상품가격</label> <input type="text"
										class="form-control" id="gdsPrice" name="gdsPrice"
										value="${goods.gdsPrice}"/>
								</div>
								<div class="form-group inputArea">
									<label for="gdsStock">상품수량</label> <input type="text"
										class="form-control" id="gdsStock" name="gdsStock"
										value="${goods.gdsStock}"/>
								</div>
								<!-- <div class="form-group">
									<label for="exampleInputFile">File input</label> <input
										type="file" id="exampleInputFile">

									<p class="help-block">Example block-level help text here.</p>
								</div> -->
								<div class="form-group inputArea">
									<label for="gdsDes">상품소개</label>
									<textarea class="form-control" rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes}</textarea>
									<script type="text/javascript">
										var ckeditor_config = {
												resize_enaleb: false,
												enterMode:CKEDITOR.ENTER_BR,
												shiftEnterMode : CKEDITOR.ENTER_P,
												filebrowserUploadUrl : "/admin/goods/ckUpload"
										};
										
										CKEDITOR.replace("gdsDes",ckeditor_config);
									</script>
								</div>
								<div class="form-group inputArea">
									<label for="gdsImg">상품이미지</label>
									<input type="file" id="gdsImg" name="file"/>
									<div class="select_img">
										<img src="${goods.gdsImg}" class="oriImg"/>
										console.log('${goods.gdsImg}');
										<input type="hidden" name="gdsImg" value="${goods.gdsImg}"/>
										<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}"/>
										
									</div>
									<script type="text/javascript">
										$("#gdsImg").change(function(){
											if(this.files && this.files[0]){
												var reader = new FileReader();
												reader.onload = function(data){
													$(".select_img img").attr("src",data.target.result).width(500);
												}
												reader.readAsDataURL(this.files[0]);
												
											}
										});
									</script>
									
								</div>
								
							</div>
							<!-- /.box-body -->

							<div class="box-footer inputArea">
								<button type="submit" id="update_Btn" class="btn btn-primary">수정완료</button>
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
			location.href="/admin/goods/view?n="+${goods.gdsNum};
		});
		//컨트롤러에서 받기
		var jsonData = JSON.parse('${category}');
		console.log(jsonData);

		var cate1Arr = new Array();
		var cate1Obj = new Object();

		//1차 분류 셀렉트 박스에 삽입 데이터 준비
		for (var i = 0; i < jsonData.length; i++) {
			if (jsonData[i].level == "1") {
				cate1Obj = new Object();//초기화
				cate1Obj.cateCode = jsonData[i].cateCode;
				cate1Obj.cateName = jsonData[i].cateName;
				cate1Arr.push(cate1Obj);
			}
		}
		//1차 분류 셀렉트에 넣
		var cate1Select = $("select.category1");
		for (var i = 0; i < cate1Arr.length; i++) {

			cate1Select.append("<option value='"+cate1Arr[i].cateCode+"'>"
					+ cate1Arr[i].cateName + "</option>");

		}

		$(document)
				.on(
						"change",
						"select.category1",
						function() {
							var cate2Arr = new Array();
							var cate2Obj = new Object();

							//2차 분류 셀렉트 박스에 삽입 데이터 준비
							for (var i = 0; i < jsonData.length; i++) {
								if (jsonData[i].level == "2") {
									cate2Obj = new Object(); //초기화
									cate2Obj.cateCode = jsonData[i].cateCode;
									cate2Obj.cateName = jsonData[i].cateName;
									cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;

									cate2Arr.push(cate2Obj);
								}
							}

							//셀렉트에 삽입
							var cate2Select = $("select.category2");

							/*for(var i=0; i<cate2Arr.length; i++){
								cate2Select.append("<option value='"+cate2Arr[i].cateCode+"'>"+cate2Arr[i].cateName +"</option>");
							}*/

							cate2Select.children().remove();
							$("option:selected", this)
									.each(
											function() {
												var selectVal = $(this).val(); //1차 분류 값 저장
												cate2Select
														.append("<option value='"+selectVal+"'>전체</option>");

												//selectVal의 cateCode와 2차 분류 값의 cateCodeRef가 동일 할 때
												for (var i = 0; i < cate2Arr.length; i++) {
													if (selectVal == cate2Arr[i].cateCodeRef) {
														cate2Select
																.append("<option value='"+cate2Arr[i].cateCode+"'>"
																		+ cate2Arr[i].cateName
																		+ "</option>");

													}
												}

											});
						});
		//컨트롤러 수정 부분에서 넘어온 GoodsViewVO의 내용 goods을 가지고 사용
		var select_cateCode = '${goods.cateCode}'; //하위 카테고리
		var select_cateCodeRef = '${goods.cateCodeRef}'; //상위 카테고리
		var select_cateName = '${goods.cateName}';//카테고리 네임
		//하위 카테고리가 존재하면
		if(select_cateCodeRef != null && select_cateCodeRef != '') {
		 $(".category1").val(select_cateCodeRef); //카테고리1에 상위 카테고리 val선택하기
		 $(".category2").val(select_cateCode);
		 $(".category2").children().remove();
		 $(".category2").append("<option value='"
		       + select_cateCode + "'>" + select_cateName + "</option>");
		} else {//하위 없으면
		 $(".category1").val(select_cateCode);//해당 1차 카테고리에 값으로 선택
		 //$(".category2").val(select_cateCode);
		 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
		 $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
		}
	</script>
	<script>
		var regExp = /[^0-9]/gi;
		
		$("#gdsPrice").keyup(function(){ numCheck($(this)); });
		$("#gdsStock").keyup(function(){ numCheck($(this)); });
		
		function numCheck(selector) {
		 var tempVal = selector.val();
		 selector.val(tempVal.replace(regExp, ""));
		}
	</script>
</body>
</html>