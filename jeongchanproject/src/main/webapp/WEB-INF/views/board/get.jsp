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

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="../include/main_header.jsp"%>

		<%@ include file="../include/left_column.jsp"%>


		<!-- 여기만 잇으면됨 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					게시글 조회 <small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<form role="form" action="/board/register" method="post">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">번호: ${board.bno}</h3>
							</div>
							<div class="form-group">
								<label>제목</label> <input class="form-control" name="title"
									value='<c:out value="${board.title}"/>' readonly="readonly">
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" name="content" rows="30"
									readonly="readonly"><c:out value="${board.content}" /></textarea>
							</div>
							<div class="form-group">
								<label>작성자</label> <input class="form-control" name="writer"
									value='<c:out value="${board.writer}"/>' readonly="readonly">
							</div>

						</div>



					</form>
					
					<div class="box-footer">
						<button data-oper='list' class="btn btn-primary listBtn">
							<i class="fa fa-list"></i>목록
						</button>
						<c:if test="${login.userId == board.writer}">
						<div class="pull-right">
						
							<button data-oper='modify' class="btn btn-success">
								<i class="fa fa-save"></i>수정
							</button>
						
						</div>
						</c:if>
						<form id='operForm' action="/board/modify" method="get">
							<input type='hidden' id='bno' name='bno'
								value='<c:out value="${board.bno}"/>'>
							<!-- 조회후 목록 갈 때 페이지를 유지하기 위해 파라미터로 넘겨줌 이는 컨토럴로에서 파라미터로 받은것 -->
							<input type='hidden' name='pageNum'
								value='<c:out value="${cri.pageNum}"/>'> <input
								type='hidden' name='amount'
								value='<c:out value="${cri.amount}"/>'> <input
								type='hidden' name='keyword'
								value='<c:out value="${cri.keyword}"/>'> <input
								type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
						</form>
					</div>
					<!-- 첨부파일 -->
					<div class='bigPictureWrapper'>
						<div class='bigPicture'></div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">등록된 첨부파일</div>
								<div class="panel-body">
									<div class='uploadResult'>
										<ul>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
					<!-- 댓글 -->

					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">

								<div class="panel-heading">
									<i class="fa fa-comments fa-fw"></i> Reply
									<c:if test="${not empty login}">
									<button id='addReplyBtn'
										class="btn btn-primary btn-xs pull-right">New Reply</button>
									</c:if>
									<c:if test="${empty login}">
										<a href="/user/login" class="btn btn-default btn-block" role="button">
											<i class="fa fa-edit"></i>댓글을 작성하려면 로그인을 해주세요.
										</a>
									</c:if>
								</div>

								<div class="panel-body">
									<ul class="chat">

									</ul>
								</div>
								<!-- 페이지네이션 -->
								<div class="panel-footer"></div>
							</div>
						</div>
					</div>

				</div>

			</section>
			<!-- /.content -->
		</div>


		<%@ include file="../include/main_footer.jsp"%>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Reply</label> <input class="form-control" name='reply'
								value='New Reply!!!'>
						</div>

						<div class="form-group">
							<label>Replyer</label> <input class="form-control" name='replyer'
								value='${login.userId}' readonly>
						</div>

						<div class="form-group">
							<label>Reply Date</label> <input class="form-control"
								name='replyDate' value=''>
						</div>
					</div>
					<div class="modal-footer">
						
						<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
						<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
						<button id="modalRegisterBtn" type="button"
							class="btn btn-primary">Register</button>
						
						<button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</div>

	<%@ include file="../include/plugin_js.jsp"%>
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script type="text/javascript">
		console.log("============");
		console.log("JS TEST");
		function showImage(fileCallPath){
			//alert(fileCallPath);
			
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
			.animate({width:'100%',height:'100%'},1000);
			
			$(".bigPictureWrapper").on("click",function(e){
				$(".bigPicture").animate({width:'0%',height:'0%'},1000);
				setTimeout(function(){
					$('.bigPictureWrapper').hide();
				},1000);
			});
			
		}
		var bnoValue = '<c:out value="${board.bno}"/>';

		//for Reply add test
		/*replyService.add({reply:"JS Test",replyer:"tester",bno:bnoValue},
		 function(result){
		 alert("RESULT: "+result); //success가 뜰 것임.
		 }
		 );*/
		/*for Reply list test
		 replyService.getList({bno:bnoValue,page:1},function(list){
		 for(var i=0,len=list.length||0; i<len; i++){
		 console.log(list[i]);	
		 }
		 });*/
		/*for Reply delete test
		 replyService.remove(5,function(count){
		 console.log(count);
		 if(count == "success"){
		 alert("REMOVED");
		 }
		 },function(err){
		 alert("ERROR....");
		 });*/

		/*for 댓글 수정 테스트
		 replyService.update({rno:21,bno:bnoValue,reply: "Modified Reply...."},
		 function(result){
		 alert("수정 완료.."+result);
		 },function(err){
		 alert("댓글이 존재하지않는다.");
		 }
		 );*/
		//for 특정 댓글 조회 테스트
		replyService.get(10, function(data) {
			console.log(data);
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");

			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/board/modify").submit();

			});

			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list");
				operForm.submit();
			});
			
			$(".uploadResult").on("click","li",function(e){
				
				console.log("view Image");
				var liObj = $(this);
				
				var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
				
				//이미지 일 경우
				if(liObj.data("type")){
					showImage(path.replace(new RegExp(/\\/g),"/"));
					
				}else{
					//일반파일 경우 다운로드
					self.location="/download?fileName="+path
				}
			});

		});
	</script>
	
	<!-- 첨부파일 조회 -->
