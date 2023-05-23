<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<title>login</title>
</head>
<body>
<row>
<div class="col-sm-5">
	<form action="http://localhost:8080/Bustago/user/UserLoginCheck.jsp" method="post">
		<input type="text" name="userId" placeholder="아이디를 입력해주세요." class="form-control-lg">
		<input type="password" name="userPw" placeholder="비밀번호를 입력해주세요" class="form-control from-control-lg">
		<input type="submit" value="로그인" class="btn btn-primary mb-3"> 
		<a href="../UserJoinForm.jsp">회원가입</a>
	</form>
</div>
</body>
</html>
