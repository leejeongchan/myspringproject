<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
      <c:if test="${empty login}">
     
        <div class="pull-left image">
          <img src="../../resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>게스트</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-danger"></i> OFFLINE</a>
        </div>
      </c:if>
      <c:if test="${not empty login}">
      	<div class="pull-left image">
          <img src="../../resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <c:if test="${login.userAdmin eq 1}">
          	<p>${login.userName}(상품관리자)</p>
          </c:if>
          <c:if test="${login.userAdmin ne 1}">
          	<p>${login.userName}(일반사용자)</p>
          </c:if>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> ONLINE</a>
        </div>
      
      
      </c:if>
      </div>

      <!-- search form (Optional) -->
      <form action="/user/search" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="userId" class="form-control" placeholder="사용자 ID...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">메뉴</li>
        <!-- Optionally, you can add icons to the links -->
        <li><a href="/board/list"><i class="fa fa-link"></i> <span>자유게시판</span></a></li>
        <li><a href="/shop/list?c=200&l=1"><i class="fa fa-link"></i> <span>쇼핑몰</span></a></li>
        <li><a href="/uploadAjax"><i class="fa fa-link"></i><span>업로드 테스트</span></a></li>
        <li><a href="/user/info"><i class="fa fa-link"></i> <span>개인정보 조회</span></a></li>
        <li><a href="/user/userlist"><i class="fa fa-link"></i> <span>회원목록</span></a></li>
        <li><a href="/user/userrank"><i class="fa fa-link"></i> <span>랭킹(1~3위)</span></a></li>
        <li><a href="/chat/chatview"><i class="fa fa-link"></i> <span>익명채팅방</span></a></li>
       	
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>
  <script src="../../resources/bower_components/jquery/dist/jquery.min.js"></script>
  
  <script type="text/javascript">
 	function a(){
 		 var sBtn = $("ul > li"); 
 		  console.log(sBtn);
 		  //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
 		  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
 		   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
 		   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
 		   console.log(this);
 		  })
 	  
 	}
	 
 

 
 
  </script>