<script>
$(document).ready(function(){
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList",{bno:bno},function(arr){
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i,attach){
				
				//image Type
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
					str += "<span> "+attach.fileName+"</span><br/>";
					str += "<img src='/resources/img/attach.jpg'>";
					str += "</div>";
					str += "</li>";
				}
			});
			
			$(".uploadResult ul").html(str);
		});
	})();
});

</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var bnoValue = '<c:out value="${board.bno}"/>';
							var replyUL = $(".chat");

							showList(1);

							function showList(page) {

								replyService
										.getList(
												{
													bno : bnoValue,
													page : page || 1
												},
												function(replyCnt, list) {
													//만약 새 댓글 추가시 showList(-1)로 호출이 되면 아래 실행 마지막 페이지로 이동...
													if (page == -1) {
														pageNum = Math
																.ceil(replyCnt / 10.0);
														showList(pageNum);
														return;
													}

													var str = "";
													if (list == null
															|| list.length == 0) {
														replyUL.html("");
														return;
													}
													for (var i = 0, len = list.length || 0; i < len; i++) {
														str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
														str += "	<div><div class='header'><strong class='primary-font'>"
																+ list[i].replyer
																+ "</strong>";
														str += "	<small class='pull-right text-muted'>"
																+ replyService
																		.displayTime(list[i].replyDate)
																+ "</small></div>";
														str += "	<p>"
																+ list[i].reply
																+ "</p></div></li>";
													}
													replyUL.html(str);
													showReplyPage(replyCnt);
												});
							}

							var modal = $(".modal");
							var modalInputReply = modal
									.find("input[name='reply']");
							var modalInputReplyer = modal
									.find("input[name='replyer']");
							var modalInputReplyDate = modal
									.find("input[name='replyDate']");

							var modalModBtn = $("#modalModBtn");
							var modalRemoveBtn = $("#modalRemoveBtn");
							var modalRegisterBtn = $("#modalRegisterBtn");

							//새로운 댓글 등록 시 에는 필요없는 input창을 없애고 필요없는 버튼도 없앤다.
							$("#addReplyBtn").on(
									"click",
									function(e) {

										modal.find("input[name!='replyer']").val(""); //비우기
										modalInputReplyDate.closest("div")
												.hide(); //날짜 칸 숨기기
										modal.find(
												"button[id!='modalCloseBtn']")
												.hide(); //취소 버튼 제외하고 버튼 숨기기
										modalRegisterBtn.show(); // 등록 취소만 남김

										$(".modal").modal("show"); // 모달 창 보여주기

									});

							//댓글 등록 버튼 클릭시 이벤트
							modalRegisterBtn.on("click", function(e) {

								var reply = {
									reply : modalInputReply.val(),
									replyer : modalInputReplyer.val(),
									bno : bnoValue
								};
								//callback
								replyService.add(reply, function(result) {
									alert(result);

									modal.find("input").val(""); //댓글 등록 후 다시 비우기
									modal.modal("hide"); //그 다음 모달창 숨기기

									showList(-1); // 다시 목록 갱신 해주기 마지막 페이지로 이동ㄴ
								});

							});

							//특정 댓글조회 이벤트 처리 동적 자바스크립트 이기 때문
							$(".chat")
									.on(
											"click",
											"li",
											function(e) {

												var rno = $(this).data("rno");

												//console.log(rno);
												var loginUserId = '<c:out value="${login.userId}"/>';

												replyService
														.get(
																rno,
																function(reply) {
																	modalInputReply
																			.val(reply.reply);
																	modalInputReplyer
																			.val(reply.replyer);
																	modalInputReplyDate
																			.val(
																					replyService
																							.displayTime(reply.replyDate))
																			.attr(
																					"readonly",
																					"readonly");
																	modal
																			.data(
																					"rno",
																					reply.rno); //삭제 수정을 위해서

																	//취소 버튼과 수정 삭제 버튼만 남기기
																	modal
																			.find(
																					"button[id !='modalCloseBtn']")
																			.hide();
																	if(loginUserId == reply.replyer){
																	modalModBtn
																			.show();
																	modalRemoveBtn
																			.show();
																	}
	
																	$(".modal")
																			.modal(
																					"show"); //모달창 띄우기

																});
											});

							//댓글 수정
							modalModBtn.on("click", function(e) {

								var reply = {
									rno : modal.data("rno"),
									reply : modalInputReply.val()
								};

								replyService.update(reply, function(result) {
									alert(result);
									modal.modal("hide");
									showList(pageNum);
								});
							});

							//댓글 삭제
							modalRemoveBtn.on("click", function(e) {

								var rno = modal.data("rno");

								replyService.remove(rno, function(result) {
									alert(result);
									modal.modal("hide");
									showList(pageNum);
								});
							});

							var pageNum = 1;
							var replyPageFooter = $(".panel-footer");
							//페이지네이션
							function showReplyPage(replyCnt) {
								var endNum = Math.ceil(pageNum / 10.0) * 10;
								var startNum = endNum - 9; // 시작페이지 번호

								var prev = startNum != 1;
								var next = false;

								if (endNum * 10 >= replyCnt) {
									endNum = Math.ceil(replyCnt / 10.0);
								}
								if (endNum * 10 < replyCnt) {
									next = true;
								}

								var str = "<ul class='pagination pull-right'>";

								if (prev) {
									str += "<li class='page-item'><a class='page-link' href='"
											+ (startNum - 1)
											+ "'>Previous</a></li>";
								}

								for (var i = startNum; i <= endNum; i++) {
									var active = pageNum == i ? "active" : "";

									str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
											+ i + "</a></li>";

								}

								if (next) {
									str += "<li class='page-item'><a class='page-link' href='"
											+ (endNum + 1) + "'>Next</a></li>";

								}

								str += "</ul></div>";

								console.log(str);

								replyPageFooter.html(str);

							}

							replyPageFooter.on("click", "li a", function(e) {
								e.preventDefault();

								var targetPageNum = $(this).attr("href");

								pageNum = targetPageNum;

								showList(pageNum);
							});
						});
	</script>
</body>
</html>