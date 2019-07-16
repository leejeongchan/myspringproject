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
	.keyw{
		display:inline;
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
				
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">내가 쓴 게시글 목록</h3>
						</div>
						<div class="box-body">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th style="width: 30px">#</th>
										<th>제목</th>
										<th style="width: 100px">작성자</th>
										<th style="width: 150px">작성일</th>
										<th style="width: 150px">수정일</th>
										<th style="width: 80px">첨부파일</th> 
										<th style="width: 60px">조회</th>
									</tr>
									<c:forEach items="${mylist}" var="board" varStatus="status">
										<tr>
											<td><c:out value="${(pageMaker.total-status.index)-((pageMaker.cri.pageNum-1)*10)}" /></td>
											<!-- 자바스크립트로 이동 처리하기 페이지 이동후 게시글 조회후 다시 목록으로 이동시 1페이지로 이동하는것을 방지 -->
											<td><a
												 class='move' href='<c:out value='${board.bno}'/>'><c:out
														value="${board.title}" /></a><span class="badge bg-teal"><i class="fa fa-comment-o"></i>+<c:out value="${board.replyCnt }"/></span></td>
											<td><c:out value="${board.writer}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${board.regdate}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${board.updateDate}" /></td>
											<td><span class="badge bg-red"><c:out
														value="${board.filecnt}" /></span></td>		
											<td><span class="badge bg-red"><c:out
														value="${board.viewcnt}" /></span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>


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

						</div>
						<div class="box-footer">
							<div class="pull-right">
								<button id='regBtn' type="button" class="btn btn-xs pull-right">글
									쓰기</button>
							</div>



						</div>

					</div>
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
								<!-- href값을 페이지 번호로 대체하여 이를 자바스크립트에서 href값을 통해 form 태그 내 input hidden에 값을 대체하여 form으로 submit -->
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button previous"><a
										href="${pageMaker.startPage-1}">이전</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li
										class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' :''}"><a
										href="${num}">${num}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next}">
									<li class="paginate_button next"><a
										href="${pageMaker.endPage+1}">다음</a></li>
								</c:if>

							</ul>


						</div>
						<!-- 위에서 클래스 id가 move인 것을 통해 해당 페이지 번호와 게시글 번호 amount를 전달 이는 밑 자바스크립트에서 기능 구현
				동적으로 append로 추가하기 -->
						<form id="actionForm" action="/board/mylist" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						</form>
						
				
					
						
					</div>

				</div>

			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../include/main_footer.jsp"%>


	</div>

	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
						

			

							//뒤로가기 문제 해결
							history.replaceState({}, null, null);

					
							
							var actionForm = $("#actionForm");
							
							$(".paginate_button a").on("click",function(e){
								
								e.preventDefault();
								console.log('click');
								
								actionForm.find("input[name='pageNum']").val($(this).attr("href"));
								actionForm.submit();
							});
							
							$(".move").on("click",function(e){
								e.preventDefault();
								actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
								actionForm.attr("action","/board/get");
								actionForm.submit();
							});
							
				
							

						});
	</script> 
</body>
</html>