<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="/user/register"><b>JeongChan</b>&nbsp Project</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">회원가입 페이지</p>

    <form id='regForm' action="/user/register" method="post">
      <div id="divInputId" class="form-group has-feedback">
        <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
        <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
        <input type="button" class="btn btn-default" style="width: 30%;" value="중복확인" onclick="duplicationId();" />
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group">                   
		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    	<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
	  </div>
	  <div class="form-group">
	    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
	  </div>
	  <div class="form-group">
	    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
   	  </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" id="userPw2" placeholder="비밀번호 확인">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> I agree to the <a href="#">terms</a>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" id="regBtn" class="btn btn-primary btn-block btn-flat">가입</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
        Google+</a>
    </div>

    <a href="/user/login" class="text-center">로그인</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<%@ include file="../include/plugin_js.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
<script type="text/javascript">

function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
	//아이디 중복 체크 AJAX
	var isCheckId = 0;
	function duplicationId () {
		var inputId = $("#userId").val();
		$.ajax({
			async: false,
			type: "post",
			url: "/user/idcheck",
			contentType: "application/json; charset=UTF-8",
			data: inputId,
			success: function (data) {
				console.log("data?: "+data);
				if(data == "S") {
					alert("사용가능한 아이디입니다.");
					
					$("#divInputId").addClass("has-success")
					$("#divInputId").removeClass("has-error")
					
					$("#userName").focus();
					isCheckId = 1;
				} else {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					
					$("#divInputId").addClass("has-error")
					$("#divInputId").removeClass("has-success")
					
					$("#userId").focus();
				}
			},
			error: function(req, status, errThrown) {
				alert("network error occur");
			}
		});
	}



	var regForm = $("#regForm");
	$("#regBtn").on("click",function(e){
		e.preventDefault();
		var userid = $("#userId").val();
	    var userpwd = $("#userPw").val();
	    var inputPwdCfm = $("#userPw2").val();
	    var username = $("#userName").val();
	    var email = $("#userEmail").val();
	    var addr1 = $("#addr1").val();
	    var addr2 = $("#addr2").val();
	    var addr3 = $("#addr3").val();
	    
	    if(userid.length == 0){
	        alert("아이디를 입력해 주세요"); 
	        $("#userId").focus();
	        return false;
	    }
	    
	    if(isCheckId == 0 ){
	    	alert("아이디 중복 체크 해주세요.");
	    	$("#userId").focus();
	    	return false;
	    }
	    
	    if(username.length == 0){
	        alert("이름을 입력해주세요");
	        $("#userName").focus();
	        return false;
	    }
	    
	    if(email.length == 0){
	        alert("이메일을 입력해주세요");
	        $("#userEmail").focus();
	        return false;
	    }
	    
	    if(addr1.length == 0){
	    	alert("주소를 입력해주세요");
	    	$("#addr1").focus();
	    	return false;
	    }
	    if(addr2.length == 0){
	    	alert("주소를 입력해주세요");
	    	$("#addr2").focus();
	    	return false;
	    }
	    if(addr3.length == 0){
	    	alert("주소를 입력해주세요");
	    	$("#addr3").focus();
	    	return false;
	    }
	    
	    
	    if(userpwd.length == 0){
	        alert("비밀번호를 입력해 주세요"); 
	        $("#userPw").focus();
	        return false;
	    }
	 
	    if(userpwd != inputPwdCfm){
	        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
	        $("#userPw2").focus();
	        return false; 
	    }
	 
	   
	    if(confirm("회원가입을 하시겠습니까?")){
	        
	        regForm.submit();
	    }
	});
	

</script>


</body>
</html>
