<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script>

  var msg = "${msg}";
  console.log(msg);
  if(msg =="REGISTERED"){
	  alert("카카오로 등록 완료쓰...")
	  self.location="/";

  }
  
</script>
</html>