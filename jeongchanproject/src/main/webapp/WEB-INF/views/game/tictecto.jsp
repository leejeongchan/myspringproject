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
  <style>
        td{
            border:1px solid black;
            width: 50px;
            height: 50px;
            text-align: center;
            font-weight: bold;
            font-size: 35px;
        }
    </style>
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
        <small>틱텍토 게임 페이지</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>
		
    <!-- Main content -->
    <section class="content container-fluid">
		
          <script src="../../../resources/js/tictecto.js"></script>	
    </section>
    <!-- /.content -->
  </div>
  

  <%@ include file="../include/main_footer.jsp" %>

 
</div>

<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>