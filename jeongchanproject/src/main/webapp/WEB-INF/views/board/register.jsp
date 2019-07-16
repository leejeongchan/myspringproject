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
<%@ include file="../include/head.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@ include file="../include/main_header.jsp" %>
  
  <%@ include file="../include/left_column.jsp" %>
  
  
  <!-- 여기만 잇으면됨 -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
                  게시글 등록
        <small>Optional description</small>
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
							<h3 class="box-title">게시글 작성</h3>
						</div>
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="title" placeholder="제목을 입력해주세요.">
						</div>
						<div class="form-group">
							<label>내용</label> <textarea class="form-control" name="content" rows="30" placeholder="제목을 입력해주세요."></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="writer" value="${login.userId}" readonly>
						</div>
					</div>
					<div class="box-footer">
						<button id="listbtn" type="button" class="btn btn-primary"><i class="fa fa-list"></i>목록</button>
						<div class="pull-right">
							<button type="submit" class="btn btn-success"><i class="fa fa-save"></i>저장</button>
							<button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i>초기화</button>
						</div>
					</div>
					
				
				</form>
     	
     	</div>
     	
     	 <!-- 첨부파일 등록 부분 -->
		  
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">File Attach</div>
					<div class="panel-body">
						<div class="form-group uploadDiv">
							<input type="file" name="uploadFile" multiple>
						</div>
						
						<div class='uploadResult'>
							<ul>
							
							</ul>
						</div>
					</div>
				</div>
			</div>
		
     	

    </section>
    <!-- /.content -->
  </div>
 
  <%@ include file="../include/main_footer.jsp" %>

 
</div>

<%@ include file="../include/plugin_js.jsp" %>
<script type="text/javascript">
$(document).ready(
		function() {
			

			$("#listbtn").on("click", function() {
				self.location = "/board/list";
			});
			
			var formObj = $("form[role='form']");
			
			$("button[type='submit']").on("click",function(e){
				e.preventDefault();
				
				console.log("submit clicked");
				
				var str2 = "";
				
				$(".uploadResult ul li").each(function(i,obj){
					var jobj = $(obj);
					
					console.dir(jobj);
					//attachVO 넘겨주기
					str2 += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str2 += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str2 += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str2 += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";

				});
				formObj.append(str2).submit();
			});
			
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //파일 확장자 정규식 
			var maxSize = 5242880; // 5MB
			
			//파일 체크
			function checkExtension(fileName,fileSize){
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			//삭제 
			$(".uploadResult").on("click","button",function(e){
				
				console.log("delete file");
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url:'/deleteFile',
					data: {fileName: targetFile,type:type},
					dataType:'text',
					type:'POST',
					success:function(result){
						alert(result);
						targetLi.remove();
					}
				});
			});
			
			//업로드 파일 보여주기
			function showUploadFile(uploadResultArr){
				
				if(!uploadResultArr || uploadResultArr.length==0){return;}
				
				var uploadResult = $(".uploadResult ul");
				
				var str = "";
				
				$(uploadResultArr).each(function(i,obj){
					console.log("type: "+obj.fileType);
					if(!obj.fileType){ //일반파일 
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						console.log("일반파일");
						console.log("data-filename: "+obj.fileName);
						str += "<li data-path='"+obj.uploadPath+"'";
						str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'";
						str += "><div>";
						str += "<span> "+obj.fileName+"</span>";
						str += "<button data-file=\'"+fileCallPath+"\' data-type='file' type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/img/attach.jpg'>";
						str += "</div>";
						str += "</li>";

					}else{ //이미지파일
						//str +="<li>" + obj.fileName + "</li>";
						//썸네일 처리(Get방식)
						console.log("이미지파일");
						console.log("data-filename: "+obj.fileName);
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
						//이미지를 클릭시 원본 이미지 보여주기 위해서 /s 경로를 /로 바꿔준다.생성된 문자열 \때문에 일반문자열과 다르기 때문에 정규화 이용
						
						str += "<li data-path='"+obj.uploadPath+"'";
						str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'";
						str += "><div>";
						str += "<span> "+obj.fileName+"</span>";
						str += "<button data-file='\'"+fileCallPath+"'\' data-type='image' type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
					
					}
				});
				uploadResult.append(str);
			}
			
			//파일 업로드 시 
			$("input[type='file']").change(function(e){
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
				
				for(var i=0; i<files.length; i++){
					if(!checkExtension(files[i].name,files[i].size)){
						return false;
					}
					formData.append("uploadFile",files[i]);
				}
				
				$.ajax({
					url: '/uploadAjax',
					processData:false,
					contentType:false,
					data:formData,
					type:'POST',
					dataType:'json',
					success:function(result){
						console.log(result);
						showUploadFile(result); //업로드 결과 처리 함수
						
					}
				});
				
			});
			

		});


</script>
</body>
</html>