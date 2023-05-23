<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<row>
<div class="col-sm-6">

		<h1>회원가입</h1>
		<form action="UserJoinCheck.jsp" method="post">
			<input type="text" name="userId" placeholder="아이디를 입력해주세요." class="form-control form-control-lg">
			<input type="password" name="userPw" placeholder="비밀번호를 입력해주세요." class="form-control form-control-lg">
			<input type="text" name="userName" placeholder="이름을 입력해주세요." class="form-control form-control-lg">
			<input type="text" name="userGender" placeholder="성별을 입력해주세요." class="form-control form-control-lg">
			<input type="text" name="userTel" placeholder="전화번호를 입력해주세요." class="form-control form-control-lg">
			
			<input type="submit" value="확인" class="btn btn-primary mb-3">
			<a href="UserLoginForm.jsp">뒤로가기</a>
		</form>
</div>
</row>

</body>
</html>