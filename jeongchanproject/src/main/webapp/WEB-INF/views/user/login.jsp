<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/user/login"><b>JeongChan</b>&nbsp Project</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">로그인 페이지</p>

    <form action="/user/loginPost" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="userId" placeholder="아이디">
        <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="userPw" class="form-control" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" name="useCookie"> 로그인 기억
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->

    <a href="#">I forgot my password</a><br>
    <a href="/user/register" class="text-center">회원가입</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<%@ include file="../include/plugin_js.jsp" %>
<script>

  var msg = "${msg}";
  if(msg =="REGISTERED"){
	  alert("이메일 인증을 해주세요.")
  }else if(msg == "FAILURE"){
	  alert("아이디와 비밀번호를 확인해주세요.")
  }
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>
