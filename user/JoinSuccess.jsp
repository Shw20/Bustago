<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<%
	String userId = (String) session.getAttribute("m_Nm");
%>
<meta charset="utf-8">
<title>JoinSuccess</title>
</head>
<body>
	<p><strong><%=userId %>님 환영합니다!</strong></p>
	<p><strong><a href="../user/UserLoginForm.jsp">로그인하기</a></strong></p>
</body>
</html>