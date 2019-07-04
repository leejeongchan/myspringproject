<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	var msg = "${message}";
	if(msg == "email"){
		alert("이메일 인증이 되지 않았습니다. 이메일을 재전송 했습니다. 이메일 인증을 해주세요");
		self.location="/user/login";
	}else{
		alert("아이디와 비밀번호를 확인해주세요.");
		self.location="/user/login";	
	}
	
	</script>
</body>
</html>