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
        <small>개인정보 수정 페이지</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>
		
    <!-- Main content -->
    <section class="content container-fluid">
		
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">개인정보 수정</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action="/user/infomodify" method="post" role="form">
              <input type="hidden" name="userId" value="${login.userId}">
              <input type="hidden" name="userName" value="${login.userName}">
              <input type="hidden" name="userEmail" value="${login.userEmail}">
			  <input type="hidden" name="userPw" value="${login.userPw}">
			  <input type="hidden" name="addr1" value="${login.addr1}">
              <input type="hidden" name="addr2" value="${login.addr2}">
              <input type="hidden" name="addr1" value="${login.addr3}">
              <input type="hidden" name="userLoginDate" value="<fmt:formatDate value="${login.userJoinDate}" pattern="yyyy/MM/dd"/>">
              <input type="hidden" name="userLike" value="${login.userLike}">
              <input type="hidden" name="userAdmin" value="${login.userAdmin}">
              <div class="box-body">
                <div class="form-group">
                  <label for="Signature">자기소개글</label>
                  <input type="text" class="form-control" id="userSignature" name="userSignature" value="${login.userSignature}">
                </div>
                <div class="form-group">
                  <label for="school">학교</label>
                  <input type="text" class="form-control" id="school" name="school" value="${login.school}">
                </div>
                <div class="form-group">
                  <label for="skill1">주 기술1</label>
                  <input type="text" class="form-control" id="userSkill1" name="userSkill1" value="${login.userSkill1}">
                </div>
                
                <div class="form-group">
                  <label for="skill1">주 기술2</label>
                  <input type="text" class="form-control" id="userSkill2" name="userSkill2" value="${login.userSkill2}">
                </div>
                 <div class="form-group">
                  <label for="skill1">가입 일</label>
                  <input type="text" class="form-control" id="userJoinDate" name="userJoinDate" value="<fmt:formatDate value="${login.userJoinDate}" pattern="yyyy/MM/dd"/>" readonly>
                </div>
              
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">수정완료</button>
              </div>
            </form>
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