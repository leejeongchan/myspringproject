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

<%@ include file="../include/head.jsp"%>
<script src="../../../../resources/ckeditor/ckeditor.js"></script>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="../include/main_header.jsp"%>

		<%@ include file="../include/left_column.jsp"%>


		<!-- 여기만 잇으면됨 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
					<!-- Info boxes -->
   
				<form role="form" action="/feed/feedregister" method="post" enctype="multipart/form-data" autocomplete="off">


					<div class="col-md-6">

						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">피드 작성</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->

							<div class="box-body">
								
								<div class="form-group inputArea">
									<label for="feedWriter">작성자</label> <input type="text"
										class="form-control" id="feedWriter" name="feedWriter"
										value="${login.userId}" readonly>
								</div>
								
							
								<div class="form-group inputArea">
									<label for="feedContent">내용</label>
									<textarea class="form-control" rows="5" cols="50" id="feedContent" name="feedContent"></textarea>
									<script type="text/javascript">
										var ckeditor_config = {
												resize_enaleb: false,
												enterMode:CKEDITOR.ENTER_BR,
												shiftEnterMode : CKEDITOR.ENTER_P,
												filebrowserUploadUrl : "/feed/ckUpload"
										};
										
										CKEDITOR.replace("feedContent",ckeditor_config);
									</script>
								</div>
							   
								
								
								
							</div>
							<!-- /.box-body -->

							<div class="box-footer inputArea">
								<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
								<button type="button" id="back_Btn" class="btn btn-danger">취소</button>
							</div>

						</div>
						<!-- /.box -->
					</div>

				</form>
			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../include/main_footer.jsp"%>


	</div>

	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript">
	
		$("#back_Btn").click(function(){
			location.href="/feed/feedlist";
		});
	</script>
	
</body>
</html>