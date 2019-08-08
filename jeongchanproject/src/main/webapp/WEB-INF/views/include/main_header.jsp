<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="/board/list" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>JC</b>P</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>JeongChan</b>Project</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
        <c:if test="${not empty login}">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown user user-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../../resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${login.userName}</span>
            </a>
            <ul class="dropdown-menu">
              <li class="user-header">
              <img src="../../resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              	<p>${login.userName}
              		<small>
              			가입일자: <fmt:formatDate value="${login.userJoinDate}" pattern="yyyy-MM-dd"/><br>
              			직위: <c:if test="${login.userAdmin eq 1}">상품관리자</c:if><c:if test="${login.userAdmin ne 1}">일반사용자</c:if>
              		</small>
              	</p>
              </li>
              
          
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">게시글</a>
                  </div>
                  <c:if test="${login.userAdmin eq 1}">
                  	<div class="col-xs-4 text-center">
                    	<a href="/admin/adminview">관리자페이지</a>
                  	</div>
                  </c:if>
                  <c:if test="${login.userAdmin ne 1}">
                  	<div class="col-xs-4 text-center">
                    	<a href="/user/upadmin?userId=${login.userId}">관리자계정전환</a>
                  	</div>
                  </c:if>
                  <div class="col-xs-4 text-center">
                    <a href="/board/mylist?writer=${login.userId}">내가쓴글</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="/user/info" class="btn btn-default btn-flat">나의 정보</a>
                </div>
                <c:if test="${kakao eq 1}">
                 <div class="pull-right">
                  <a href="/user/kakaologout" class="btn btn-default btn-flat">카카오로그아웃</a>
                </div>
                </c:if>
                <c:if test="${kakao ne 1}">
                <div class="pull-right">
                  <a href="/user/logout" class="btn btn-default btn-flat">로그아웃</a>
                </div>
                </c:if>
              </li>
            </ul>
          </li>
          </c:if>
          <c:if test="${empty login}">
          	<li class="dropdown user user-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../../resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">회원가입 또는 로그인</span>
            </a>
            <ul class="dropdown-menu">
              <li class="user-header">
              <img src="../../resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              	<p>
              		<b>회원가입 또는 로그인 해주세요!!</b>
              		<small>
              		</small>
              	</p>
              </li>
 
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="/user/register" class="btn btn-default btn-flat"><i class="fa fa-user-plus"></i><b>회원가입</b></a>
                </div>
                <div class="pull-right">
                  <a href="/user/login" class="btn btn-default btn-flat"><i class="glyphicon glyphicon-log-in"></i><b>로그인</b></a>
                </div>
              </li>
            </ul>
          </li>
          </c:if>
        </ul>
      </div>
    </nav>
  </header>