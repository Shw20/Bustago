<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%
	request.setCharacterEncoding("UTF-8"); 
	String uId = request.getParameter("userId");
	String uPw = request.getParameter("userPw");
	String uName = request.getParameter("userName");
	String uGender = request.getParameter("userGender");
	String uTel = request.getParameter("userTel");
	
	PreparedStatement pstmt = null;
	
	String dbType = "com.mysql.jdbc.Driver";
	String userUrl = "jdbc:mysql://localhost:3306/bustago?serverTimeZone=UTC&useSSL=false";
	String userId = "root";
	String userPw = "abcd1234";

	try {
		Class.forName(dbType);
		
		Connection con = DriverManager.getConnection(userUrl, userId, userPw);
		
		String sql = "INSERT INTO member(mb_NO, mb_PW, mb_Name, mb_Gender, mb_Tel) VALUES(?, ?, ?, ?, ?)";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, uId);
		pstmt.setString(2, uPw);
		pstmt.setString(3, uName);
		pstmt.setString(4, uGender);
		pstmt.setString(5, uTel);
		
		pstmt.executeUpdate();
		
		con.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><strong><%= uId %>님 환영합니다!</strong></p>
	<p><strong><a href="../user/UserLoginForm.jsp">로그인하기</a></strong></p>
	
	

</body>
</html>