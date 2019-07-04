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
        <small>최상위 회원 3인</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>
		
    <!-- Main content -->
    <section class="content container-fluid">
		
        <div class="box">
            <div class="box-header">
              <h3 class="box-title">탑 3인방</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-condensed">
                <tr>
                  
                  <th>이름</th>
                  <th>Progress</th>
                  <th style="width: 40px">추천</th>
                </tr>
                <c:forEach var="ranklist" items="${threeList}">
                
                <tr>
                  
                  <td>${ranklist.userName}</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: ${ranklist.userLike}%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">${ranklist.userLike}</span></td>
                </tr>
                </c:forEach>
                
                
              </table>
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