<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 비밀번호 재입력</title>
</head>
<body onLoad="setTimeout('logout()', 500)">
	<script type="text/javaScript">
		alert('비밀번호를 다시 입력해주세요!');
		function next(){
			location = "UserLoginForm.jsp";
		}
	</script>
</body>
</html>