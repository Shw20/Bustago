<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
	<div class="daelimtago" style="
	color:white; font-size: 30px; font-family: fantasy; position: relative; margin:0 auto; font-weight: 700;  margin: 20px;  ">
		<p>대림타고
	</div>
	<div class="Login" style="
	color:white; font-size: 50px; font-family: fantasy; text-align: center; font-weight: 700;  margin: 50px; height: 150px;  ">
		<p>회원가입
	</div>

</head>
<body style="background-color:rgb(135, 92, 255)">
<row>
	<div class="col-sm-6" style="margin: 0 auto;">
		<form name="JoinForm" action="UserJoinCheck.jsp" method="post">
			<input type="text" name="userId" placeholder="학번을 입력해주세요." class="form-control form-control-lg">
			<input type="password" name="userPw" placeholder="비밀번호를 입력해주세요." class="form-control form-control-lg">
			<input type="text" name="userName" placeholder="이름을 입력해주세요." class="form-control form-control-lg">
			<select name="userGender" placeholder="성별을 입력해주세요." class="form-control form-control-lg">
				<option value="">선택</option>
				<option value="여자">여자</option>
				<option value="남자">남자</option>
				<option value="중성">중성</option>
			<input type="text" name="userTel" placeholder="전화번호를 입력해주세요." oninput="autoHyphen(this)" maxlength="13" class="form-control form-control-lg">
			<input type="submit" value="확인" class="btn btn-primary mb-3" onclick="CheckForm()" style="
  font-family: arial;
  font-size: 18px;
  width: 100px;
  height: 50px;">
			<a href="../user/UserLoginForm.jsp" type="button" style="color:white;">뒤로가기</a>
		</form>
	</div>
</row>
<script type="text/javascript">

	

		function CheckForm(){
			
			if(document.JoinForm.userId.value == ""){
				alert("학번을 입력해주세요");
				document.JoinForm.userId.focus();
				return false;
				history.go(-1);
				if(isNaN(document.JoinForm.userId.value.substr(0, 1))){
					alert("학번을 숫자로 입력해주세요!");
					document.LoginForm.userId.focus();
					
					return false;
				}
			} else if(document.JoinForm.userPw.value == ""){
				alert("비밀번호를 입력해주세요");
				document.JoinForm.userPw.focus();
				return false;
			} else if(document.JoinForm.userName.value == ""){
				alert("이름을 입력해주세요");
				document.JoinForm.userName.focus();
				return false;
			} else if(document.JoinForm.userGender.value == ""){
				alert("성별을 선택해주세요");
				document.JoinForm.userGender.focus();
				return false;
			} else if(document.JoinForm.userTel.value == ""){
				alert("전화번호를 입력해주세요");
				document.JoinForm.userTel.focus();
				return false;
			}
			else{
				document.JoinForm.submit();
			}
			
		}
		const autoHyphen = (target) => {
			 target.value = target.value
			   .replace(/[^0-9]/g, '')
			  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
		
		//$(document).on("keyup", ".userTel", function() { 
		//	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		//});
		
		//$(document).on("keyup", ".phoneNumber", function() { 
		//		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		//	});
</script>
</body>
</html>