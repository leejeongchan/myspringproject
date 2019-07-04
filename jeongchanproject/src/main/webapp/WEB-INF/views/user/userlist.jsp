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
        Jeong Chan Page....
        <small>개인정보 조회 페이지</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>
		
    <!-- Main content -->
    <section class="content container-fluid">
		
          		
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">회원 테이블</h3>

              <div class="box-tools pull-right">
                    <span class="label label-danger">회원수: ${count}</span>
                    
                  </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>아이디</th>
                  <th>사용자</th>
                  <th>가입일자</th>
                  <th>추천수</th>
                  <th>자기소개</th>
                </tr>
                <c:forEach var="row" items="${list}">
                <tr>
                <c:choose>
                	<c:when test="${login.userId eq row.userId}">
                		<td>나 : ${row.userId}</td>
                		
                	</c:when>
                	<c:otherwise>
                		<td><a href="/user/search?userId=${row.userId}">${row.userId}</a></td>
                	</c:otherwise>
                </c:choose>
                  <td>${row.userName}</td>
                  <td>가입일자:<fmt:formatDate value="${row.userJoinDate}" dateStyle="full"/></td>
                  <td><span class="label label-success">${row.userLike}</span></td>
                  <td>${row.userSignature}</td>
                </tr>
                </c:forEach>
              </table>
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
            
            <form id="actionForm" action="/user/userlist" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							
			</form>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
          		

      
 
  

  <%@ include file="../include/main_footer.jsp" %>

 
</div>

<%@ include file="../include/plugin_js.jsp" %>
<script type="text/javascript">
$(document)
.ready(
		function() {
			



			
			var actionForm = $("#actionForm");
			
			$(".paginate_button a").on("click",function(e){
				
				e.preventDefault();
				console.log('click');
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
		
			

		});

</script>
</body>
</html>