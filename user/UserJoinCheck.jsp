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
	
	Class.forName("com.mysql.jdbc.Driver");
	String db_address = "jdbc:mysql://localhost:3306/bustago";
	String db_username = "root";
	String db_pwd = "abcd1234";

	try {
		
		Connection con = DriverManager.getConnection(db_address, db_username, db_pwd);
		
		String sql = "INSERT INTO member(mb_NO, mb_PW, mb_Name, mb_Gender, mb_Tel) VALUES(?, ?, ?, ?, ?)";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, uId);
		pstmt.setString(2, uPw);
		pstmt.setString(3, uName);
		pstmt.setString(4, uGender);
		pstmt.setString(5, uTel);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			session.setAttribute("m_Nm", uId);
			response.sendRedirect("http://localhost:8080/daelimtago/user/JoinSuccess.jsp");
		} else {
			response.sendRedirect("http://localhost:8080/daelimtago/user/JoinFail.jsp");
		}
	}catch(Exception e) {
		e.printStackTrace();
		out.println("오류가 발생했습니다. 오류 메시지 : " + e.getMessage());
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	

</body>
</html>