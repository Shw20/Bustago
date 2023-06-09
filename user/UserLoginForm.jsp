<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Login.css">
<title>login</title>
<div class="Title">
	<div class="daelimtago" style="
	color:white; font-size: 30px; font-family: fantasy; position: relative; margin:0 auto; font-weight: 700;  margin: 20px;  ">
		<p>대림타고
	</div>
	<div class="Login" style="
	color:white; font-size: 50px; font-family: fantasy; text-align:center; font-weight: 700;  margin: 50px; height: 150px;  ">
		<p>로그인
	</div>
	
</div>
</head>
<body style="background-color:rgb(135, 92, 255)">
<row>
<div class="col-sm-5" style="
margin:0 auto;">
	<form action="http://localhost:8080/daelimtago/user/UserLoginCheck.jsp" name="LoginForm" method="post">
		<input type="text" name="userId" placeholder="학번을 입력해주세요." class="form-control form-control-lg">
		<input type="password" name="userPw" placeholder="비밀번호를 입력해주세요" class="form-control form-control-lg">
		<input type="submit" value="로그인" class="btn btn-primary mb-3" onclick="checkform()" style="
  font-family: arial;
  font-size: 18px;
  width: 100px;
  height: 50px;"> 
		<a href="../UserJoinForm.jsp" style="color:white;">회원가입</a>
	</form>
</div>
</row>

<script type="text/javascript">
		function checkform(){
			var userId = document.getElementById("userId").value;
			var userPw = document.getElementById("userPw").value;
			
			if(userId == ""){
				alert("학번을 입력해주세요");
				document.LoginForm.userId.focus();
				return false;
			} else if(userPw == ""){
				alert("비밀번호를 입력해주세요");
				document.LoginForm.userPw.focus();
				return false;
			}
			
			if(!userId.length == 9){
				alert("학번 9자리를 입력해주세요!");
				document.LoginForm.userId.focus();
				return false;
			}
			else if(isNaN(document.LoginForm.userId.value.substr(0, 1))){
				alert("학번을 숫자로 입력해주세요!");
				document.LoginForm.userId.focus();
				return false;
			}
			else if( ! (userPw.length >= 4 || userPw.length <= 12)) {
				alert("비밀번호는 4~12 사이로 입력해주세요!");
				document.LoginForm.userPw.focus();
				return false;
			}
			
			alert('로그인 성공!');
			document.LoginForm.submit();
			return false;
		}
</script>
</body>
</html>