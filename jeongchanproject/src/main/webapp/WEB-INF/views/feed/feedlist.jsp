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
<style>
.keyw {
	display: inline;
}

</style>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="../include/main_header.jsp"%>

		<%@ include file="../include/left_column.jsp"%>


		<!-- 여기만 잇으면됨 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<a class="btn btn-app" href="/feed/feedwrite"><i class="fa fa-edit"></i>작성</a>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
			<c:forEach items="${feedlist}" var="list">
			
				<div class="row">
					<div class="col-md-6">
						<!-- Box Comment -->
						<div class="box box-widget">
							<div class="box-header with-border">
								<div class="user-block">
									<img class="img-circle"
										src="../../resources/dist/img/user1-128x128.jpg"
										alt="User Image"> <span class="username"><a
										href="#">${list.feedWriter}</a></span> 
										<span class="description">
										<fmt:formatDate value="${list.feedRegdate}" pattern="yyyy/MM/dd"/>
										</span>
								</div>
								<!-- /.user-block -->
								
								<!-- /.box-tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								

								<p id="feedcontent">${list.feedContent}</p>
								
								<button type="button" class="btn btn-default btn-xs">
									<i class="fa fa-thumbs-o-up"></i> Like
								</button>
								<span class="pull-right text-muted">${list.feedLikecnt}likes - ${list.feedReplycnt}
									comments <a href="/feed/feedread?feedBno=${list.feedBno}">>>Details</a></span>
							</div>
							
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				</c:forEach>
				<!-- Modal 등록 -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">Modal title</h4>
										</div>
										<div class="modal-body">처리가 완료되었습니다.</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save
												changes</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->


			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../include/main_footer.jsp"%>


	</div>

	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript">
			$(document).ready(function() {
								//처리 후 리스트로 이동 시에 컨트롤러에서 넘어온 result 받기
								var result = '<c:out value="${result}"/>';
	
								checkModal(result);
	
								//뒤로가기 문제 해결
								history.replaceState({}, null, null);
	
								function checkModal(result) {
									if (result == '' || history.state) {
										return;
									}
	
									if (parseInt(result) > 0) {
										$(".modal-body").html(
												"피드 " + parseInt(result)
														+ " 번이 등록되었습니다.");
									}
	
									$("#myModal").modal("show");
								}
			});
		</script>
</body>
</html>