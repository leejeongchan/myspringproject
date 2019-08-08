<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var message = "${message}";
	
	if(message == "LOGOUT"){
		alert("카카오톡 로그아웃 되었습니다.");
		location.href="/user/login";
	}
</script>
</body>
</html>