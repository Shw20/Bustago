<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script language="JavaScript">
 alert('비밀번호를 다시 입력해주세요!');
function next()
{location = "UserLoginForm.jsp";}
</script>
<head>
</head>
<body onLoad="setTimeout('next()', 500)">

</body>
</html>