<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<h3>�α��� ������</h3>
<form id="userinfoForm" action="loginProcess.jsp" method="post">
	<table>
		<tr>
			<td>���̵� : </td>
			<td> <input type="text" name="id"> </td>
		</tr>
		<tr>
			<td>��й�ȣ : </td>
			<td> <input type="text" name="pw"> </td>
		</tr>
		<tr>
			<td align="center">
				<a href="join.jsp"> ȸ������ </a>
			</td>
			<td align="center">
				<input type="submit" value="�α���">
			</td>
		</tr>
	</table>
</form>
</center>

</body>
</html>