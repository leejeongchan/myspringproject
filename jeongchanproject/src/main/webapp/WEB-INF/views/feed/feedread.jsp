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
				
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
			
			
				<div class="row">
					<div class="col-md-6">
						<!-- Box Comment -->
						<div class="box box-widget">
							<div class="box-header with-border">
								<div class="user-block">
									<img class="img-circle"
										src="../../resources/dist/img/user1-128x128.jpg"
										alt="User Image"> <span class="username"><a
										href="#">${feedread.feedWriter}</a></span> 
										<span class="description">
										<fmt:formatDate value="${feedread.feedRegdate}" pattern="yyyy/MM/dd"/>
										</span>
								</div>
								<!-- /.user-block -->
								
								<!-- /.box-tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								

								<p>${feedread.feedContent}</p>
								
								<button type="button" class="btn btn-default btn-xs">
									<i class="fa fa-thumbs-o-up"></i> Like
								</button>
								<span class="pull-right text-muted">${feedread.feedLikecnt}likes - ${feedread.feedReplycnt}
									comments </span>
							</div>
							<!-- /.box-body -->
                     <div class="box-footer box-comments">
                        <div class="box-comment">
                           <!-- User image -->
                           <img class="img-circle img-sm"
                              src="../../resources/dist/img/user3-128x128.jpg"
                              alt="User Image">

                           <div class="comment-text">
                              <span class="username"> Maria Gonzales <span
                                 class="text-muted pull-right">8:03 PM Today</span>
                              </span>
                              <!-- /.username -->
                              It is a long established fact that a reader will be distracted
                              by the readable content of a page when looking at its layout.
                           </div>
                           <!-- /.comment-text -->
                        </div>
                        <!-- /.box-comment -->
                        <div class="box-comment">
                           <!-- User image -->
                           <img class="img-circle img-sm"
                              src="../../resources/dist/img/user4-128x128.jpg"
                              alt="User Image">

                           <div class="comment-text">
                              <span class="username"> Luna Stark <span
                                 class="text-muted pull-right">8:03 PM Today</span>
                              </span>
                              <!-- /.username -->
                              It is a long established fact that a reader will be distracted
                              by the readable content of a page when looking at its layout.
                           </div>
                           <!-- /.comment-text -->
                        </div>
                        <!-- /.box-comment -->
                     </div>
                     <!-- /.box-footer -->
                     <div class="box-footer">
                        <form action="#" method="post">
                           <img class="img-responsive img-circle img-sm"
                              src="../../resources/dist/img/user4-128x128.jpg"
                              alt="Alt Text">
                           <!-- .img-push is used to add margin to elements next to floating images -->
                           <div class="img-push">
                              <input type="text" class="form-control input-sm"
                                 placeholder="Press enter to post comment">
                           </div>
                        </form>
                     </div>
                     <!-- /.box-footer -->
							
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				
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