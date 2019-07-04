<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->

<html>
<%@ include file="include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<%@ include file="include/main_header.jsp"%>

		<%@ include file="include/left_column.jsp"%>


		<!-- 여기만 잇으면됨 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					업로드 테스트 <small>업로드 Ajax</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class='uploadDiv'>
					<input type='file' name='uploadFile' multiple>

				</div>
				<div class='uploadResult'>
					<ul>


					</ul>
				</div>

				<!-- 사용자가 이미지를 클릭 시 원본 이미지 보여주기 위한 div -->
				<div class='bigPictureWrapper'>
					<div class='bigPicture'></div>
				</div>
				<button id='uploadBtn'>Upload</button>
			</section>
			<!-- /.content -->
		</div>


		<%@ include file="include/main_footer.jsp"%>

		<script src="https://code.jquery.com/jquery-3.4.1.js"
			integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
			crossorigin="anonymous"></script>
	</div>

	<%@ include file="include/plugin_js.jsp"%>
	<script type="text/javascript">
		//썸네일 클릭 시 원본 이미지 보여주기
		function showImage(fileCallPath) {
			//alert(fileCallPath);

			$(".bigPictureWrapper").css("display", "flex").show();

			$(".bigPicture").html(
					"<img src='/display?fileName=" + encodeURI(fileCallPath)
							+ "'>").animate({
				width : '100%',
				height : '100%'
			}, 1000);

			$(".bigPictureWrapper").on("click", function(e) {
				$(".bigPicture").animate({
					width : '0%',
					height : '0%'
				}, 1000);
				setTimeout(function() {
					$('.bigPictureWrapper').hide();
				}, 1000);
			});

		}

		$(document)
				.ready(
						function() {

							//정규식 
							var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
							//5MB 제한
							var maxSize = 5242880;
							
							//삭제버튼 처리
							$(".uploadResult").on("click","span",function(e){
								var targetFile = $(this).data("file");
								var type = $(this).data("type");
								console.log(targetFile);
								
								$.ajax({
									url: '/deleteFile',
									data: {fileName: targetFile,type:type},
									dataType:'text',
									type:'POST',
										success: function(result){
											alert(result);
										}
								});
							});

							function checkExtension(fileName, fileSize) {
								if (fileSize >= maxSize) {
									alert("파일 사이즈 초과");
									return false;
								}

								if (regex.test(fileName)) {
									alert("해당 종류의 파일은 업로드할 수 없습니다.");
									return false;
								}
								return true;
							}

							//파일 업로드후 초기화하기위해 div 복제
							var cloneObj = $(".uploadDiv").clone();

							$("#uploadBtn")
									.on(
											"click",
											function(e) {

												var formData = new FormData();//가상의 form

												var inputFile = $("input[name='uploadFile']");

												var files = inputFile[0].files;

												console.log(files);

												//formData에 파일데이타 추가
												for (var i = 0; i < files.length; i++) {
													if (!checkExtension(
															files[i].name,
															files[i].size)) {
														return false;
													}
													formData.append(
															"uploadFile",
															files[i]);
												}

												$
														.ajax({
															url : '/uploadAjax',
															processData : false,
															contentType : false,
															data : formData,
															type : 'POST',
															dataType : 'json',
															success : function(
																	result) {
																alert("uploaded");
																console
																		.log(result);
																//파일 결과 함수 호출 
																showUploadedFile(result);

																$(".uploadDiv")
																		.html(
																				cloneObj
																						.html());
															}
														});

											});

							var uploadResult = $(".uploadResult ul");
							//파일 결과 보여주기
							function showUploadedFile(uploadResultArr){
								var str = "";
								$(uploadResultArr).each(function(i,obj){
									if(!obj.image){
										var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
										var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
										
										str +="<li><div><a href='/download?fileName="+fileCallPath+"'>"+"<img src='/resources/img/attach.jpg'>"+obj.fileName+"</a>"+"<span data-file=\'"+fileCallPath+"\' data-type='file'>x</span>"+"</div></li>";
									}else{
										//str +="<li>" + obj.fileName + "</li>";
										//썸네일 처리(Get방식)
										var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
										//이미지를 클릭시 원본 이미지 보여주기 위해서 /s 경로를 /로 바꿔준다.생성된 문자열 \때문에 일반문자열과 다르기 때문에 정규화 이용
										var originPath = obj.uploadPath +"\\"+obj.uuid+"_"+obj.fileName;
										originPath = originPath.replace(new RegExp(/\\/g),"/");
										//이미지 썸네일 보여주기 display 지정, 원본 이미지를 보여주기 위해 a태그로 이용하여 자바스크립트 함수 showImage 호출(원본파일경로 파라미터)
										str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a>"+"<span data-file=\'"+fileCallPath+"\' data-type='image'>x</span>"+"</li>";
									}
								});
								uploadResult.append(str);
							}
						});
							
	</script>
</body>
</html>