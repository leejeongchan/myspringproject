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
		
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="../../resources/dist/img/user2-160x160.jpg" alt="User profile picture">
			<c:if test="${login.userAdmin eq 1}">
				<h3 class="profile-username text-center">${login.userName}(상품관리자)</h3>
			</c:if>
			<c:if test="${login.userAdmin ne 1 }">
				<h3 class="profile-username text-center">${login.userName}(일반사용자)</h3>
			</c:if>
              

              <p class="text-muted text-center">${login.userSignature}</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>아이디</b> <a class="pull-right">${login.userId}</a>
                </li>
                <li class="list-group-item">
                  <b>이메일</b> <a class="pull-right">${login.userEmail}</a>
                </li>
                <li class="list-group-item">
                  <b>가입일자</b> <a class="pull-right"><fmt:formatDate value="${login.userJoinDate}" dateStyle="full"/></a>
                </li>
                <li class="list-group-item">
		              <span class="info-box-text">Likes</span>
		              <span class="info-box-number">${login.userLike}</span>
                </li>
              </ul>

              <a href="/user/infomodify" class="btn btn-primary btn-block"><b>정보 수정</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">${login.userName}님의 소개</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 학교</strong>

              <p class="text-muted">
				${login.school}
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 주소</strong>

              <p class="text-muted">${login.addr1},${login.addr2},${login.addr3}</p>

              <hr>

              <strong><i class="fa fa-pencil margin-r-5"></i> 내 기술</strong>

              <p>
                <span class="label label-danger">${login.userSkill1}</span>
                <span class="label label-success">${login.userSkill2}</span>
                
              </p>

              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> 간단 소개글</strong>

              <p>${login.userSignature}</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        
		

    </section>
    <!-- /.content -->
  </div>
  

  <%@ include file="../include/main_footer.jsp" %>

 
</div>

<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>